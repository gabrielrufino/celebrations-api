module.exports = ({ env }) => ({
  'duplicate-button': true,
  email: {
    config: {
      provider: 'nodemailer',
      providerOptions: {
        host: env('SMTP_HOST', 'smtp.example.com'),
        port: env.int('SMTP_PORT', 587),
        auth: {
          user: env('SMTP_USERNAME', 'email@example.com'),
          pass: env('SMTP_PASSWORD', '12345678'),
        },
      },
      settings: {
        defaultFrom: 'no-reply@celebrationsapi.dev',
        defaultReplyTo: 'contact@celebrationsapi.dev',
      },
    },
  },
  'entity-notes': {
		enabled: true,
	},
  'strapi-prometheus': {
    enabled: true,
    config: {
      prefix: '',
      fullURL: false,
      includeQuery: false,
      defaultMetrics: true,
    }
  }
});
