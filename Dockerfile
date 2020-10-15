FROM php:7.4-cli-alpine

COPY test.sh ./

ENTRYPOINT ["/test.sh"]