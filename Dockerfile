FROM wordpress:5.5.1-fpm-alpine

WORKDIR /apps/example_com
COPY  src/app /apps/example_com/wp-content