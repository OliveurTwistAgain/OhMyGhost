FROM ghost:latest

# Copy configuration files if needed
COPY config.production.json /var/lib/ghost/config.production.json

# Set environment variables if necessary
ENV database__client=pg \
    database__host=aws-0-eu-central-1.pooler.supabase.com \
    database__port=6543 \
    database__user=postgres.wpoeureadeahkbqcyanq \
    database__password=2iFABt3Po933Qq1c \
    database__database=postgres

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
