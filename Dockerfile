FROM ghost:latest

# Install PostgreSQL client for Ghost
RUN npm install pg

# Copy the generateConfig script
COPY generateConfig.js /var/lib/ghost/generateConfig.js

# Copy the start script
COPY start.sh /var/lib/ghost/start.sh
RUN chmod +x /var/lib/ghost/start.sh

EXPOSE 2368

# Use the custom start script
CMD ["/var/lib/ghost/start.sh"]