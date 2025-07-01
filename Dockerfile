FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and lockfile
COPY package.json pnpm-lock.yaml ./

# Install dependencies safely
RUN npm install -g pnpm && \
    rm -rf node_modules && \
    pnpm store prune && \
    pnpm install --legacy-peer-deps

# Copy remaining files
COPY . .

# Expose port if needed (default for n8n)
EXPOSE 5678

# Start the app (customize if different)
CMD ["pnpm", "start"]
