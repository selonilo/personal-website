# 1. Build stage
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./

# DevDependencies dahil tüm bağımlılıkları yükle
RUN npm install --include=dev

# Angular CLI'yi global kur
RUN npm install -g @angular/cli

# Proje dosyalarını kopyala
COPY . .

# Angular projesini production modda build et
RUN npm run build --configuration production

# 2. Production stage
FROM nginx:alpine

# Build edilen dosyaları nginx dizinine kopyala
COPY --from=build /app/dist/personal-website/browser /usr/share/nginx/html

# Nginx config dosyasını kopyala
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
