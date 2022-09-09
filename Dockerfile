FROM node:latest

RUN npm install -g pm2
RUN mkdir /app
WORKDIR /app

ENV STKEY_ID lin
ENV STKEY_NAME 香港
ENV STKEY_SERVER_BY 茗

ADD package*.json ./
RUN npm install
ADD . ./

EXPOSE 3999
CMD echo "{\
    \"id\":   \"$STKEY_ID\",\
    \"name\": \"$STKEY_NAME\",\
    \"serverBy\": \"$STKEY_SERVER_BY\"\
}" > /app/config.json && pm2-docker server.js
