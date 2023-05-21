FROM node:18.16.0-alpine

ARG URL=0.0.0.0:1337
ARG ADMIN_JWT_SECRET=defaultValue

WORKDIR /var/www/celebrations-api

COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN NODE_ENV=production \
    URL=${URL} \
    ADMIN_JWT_SECRET=${ADMIN_JWT_SECRET} \
    npm run build

EXPOSE 1337

CMD [ "npm", "start" ]
