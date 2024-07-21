# Use Node.js LTS version
FROM node:21-alpine3.18

# Set working directory
WORKDIR /mart

# Copy all files to working directory
COPY . .

# Install dependencies
RUN npm ci

# Set production environment
ENV NODE_ENV="production"

# Build application using Nx
RUN npx nx build mart

# Define entrypoint with main entry file
CMD ["node", "./dist/apps/mart/main.js"]

# Expose port 8080 (documentary)
EXPOSE 8080
