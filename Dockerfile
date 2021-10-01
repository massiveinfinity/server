FROM node:14-alpine

CMD ["node", "-r", "esm", "./bin/server", "--port", "3000"]
ENV NODE_ENV production
EXPOSE 3000
WORKDIR /app

RUN \
  set -ex; \
  cd /; \
  rmdir /app; \
  wget -O master.zip https://github.com/localtunnel/server/archive/master.zip; \
  unzip master.zip; \
  rm master.zip; \
  mv /server-master /app; \
  cd /app; \
  yarn install --production; \
  yarn cache clean

ENTRYPOINT ["node", "-r", "esm", "./bin/server", "--port", "3000"]
