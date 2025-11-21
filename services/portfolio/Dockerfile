# Stage 1: Build the static site
FROM klakegg/hugo:ext-alpine AS builder
WORKDIR /src
COPY . .
# Minify for performance
RUN hugo --minify

# Stage 2: Serve with lightweight Nginx
FROM nginx:alpine
# Copy compiled assets from Stage 1
COPY --from=builder /src/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
