FROM node:14.18.0-alpine

WORKDIR /app

COPY package.json /app/
COPY package-lock.json /app/

RUN yarn install --production && yarn cache clean

COPY . /app/

ENV NODE_ENV production

ENTRYPOINT ["node", "-r", "esm", "/app/bin/server"]
