FROM node:16

WORKDIR /usr/src
COPY app/ /usr/src/
RUN npm install --production
EXPOSE 21002
CMD npm run start

