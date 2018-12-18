FROM alpine
MAINTAINER JDM

# Install Alpine packages
RUN apk add --no-cache curl git bash python2 py2-pip openssl

# Install python requirements
RUN pip install requests

# Setup crontab
ENV CRONTAB_FILE=/etc/crontabs/root

RUN mkdir /etc/cron.d

RUN echo "0 0 1 * * /root/ns-letsencrypt/ns-cronjob.sh > /proc/1/fd/1 2>/proc/1/fd/2" > ${CRONTAB_FILE} && \
    chmod 0644 ${CRONTAB_FILE} && \
    crontab ${CRONTAB_FILE}

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["crond", "-f", "-d", "8" ]
