FROM python:2-alpine
MAINTAINER Dave Kaufman <dave@daveops.org>

ARG PORT
ENV PORT $PORT
EXPOSE $PORT

SHELL ["/bin/sh", "-c"]

COPY server.py /server.py

WORKDIR /
RUN apk --no-cache add openssl curl
RUN openssl req -new -x509 -subj "/C=US/ST=WA/L=Puyallup/O=daveops.org/CN=simpleserver" -keyout server.pem -out server.pem -days 365 -nodes

# really shouldn't do this, but I'm not validating that port must be > than 1024
USER root

CMD python ./server.py $PORT

STOPSIGNAL SIGTERM

HEALTHCHECK CMD curl -k -s https://localhost:$PORT/health || exit 1
