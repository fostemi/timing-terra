FROM node:alpine As production

WORKDIR /app

COPY . .

RUN npm ci && npm run build

FROM nginx:alpine

COPY --from=production /app/dist/angular-tour-of-heroes /usr/share/nginx/html

EXPOSE 80

