FROM node:18

# Set working directory
WORKDIR /app

# Copy package files first
COPY package.json pnpm-lock.yaml ./

# Install pnpm globally
RUN npm install -g pnpm

# Clean and install dependencies (peer deps relaxed)
RUN rm -rf node_modules && pnpm store prune && pnpm install --strict-peer-dependencies=false

# Copy rest of the code
COPY . .

# Expose default n8n port
EXPOSE 5678

# Start app
CMD ["pnpm", "start"]
