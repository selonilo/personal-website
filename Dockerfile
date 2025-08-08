# 1. Build stage
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install --include=dev
RUN npm install -g @angular/cli

COPY . .

RUN npm run build  # Burada ekstra parametre yok

# 2. Production stage
FROM nginx:alpine

COPY --from=build /app/dist/personal-website/browser /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
