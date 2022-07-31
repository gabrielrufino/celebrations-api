const path = require('path');

module.exports = ({ env }) => ({
  connection: {
    client: 'postgres',
    connection: {
      url: env('DATABASE_URL', 'postgres://root:root@localhost:5432/celebrations_api')
    },
    useNullAsDefault: true,
  },
});
