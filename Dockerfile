FROM node:14.18.0-alpine

RUN mkdir -p /app
WORKDIR /app

COPY package.json /app/
COPY package-lock.json /app/

RUN npm install --production && \
    rm -rf /tmp/* /root/.npm /root/.node-gyp

COPY . /app

ENTRYPOINT ["bin/server"]
