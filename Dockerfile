FROM node:14.8-alpine3.12
#current-alpine3.11
#12.18.3-alpine3.9
WORKDIR /src/app/

COPY . .

RUN yarn install

RUN yarn factor build

EXPOSE 3000

CMD [ "yarn", "factor", "serve" ]
