# Buld Step
FROM node:16.2 as builder
WORKDIR /user/src/app
COPY package*.json ./
RUN npm i
COPY . .
RUN npm run build

# production environment
FROM nginx:alpine
RUN rm -rf /etc/nginx/conf.d
RUN mkdir -p /etc/nginx/conf.d
COPY ./default.conf /etc/nginx/conf.d/
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
