const path = require('path')

module.exports = {
  apps: [
    {
      name: 'rosenberger-nexus',
      // Run PM2 from repository root, not scripts/deploy
      cwd: __dirname,
      script: 'npm',
      args: 'run start',
      env: { NODE_ENV: 'production' },
      autorestart: true,
      watch: false
    },
    {
      name: 'audit-cron',
      // Dedicated worker that initializes DB-backed schedules
      cwd: __dirname,
      script: 'npm',
      args: 'run start:cron',
      env: {
        NODE_ENV: 'production',
        SMTP_HOST: process.env.SMTP_HOST,
        SMTP_PORT: process.env.SMTP_PORT,
        SMTP_USER: process.env.SMTP_USER,
        SMTP_PASS: process.env.SMTP_PASS,
      },
      autorestart: true,
      watch: false
    },
  ]
}
