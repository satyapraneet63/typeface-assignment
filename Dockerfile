FROM node:20-alpine
WORKDIR /usr/src/app
RUN npm install express body-parser
COPY . .
COPY Server/quotes.json .
COPY Server/server.js .
EXPOSE 3000
CMD ["node", "Server/server.js"]
