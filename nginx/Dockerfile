# Build Stage
FROM node:25-alpine3.23 AS build
WORKDIR /app
COPY ./react-ts/package*.json ./
RUN npm install
COPY ./react-ts .
RUN npm run build

# Production Stage
FROM nginx:1.29.5-alpine AS production
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]   