module.exports = {
  apps: [
    {
      name: 'rosenberger',
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
