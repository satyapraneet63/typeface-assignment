FROM node:20-alpine
WORKDIR /usr/src/app

COPY package.json .
COPY Server/quotes.json .
COPY Server/server.js .
COPY Dockerfile .
COPY run.sh .
COPY Kubernetes/deployment.yaml .
COPY Kubernetes/service.yaml .

RUN npm install express body-parser

EXPOSE 3000
CMD ["node", "server.js"]
