# Dockerfile to containerize openMCT application
FROM registry.access.redhat.com/ubi8/nodejs-18:latest
# FROM node:18-alpine

# Copy the package.json files and install dependencies
COPY openmct /openmct
USER root
RUN npm install

# Add a non-root user
RUN useradd -m -r -s /bin/bash appuser && chown -R appuser /openmct
USER appuser

# Set the working directory
WORKDIR /openmct

# Expose the port
EXPOSE 8080

# Set the command to start the application
CMD [ "npm", "start" ]