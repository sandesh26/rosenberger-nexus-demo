# Deployment scripts for rosenberger-nexus

This folder contains the deployment helper script `deploy_pm2.sh` used to build the Next.js app, apply Prisma migrations, and start the app with PM2.

Prerequisites
- Node.js, npm, npx available on the server
- `pm2` installed globally (`npm install -g pm2`)
- Environment variables set: `DATABASE_URL`, optionally `PORT`, any app secrets (e.g. `NEXTAUTH_SECRET`)

Usage

1. Make script executable:

```bash
chmod +x scripts/deploy/deploy_pm2.sh
```

2. Run the script (example on port 3000):

```bash
export DATABASE_URL='mysql://rn_user:strong_password@localhost:3306/rosenberger_nexus'
export PORT=3000
./scripts/deploy/deploy_pm2.sh 3000
```

What the script does
- Runs `npx prisma generate`
- Runs `npx prisma migrate deploy`
- Runs `npm run build`
- Starts (or reloads) the app via PM2 using the repository `ecosystem.config.js`

Additionally, after building the project the script moves the build artifacts into a `build/` folder
and creates symlinks (`.next` and `public`) pointing back to `build/` so the app can be
archived or inspected while `next start` continues to work from the project root.

Notes
- The script assumes you run it from the project root.
- Check logs with `pm2 logs rosenberger-nexus --lines 200`.
- To enable PM2 on reboot, run the `pm2 startup` output command as root and then `pm2 save`.
