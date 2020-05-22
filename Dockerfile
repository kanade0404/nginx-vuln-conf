FROM jboesl/docker-nginx-headers-more
RUN rm /etc/nginx/nginx.conf
ADD /conf/nginx.conf /etc/nginx/nginx.conf
ADD /html/index.html /usr/share/nginx/html/index.html
COPY /html/path/ /usr/share/nginx/html/path/
COPY /html/split/ /usr/share/nginx/html/split/
COPY /html/header/ /usr/share/nginx/html/header/
RUN mkdir -p /var/www/data/ && \
    mkdir -p /var/www/data/public/ && \
    mkdir -p /var/www/data/private/ && \
    echo 'This is public directory.' > /var/www/data/public/public.txt && \
    echo 'flag{ng1nx_path_traversal_vulnerability}' > /var/www/data/private/private.txt
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
EXPOSE 80
