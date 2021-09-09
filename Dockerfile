# build environment
FROM node:14.16.1
WORKDIR /usr/src/app/
COPY *.json /usr/src/app/
RUN npm install
ENV PATH /usr/src/app/node_modules/.bin:$PATH
RUN npm build
COPY . /usr/src/app/
EXPOSE 3000
CMD ["node", "build/index.js"]

# # production environment
# FROM nginx:1.13.9-alpine
# RUN rm -rf /etc/nginx/conf.d
# RUN mkdir -p /etc/nginx/conf.d
# COPY ./default.conf /etc/nginx/conf.d/
# COPY --from=builder /usr/src/app/build /usr/share/nginx/html
# EXPOSE 3000
# CMD ["nginx", "-g", "daemon off;"]
