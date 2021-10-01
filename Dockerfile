FROM node:14.18.0-alpine

RUN mkdir -p /app
WORKDIR /app

COPY package.json /app/
COPY package-lock.json /app/


RUN npm install --production

ENV NODE_ENV production
ENTRYPOINT ["node", "-r", "esm", "./bin/server"]
