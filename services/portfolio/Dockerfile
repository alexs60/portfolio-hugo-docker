FROM klakegg/hugo:ext-alpine AS builder
WORKDIR /src
COPY . .

RUN echo "--- SOURCE FILES ---" && ls -F

RUN hugo --minify --destination /target -v || echo "Hugo Failed!"

RUN echo "--- BUILT FILES ---" && ls -R /target

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /target /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]