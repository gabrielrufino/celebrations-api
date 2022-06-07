module.exports = {
  apps: [
    {
      name: 'Celebrations API',
      script: 'npm',
      args: 'start',
      env: {
        HOST: process.env.PROD_HOST,
        PORT: process.env.PROD_PORT,
        APP_KEYS: process.env.PROD_APP_KEYS,
        API_TOKEN_SALT: process.env.PROD_API_TOKEN_SALT,
        ADMIN_JWT_SECRET: process.env.PROD_ADMIN_JWT_SECRET,
        JWT_SECRET: process.env.PROD_JWT_SECRET
      }
    },
  ]
};
