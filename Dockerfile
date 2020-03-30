FROM node:13.12-buster-slim

RUN npm install -g grunt-cli

RUN npm install

RUN apt-get update && apt-get install -y ruby-sass
