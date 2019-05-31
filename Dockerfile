FROM node:lts-alpine

RUN set -ux; \
    apk add --no-cache python make; \
    mkdir /verdaccio; \
    chown -R nobody: /verdaccio; \
    npm config set unsafe-perm true; \
    npm install -g verdaccio@4.0.1 sinopia-crowd@0.1.2; \
    apk del python make; \
    rm -fr /root/.npm /root/.node-gyp

WORKDIR /verdaccio

USER nobody

HEALTHCHECK --timeout=5s --start-period=20s CMD \
  wget http://127.0.0.1:4873/ -q -S -O /dev/null 2>&1 | grep -q -F '200 OK'

CMD exec verdaccio
