FROM ghcr.io/requarks/wiki:2.5 AS wiki

FROM node:20-slim

COPY --from=wiki /wiki /wiki

WORKDIR /wiki

RUN rm -r -f assets/favicon.ico assets/favicons

COPY ./ ./

RUN apt update && apt install -y git

ARG DB_HOST
ARG DB_USER
ARG DB_PASS
ARG DB_NAME
ARG DB_SSL=true
ARG DB_PORT=5432

RUN node replace.js $DB_HOST $DB_USER $DB_PASS $DB_NAME $DB_SSL $DB_PORT

CMD ["node","server/index.js"]