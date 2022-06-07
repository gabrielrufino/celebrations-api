const path = require('path');

module.exports = ({ env }) => {
  const client = env('DATABASE_CLIENT', 'sqlite');
  const connections = {
    sqlite: {
      filename: path.join(__dirname, '..', env('DATABASE_FILENAME', '.tmp/data.db'))
    },
    postgres: {
      host: env('DATABASE_HOST', '127.0.0.1'),
      port: env.int('DATABASE_PORT', 5432),
      database: env('DATABASE_NAME', 'strapi'),
      user: env('DATABASE_USERNAME', 'strapi'),
      password: env('DATABASE_PASSWORD', 'strapi'),
    },
  }

  return ({
    connection: {
      client,
      connection: connections[client],
      useNullAsDefault: true,
    },
  })
};
