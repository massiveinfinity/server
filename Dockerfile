FROM node:14.18.0-alpine

RUN mkdir -p /app
WORKDIR /app

COPY . /app

RUN npm install --production && \
    rm -rf /tmp/* /root/.npm /root/.node-gyp

EXPOSE 3000
ENTRYPOINT ["bin/server"]
