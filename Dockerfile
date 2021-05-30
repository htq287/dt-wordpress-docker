FROM wordpress:5.7.2-fpm-alpine

WORKDIR /apps/example_com
COPY  src/app /apps/example_com/wp-content