# Küçük ve hızlı nginx imajı
FROM nginx:alpine

# Build edilen dosyaları kopyala
COPY ./dist/personal-website /usr/share/nginx/html

# SPA için özel nginx config
COPY ./nginx.conf /etc/nginx/conf.d/default.conf

# Portu expose et
EXPOSE 80
