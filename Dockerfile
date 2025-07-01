FROM node:18

# Install pnpm globally
RUN npm install -g pnpm

# Set working directory
WORKDIR /app

# Copy all files
COPY . .

# Install dependencies using pnpm
RUN rm -rf node_modules && pnpm store prune && pnpm install --legacy-peer-deps

# Start n8n
CMD ["pnpm", "n8n", "start"]
