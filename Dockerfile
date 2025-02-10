# Build stage
FROM node:lts-alpine AS builder
WORKDIR /usr/src/app
COPY package*.json ./
# Install dependencies
RUN npm ci
# Copy source code
COPY . .
# Build the application
RUN npm run build
EXPOSE 3000
CMD ["node", "dist/main"]