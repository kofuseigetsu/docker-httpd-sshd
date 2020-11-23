FROM httpd:2.4-alpine

# install
RUN apk -U add openssh-server --no-cache

# configure

## ssh
COPY sshd_config /etc/ssh/

## httpd
RUN echo 'IncludeOptional conf.d/*.conf' >> /usr/local/apache2/conf/httpd.conf \
    && sed -i '/LoadModule rewrite_module/s/^#//g' /usr/local/apache2/conf/httpd.conf \
    && mkdir -p /usr/local/apache2/conf.d

# entry point
COPY httpd-sshd-entrypoint.sh /usr/local/bin
COPY ssh_setup.sh /usr/local/bin
RUN chmod -R +x /usr/local/bin

ENV SSH_PORT 2222
EXPOSE 2222

CMD ["httpd-sshd-entrypoint.sh","httpd-foreground"]
