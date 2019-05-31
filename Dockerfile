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

CMD exec verdaccio
