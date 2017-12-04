FROM node:9.2.0-alpine
WORKDIR /here
RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*
ADD index.js /here
ADD package.json /here
ADD package-lock.json /here
RUN ["npm", "install", "--production"]
RUN ["npm", "start"]