FROM alpine:3.19
LABEL org.opencontainers.image.source https://github.com/alastairhm/alpine-python3

RUN apk update && apk upgrade && apk add --no-cache --update \
    python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    mkdir -p /workdir

WORKDIR /workdir
ENTRYPOINT ["python3"]
