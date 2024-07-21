const fs = require('fs');

const config = {
  url: process.env.GHOST_URL || process.env.RENDER_EXTERNAL_URL || "https://ohmyghost.onrender.com",
  database: {
    client: "pg",
    connection: {
      host: process.env.DATABASE_HOST,
      user: process.env.DATABASE_USER,
      password: process.env.DATABASE_PASSWORD,
      database: process.env.DATABASE_NAME,
      port: parseInt(process.env.DATABASE_PORT, 10) || 5432
    }
  },
  server: {
    port: parseInt(process.env.SERVER_PORT, 10) || 2368,
    host: process.env.SERVER_HOST || "0.0.0.0"
  },
  mail: {
    transport: "SMTP",
    options: {
      host: process.env.MAIL_HOST,
      port: parseInt(process.env.MAIL_PORT, 10),
      auth: {
        user: process.env.MAIL_USER,
        pass: process.env.MAIL_PASS
      }
    }
  },
  logging: {
    transports: ["file", "stdout"]
  },
  paths: {
    contentPath: process.env.CONTENT_PATH || "content/"
  }
};

fs.writeFileSync('/var/lib/ghost/config.production.json', JSON.stringify(config, null, 2));
console.log("Configuration file generated successfully.");
