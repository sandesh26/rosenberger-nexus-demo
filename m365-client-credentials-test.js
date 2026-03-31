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

var argv = process.argv.slice(2);
var args = {};
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

var querystring = require('querystring');
var https = require('https');

function parseRecipients(raw) {
  if (!raw) return [];
  return raw.split(',').map(function(s) { return s.trim(); }).filter(Boolean);
}

function getToken(tenantId, clientId, clientSecret) {
  return new Promise(function(resolve, reject) {
    var postData = querystring.stringify({
      client_id: clientId,
      client_secret: clientSecret,
      scope: 'https://graph.microsoft.com/.default',
      grant_type: 'client_credentials'
    });

    var options = {
      hostname: 'login.microsoftonline.com',
      path: '/' + tenantId + '/oauth2/v2.0/token',
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(postData)
      }
    };

    var req = https.request(options, function(res) {
      var data = '';
      res.on('data', function(chunk) { data += chunk; });
      res.on('end', function() {
        try {
          if (res.statusCode < 200 || res.statusCode >= 300) return reject(new Error('Token request failed: ' + res.statusCode + ' - ' + data));
          var json = JSON.parse(data);
          resolve(json);
        } catch (e) {
          reject(e);
        }
      });
    });

    req.on('error', function(e) { reject(e); });
    req.write(postData);
    req.end();
  });
}

function sendMail(accessToken, senderEmail, recipients, subject, bodyText) {
  return new Promise(function(resolve, reject) {
    var payload = JSON.stringify({
      message: {
        subject: subject,
        body: { contentType: 'Text', content: bodyText },
        toRecipients: recipients.map(function(r) { return { emailAddress: { address: r } }; })
      },
      saveToSentItems: 'false'
    });

    var options = {
      hostname: 'graph.microsoft.com',
      path: '/v1.0/users/' + encodeURIComponent(senderEmail) + '/sendMail',
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Content-Length': Buffer.byteLength(payload),
        'Authorization': 'Bearer ' + accessToken
      }
    };

    var req = https.request(options, function(res) {
      var data = '';
      res.on('data', function(chunk) { data += chunk; });
      res.on('end', function() {
        if (res.statusCode < 200 || res.statusCode >= 300) return reject(new Error('SendMail failed: ' + res.statusCode + ' - ' + data));
        resolve(res.statusCode);
      });
    });

    req.on('error', function(e) { reject(e); });
    req.write(payload);
    req.end();
  });
}

function main() {
  if (!TENANT_ID || !CLIENT_ID || !CLIENT_SECRET || !SENDER_EMAIL) {
    console.error('Missing required config. Provide TENANT_ID, CLIENT_ID, CLIENT_SECRET, SENDER_EMAIL and RECIPIENTS (or use flags).');
    console.error('Example: TENANT_ID=... CLIENT_ID=... CLIENT_SECRET=... SENDER_EMAIL=sender@org.com RECIPIENTS="a@x.com,b@y.com" node scripts/m365-client-credentials-test.js');
    process.exit(1);
  }

  var recipients = parseRecipients(RECIPIENTS);
  if (recipients.length === 0) {
    console.error('No recipients provided. Use RECIPIENTS env var or --recipients flag with comma-separated emails.');
    process.exit(1);
  }

  console.log('Requesting access token...');
  getToken(TENANT_ID, CLIENT_ID, CLIENT_SECRET).then(function(tokenResp) {
    if (!tokenResp || !tokenResp.access_token) {
      console.error('No access_token returned:', tokenResp);
      process.exit(1);
    }
    var masked = tokenResp.access_token.slice(0,8) + '...' + tokenResp.access_token.slice(-8);
    console.log('Access token received (masked):', masked);
    console.log('Sending mail from ' + SENDER_EMAIL + ' to ' + recipients.join(', '));
    return sendMail(tokenResp.access_token, SENDER_EMAIL, recipients, SUBJECT, BODY);
  }).then(function(status) {
    console.log('Mail send response status:', status);
  }).catch(function(err) {
    console.error('Error:', err && err.message ? err.message : err);
    process.exit(1);
  });
}

main();
