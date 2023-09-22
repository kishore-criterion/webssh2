FROM node:16

WORKDIR /usr/src

COPY app/ /usr/src/

RUN npm ci --audit=false --bin-links=false --fund=false

EXPOSE 21002/tcp

RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT [ "bash","./docker-entrypoint.sh" ]