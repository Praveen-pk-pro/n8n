FROM node:22.2.0

WORKDIR /app

COPY package.json pnpm-lock.yaml ./

RUN npm install -g pnpm
RUN rm -rf node_modules && pnpm store prune && pnpm install --strict-peer-dependencies=false

# ✅ ADD THIS LINE to compile TypeScript to dist/
RUN pnpm run build:backend && pnpm run build:frontend

COPY . .

CMD ["pnpm", "start"]
