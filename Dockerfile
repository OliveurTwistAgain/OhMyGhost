FROM ghost:latest

# Install PostgreSQL client for Ghost
RUN npm install pg

# Create a new user and group
RUN groupadd -r ghost && useradd -r -g ghost ghost

# Copy the generateConfig script
COPY generateConfig.js /var/lib/ghost/generateConfig.js

# Copy the start script
COPY start.sh /var/lib/ghost/start.sh
RUN chmod +x /var/lib/ghost/start.sh

# Set ownership and permissions
RUN chown -R ghost:ghost /var/lib/ghost

# Switch to the non-root user
USER ghost

EXPOSE 2368

# Use the custom start script
CMD ["/var/lib/ghost/start.sh"]
