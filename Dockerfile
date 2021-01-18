FROM node:8.12-alpine

#防止下一步运行npm命令时导致"Error: could not get uid/gid"报错
RUN npm config set unsafe-perm true

RUN apk add --no-cache tini && npm install -g docsify-cli@latest

WORKDIR /docs

EXPOSE 3000

ENTRYPOINT ["/sbin/tini", "--"]
CMD [ "docsify", "serve", "." ]
