const path = require('path')

module.exports = {
  apps: [
    {
      name: 'rosenberger-nexus',
      // Run PM2 from repository root, not scripts/deploy
      cwd: require('path').resolve(__dirname, '../../'),
      script: 'npm',
      args: 'run start',
      env: { NODE_ENV: 'production' },
      autorestart: true,
      watch: false
    },
    // {
    //   name: 'audit-cron',
    //   // Dedicated worker that initializes DB-backed schedules
    //   cwd: require('path').resolve(__dirname, '../../'),
    //   script: 'npm',
    //   args: 'run start:cron',
    //   env: {
    //     NODE_ENV: 'production'
    //   },
    //   autorestart: true,
    //   watch: false
    // },
  ]
}
