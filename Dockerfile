FROM node:14.18.0-alpine

WORKDIR /app

COPY package.json /app/
COPY package-lock.json /app/

RUN npm install --production && npm cache clean

COPY . /app

ENV NODE_ENV production
ENTRYPOINT ["-S", "node", "-r", "esm", "./bin/server"]
