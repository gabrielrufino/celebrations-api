FROM node:18.13.0-alpine

WORKDIR /var/www/celebrations-api

COPY package*.json ./
RUN npm ci --only=production
COPY . .
RUN NODE_ENV=production npm run build
EXPOSE 1337

CMD [ "npm", "start" ]
