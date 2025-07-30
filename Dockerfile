# 1. Build stage
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

# Angular CLI global yükle (alpine için)
RUN npm install -g @angular/cli

COPY . .

RUN ng build

# 2. Production stage
FROM nginx:alpine

COPY --from=build /app/dist/personal-website /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
