# build environment
FROM node:14.16.1
RUN mkdir /usr/src/app
WORKDIR /usr/src/app
COPY *.json ./
RUN npm install
CMD [ "npm", "run", "build" ]
COPY . /usr/src/app/
EXPOSE 3000
CMD ["node", "index.js"]

# # production environment
# FROM nginx:1.13.9-alpine
# RUN rm -rf /etc/nginx/conf.d
# RUN mkdir -p /etc/nginx/conf.d
# COPY ./default.conf /etc/nginx/conf.d/
# COPY --from=builder /usr/src/app/build /usr/share/nginx/html
# EXPOSE 3000
# CMD ["nginx", "-g", "daemon off;"]
