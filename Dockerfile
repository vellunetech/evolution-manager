# Use a imagem oficial do Node.js 20 como base
FROM node:20-slim

WORKDIR /usr/src/app

# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

COPY . .

RUN yarn install
RUN npm install
RUN yarn build

RUN npm install -g serve
CMD ["serve", "-s", "dist", "-l", "8083"]

EXPOSE 8083