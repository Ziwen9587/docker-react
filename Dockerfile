# Build phase image-------------
From node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase image-------------
FROM nginx as nginx_image
COPY --from=builder /app/build /usr/share/nginx/html
