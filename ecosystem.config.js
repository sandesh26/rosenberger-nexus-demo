module.exports = {
  apps: [
    {
        name: 'rosenberger-nexus',
        cwd: path.resolve(__dirname, 'rosenberger'),
        script: 'npm',
        args: 'run start',
        env: { NODE_ENV: 'production'}
    }
  ]
}