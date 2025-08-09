# 1. Build stage
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./

# devDependencies dahil tüm paketleri yükle
RUN npm install --legacy-peer-deps

# Eksik kalmaması için özellikle devkit yükle
RUN npm install @angular-devkit/build-angular --save-dev

# Angular CLI global yükle
RUN npm install -g @angular/cli

# Proje dosyalarını kopyala
COPY . .

# Angular projesini üretim modunda derle
RUN npm run build --configuration production

# 2. Production stage
FROM nginx:alpine

COPY --from=build /app/dist/personal-website/browser /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
