FROM ibmcom/mq:latest
RUN useradd alice -G mqm && echo alice:passw0rd | chpasswd
COPY config.mqsc /etc/mqm/