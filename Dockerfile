# Buld Step
FROM node:10-alpine as builder
COPY package*.json ./
RUN npm i
WORKDIR /user/src/app
COPY . .
RUN npm run build

# production environment
FROM nginx:alpine
RUN rm -rf /etc/nginx/conf.d
RUN mkdir -p /etc/nginx/conf.d
COPY ./default.conf /etc/nginx/conf.d/
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
