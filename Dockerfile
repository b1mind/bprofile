# Our Node base image
FROM node:14.16.1

# Set the Node environment to development to ensure all packages are installed
ENV NODE_ENV development

# Change our current working directory
WORKDIR /user/src/app

# Copy over `package.json` and lock files to optimize the build process
COPY ["package.json", "./"]

# Install Node modules
RUN npm i

# Copy over rest of the project files
COPY . .

# Run `yarn dev` and set the host to 0.0.0.0 so we can access the web app from outside
RUN npm run build 

# production environment
FROM nginx:1.13.9-alpine
RUN rm -rf /etc/nginx/conf.d
RUN mkdir -p /etc/nginx/conf.d
COPY ./default.conf /etc/nginx/conf.d/
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
