#!/usr/bin/env node
/**
 * Simple Node.js script to test Microsoft Graph client-credentials flow
 *
 * Usage (env vars preferred):
 *  TENANT_ID=... CLIENT_ID=... CLIENT_SECRET=... SENDER_EMAIL=... RECIPIENTS="a@x.com,b@y.com" node scripts/m365-client-credentials-test.js
 *
 * Or with flags:
 *  node scripts/m365-client-credentials-test.js --tenant <tenant> --client <id> --secret <secret> --sender sender@org.com --recipients a@x.com,b@y.com
 *
 * Notes:
 * - App must have Mail.Send application permission and be admin-consented.
 * - Sending as a user requires the app to have proper application permissions and the sender user must exist.
 */

const argv = require('node:process').argv.slice(2);
const args = {};
for (let i = 0; i < argv.length; i++) {
  const a = argv[i];
  if (a.startsWith('--')) {
    const key = a.replace(/^--/, '');
    const val = argv[i + 1] && !argv[i + 1].startsWith('--') ? argv[++i] : true;
    args[key] = val;
  }
}

const TENANT_ID = '';
const CLIENT_ID = '';
const CLIENT_SECRET = '';
const SENDER_EMAIL = 'rosenberger-Nexus-Notification@rosenberger.in';
const RECIPIENTS = 'aman.kholker@rosenberger.in'
const SUBJECT = 'Test email from M365 client-credentials script';
const BODY = 'This is a test message.';

function parseRecipients(raw) {
  if (!raw) return [];
  return raw.split(',').map(s => s.trim()).filter(Boolean);
}

async function ensureFetch() {
  if (typeof fetch !== 'undefined') return fetch;
  try {
    // try dynamic require of node-fetch (v3 export default)
    const nf = await import('node-fetch');
    return nf.default || nf;
  } catch (e) {
    console.error('Global fetch not found and node-fetch is not installed. Install with: npm install node-fetch');
    process.exit(1);
  }
}

async function getToken(tenantId, clientId, clientSecret) {
  const fetch = await ensureFetch();
  const url = `https://login.microsoftonline.com/${tenantId}/oauth2/v2.0/token`;
  const body = new URLSearchParams();
  body.append('client_id', clientId);
  body.append('client_secret', clientSecret);
  body.append('scope', 'https://graph.microsoft.com/.default');
  body.append('grant_type', 'client_credentials');

  const res = await fetch(url, { method: 'POST', body, headers: { 'Content-Type': 'application/x-www-form-urlencoded' } });
  if (!res.ok) {
    const txt = await res.text();
    throw new Error(`Token request failed: ${res.status} ${res.statusText} - ${txt}`);
  }
  return res.json();
}

async function sendMail(accessToken, senderEmail, recipients, subject, bodyText) {
  const fetch = await ensureFetch();
  const url = `https://graph.microsoft.com/v1.0/users/${encodeURIComponent(senderEmail)}/sendMail`;
  const toRecipients = recipients.map(r => ({ emailAddress: { address: r } }));
  const payload = {
    message: {
      subject,
      body: {
        contentType: 'Text',
        content: bodyText,
      },
      toRecipients
    },
    saveToSentItems: 'false'
  };

  const res = await fetch(url, { method: 'POST', headers: { Authorization: `Bearer ${accessToken}`, 'Content-Type': 'application/json' }, body: JSON.stringify(payload) });
  if (!res.ok) {
    const txt = await res.text();
    throw new Error(`SendMail failed: ${res.status} ${res.statusText} - ${txt}`);
  }
  return res.status;
}

async function main() {
  if (!TENANT_ID || !CLIENT_ID || !CLIENT_SECRET || !SENDER_EMAIL) {
    console.error('Missing required config. Provide TENANT_ID, CLIENT_ID, CLIENT_SECRET, SENDER_EMAIL and RECIPIENTS (or use flags).');
    console.error('Example: TENANT_ID=... CLIENT_ID=... CLIENT_SECRET=... SENDER_EMAIL=sender@org.com RECIPIENTS="a@x.com,b@y.com" node scripts/m365-client-credentials-test.js');
    process.exit(1);
  }

  const recipients = parseRecipients(RECIPIENTS);
  if (recipients.length === 0) {
    console.error('No recipients provided. Use RECIPIENTS env var or --recipients flag with comma-separated emails.');
    process.exit(1);
  }

  console.log('Requesting access token...');
  const tokenResp = await getToken(TENANT_ID, CLIENT_ID, CLIENT_SECRET);
  if (!tokenResp.access_token) {
    console.error('No access_token returned:', tokenResp);
    process.exit(1);
  }
  console.log('Access token received (masked):', tokenResp.access_token.slice(0, 8) + '...' + tokenResp.access_token.slice(-8));

  console.log(`Sending mail from ${SENDER_EMAIL} to ${recipients.join(', ')}`);
  const status = await sendMail(tokenResp.access_token, SENDER_EMAIL, recipients, SUBJECT, BODY);
  console.log('Mail send response status:', status);
}

main().catch(err => {
  console.error('Error:', err.message || err);
  process.exit(1);
});
