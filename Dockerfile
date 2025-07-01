FROM node:18-alpine

WORKDIR /data

COPY . .

RUN npm ci && npm run build

CMD ["npx", "n8n", "start"]
