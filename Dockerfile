# ✅ Use a Node version compatible with n8n
FROM node:18

# 📁 Set the working directory inside the container
WORKDIR /app

# 📦 Copy all files from your repo into the container
COPY . .

# 🧱 Install dependencies from package-lock.json
RUN npm ci

# 🚀 Start n8n
CMD ["npx", "n8n", "start"]
