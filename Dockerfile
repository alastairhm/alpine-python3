FROM alpine:3.21
LABEL org.opencontainers.image.source https://github.com/alastairhm/alpine-python3

RUN apk update && apk upgrade && apk add --no-cache --update \
    python3 py3-pip&& \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    mkdir -p /workdir

WORKDIR /workdir
ENTRYPOINT ["python3"]
