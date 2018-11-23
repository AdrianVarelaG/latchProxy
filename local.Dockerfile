FROM nginx:alpine
RUN apk add --no-cache tzdata
ENV TZ America/Mexico_City
COPY latchlocal.conf /etc/nginx/conf.d/default.conf
#COPY ./build /var/www/html/