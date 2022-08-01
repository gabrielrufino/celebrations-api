module.exports = ({ env }) => ({
  connection: {
    client: 'postgres',
    connection: env('DATABASE_URL', 'postgres://root:root@localhost:5432/celebrations_api'),
    useNullAsDefault: true,
  },
});
