FROM node:20-alpine
WORKDIR /usr/src/app
COPY . .
COPY Server/quotes.json .
COPY Server/server.js .
RUN npm install express body-parser
EXPOSE 3000
CMD ["node", "server.js"]
