FROM node:16

# Create app directory

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
RUN mkdir /app
WORKDIR /app
ADD . /app/
RUN ls  -la
RUN pwd
COPY app/package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 8080
ENTRYPOINT [ "node", "server.js" ]