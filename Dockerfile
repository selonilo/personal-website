# 1. Build stage
FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./

# DevDependencies dahil yükle
RUN npm install --include=dev --legacy-peer-deps

RUN npm install -g @angular/cli

COPY . .

RUN npm run build

# 2. Production stage
FROM nginx:alpine

COPY --from=build /app/dist/personal-website/browser /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
