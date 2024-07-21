#!/bin/bash

# Generate config.production.json from environment variables
node /var/lib/ghost/generateConfig.js

# Start Ghost with the production configuration
npm start --production
