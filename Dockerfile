# Buld Step
FROM node:alpine
WORKDIR /user/src/app
COPY package*.json ./
RUN npm i
COPY . .
RUN npm run build
CMD ["node", "index.js"]

# production environment
FROM nginx:alpine
RUN rm -rf /etc/nginx/conf.d
RUN mkdir -p /etc/nginx/conf.d
COPY ./default.conf /etc/nginx/conf.d/
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
