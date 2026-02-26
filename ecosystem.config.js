const path = require('path')

module.exports = {
  apps: [
    {
        name: 'rosenberger-nexus',
      // Run PM2 from the repository root so the copied package.json
      // and .next folder at the repo root are used. Avoid moving files.
        cwd: __dirname,
        script: 'npm',
        args: 'run start',
        env: { NODE_ENV: 'production'}
    }
  ]
}