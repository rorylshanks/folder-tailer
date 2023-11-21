# Base image
FROM node:alpine
WORKDIR /app
COPY package.json .
RUN npm i
COPY app.js .
ENTRYPOINT ["node", "app.js"]