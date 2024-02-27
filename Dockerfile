FROM node:20-slim

ARG DB_HOST
ARG DB_USER
ARG DB_PASS
ARG DB_NAME
ARG DB_SSL=true
ARG DB_PORT=5432

COPY ./ /wiki

WORKDIR /wiki

RUN node replace.js $DB_HOST $DB_USER $DB_PASS $DB_NAME $DB_SSL $DB_PORT

RUN apt update && apt install -y git

CMD ["node","server/index.js"]