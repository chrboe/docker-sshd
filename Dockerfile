FROM alpine

RUN apk update && \
    apk add openssh && \
    mkdir -p ~root/.ssh && chmod 700 ~root/.ssh/ && \
    ssh-keygen -A && \
    passwd -u root && \
    echo '' > /etc/motd && \
    rm -rf /var/cache/apk/*

COPY sshd_config /etc/ssh/
COPY entry.sh /entry.sh

EXPOSE 22

ENTRYPOINT ["/entry.sh"]

CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
