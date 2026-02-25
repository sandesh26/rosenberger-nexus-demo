module.exports = {
  apps: [
    {
        // Keep this name in sync with deploy_pm2.sh which references
        // the process as `rosenberger-nexus` when reloading/logging.
        name: 'rosenberger-nexus',

        // Ensure PM2 runs the app from the repository root so `npm run start`
        // finds the project's package.json. Using __dirname points to the
        // directory containing this ecosystem file (the repo root).
        cwd: __dirname,

      script: 'npm',
      args: 'run start',
      env: {
        NODE_ENV: 'production',
        // set PORT via environment or pass as arg to the deploy script
      },
      env_production: {
        NODE_ENV: 'production'
      }
    }
  ]
}
