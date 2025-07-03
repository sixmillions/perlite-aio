FROM sec77/perlite:1.6

LABEL maintainer="sixmillions"

ENV NOTES_PATH=blog

RUN apk update && \
    apk add --no-cache nginx supervisor && \
    rm -rf /var/cache/apk/*

COPY ./perlite.conf /etc/nginx/http.d/default.conf
COPY supervisord.conf /etc/supervisord.conf

WORKDIR /var/www/perlite/blog
COPY ./README.md ./

EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
