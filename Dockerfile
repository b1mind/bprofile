# Our Node base image
FROM node:14.16.1

# Set the Node environment to development to ensure all packages are installed
ENV NODE_ENV development

# Change our current working directory

# Copy over `package.json` and lock files to optimize the build process
COPY ["package.json", "./"]

# Install Node modules
RUN npm i

# Copy over rest of the project files
COPY . .

# Run `yarn dev` and set the host to 0.0.0.0 so we can access the web app from outside
RUN npm run build 

CMD ["node", "build"]
