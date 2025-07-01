# Use Node 22 to satisfy engine requirement
FROM node:22.2.0

# Set working directory
WORKDIR /app

# Copy only dependency files first to take advantage of Docker cache
COPY package.json pnpm-lock.yaml ./

# Install pnpm globally
RUN npm install -g pnpm

# Clean old modules and install dependencies with relaxed peer checks
RUN rm -rf node_modules && pnpm store prune && pnpm install --strict-peer-dependencies=false

# Copy the rest of the application code
COPY . .

# Set the default command to start your app (adjust if needed)
CMD ["pnpm", "start"]
