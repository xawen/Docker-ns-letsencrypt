FROM alpine
MAINTAINER JDM

# Install Alpine packages
RUN apk add --no-cache curl git bash python2 py2-pip openssl nano

# Install python requirements
RUN pip install requests

# Setup crontab
ENV CRONTAB_FILE=/etc/periodic/weekly/ns_letsencrypt

# Setup cron jobs
RUN echo "#!/bin/sh" > ${CRONTAB_FILE} && \
     echo "/root/ns-letsencrypt/ns-cronjob.sh > /proc/1/fd/1 2>/proc/1/fd/2" >> ${CRONTAB_FILE} && \
     chmod 0744 ${CRONTAB_FILE}

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

CMD ["crond", "-f", "-d", "8" ]
