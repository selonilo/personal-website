# 1. Build stage
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./

# DevDependencies dahil her şeyi yükle
RUN npm install -g npm@latest \
    && npm config set include=dev true \
    && npm install --legacy-peer-deps

# Angular CLI global kur
RUN npm install -g @angular/cli

# Proje dosyalarını kopyala
COPY . .

# Build
RUN npm run build

# 2. Production stage
FROM nginx:alpine

COPY --from=build /app/dist/personal-website/browser /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
