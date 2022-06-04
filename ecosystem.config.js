module.exports = {
  apps: [
    {
      name: 'Celebrations API',
      script: 'npm',
      args: 'start',
      env_production: {
        HOST: process.env.PROD_HOST,
        PORT: process.env.PROD_PORT,
        APP_KEYS: process.env.PROD_APP_KEYS,
        API_TOKEN_SALT: process.env.PROD_API_TOKEN_SALT,
        ADMIN_JWT_SECRET: process.env.PROD_ADMIN_JWT_SECRET,
        JWT_SECRET: process.env.PROD_JWT_SECRET
      }
    },
  ],
  deploy: {
    production: {
      user: process.env.SERVER_SSH_USER,
      host: process.env.SERVER_SSH_HOST,
      ref: 'origin/main',
      repo: 'https://github.com/gabrielrufino/celebrations-api.git',
      path: '/var/www/celebrations-api',
      'pre-deploy-local': '',
      'post-deploy' : 'npm ci && npx pm2 reload ecosystem.config.js --env production',
      'pre-setup': ''
    }
  }
};
