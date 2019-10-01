FROM alpine:3.9
RUN apk --no-cache add nginx shadow bash && \
    usermod -u 1001 nginx && \
    groupmod -g 1001 nginx
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && mkdir /run/nginx /app \
    && chown nginx:nginx /var/tmp/nginx /var/log/nginx
RUN echo -e "\
server {\n\
	listen 8000 default_server;\n\
	listen [::]:8000 default_server;\n\
        location / {\n\
                root   /app;\n\
                index  index.html index.htm;\n\
        }\n\
	location = /404.html {\n\
		internal;\n\
	}\n\
}" > /etc/nginx/conf.d/default.conf
EXPOSE 8000
CMD ["nginx", "-g", "daemon off;"]

