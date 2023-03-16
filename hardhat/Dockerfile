FROM node:14-bullseye

WORKDIR /data
RUN npm config set user 0
RUN npm config set unsafe-perm true
RUN npm init -y
RUN npm install --save-dev hardhat
RUN touch ./hardhat.config.js
RUN npx hardhat
CMD npx hardhat node --verbose --hostname 0.0.0.0