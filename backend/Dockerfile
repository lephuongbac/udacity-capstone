FROM node:14-alpine as development

WORKDIR /usr/src/app

COPY package.json ./
COPY package-lock.json ./

RUN npm i

COPY . .

RUN npm run build

FROM node:14-alpine as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

RUN apk add curl bash

COPY --from=development /usr/src/app ./

EXPOSE 3000

CMD ["node", "--max-http-header-size=1048576", "dist/main"]
