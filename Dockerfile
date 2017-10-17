FROM node:8

ENV APP_DIRECTORY /app
WORKDIR $APP_DIRECTORY

ENV POLYFILL_SERVICE_VERSION 3.22.0

RUN wget https://github.com/Financial-Times/polyfill-service/archive/v$POLYFILL_SERVICE_VERSION.tar.gz -P /tmp \
  && tar -xzf /tmp/v$POLYFILL_SERVICE_VERSION.tar.gz -C /app/ --strip-components=1 \
  && rm -f /tmp/v$POLYFILL_SERVICE_VERSION.tar.gz

ENV NODE_ENV production

RUN npm install --production
RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
