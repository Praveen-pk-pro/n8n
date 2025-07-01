FROM node:18

WORKDIR /app

COPY . .

# Use install instead of ci
RUN npm install

CMD ["npx", "n8n", "start"]

