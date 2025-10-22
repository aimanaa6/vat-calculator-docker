FROM node:24-alpine

# change into a folder called /app
WORKDIR /app

# only copy package.json
COPY package.json .

# download the project dependencies
RUN npm install

# copy everything from the react app folder to the /app folder in the container
COPY . .

# package up the react project in the /app directory
RUN npm run build

# stage 2
FROM ubuntu:22.04

RUN apt update

RUN apt install -y git

RUN apt install -y default-jdk

CMD ["npm", "run", "start"]
