FROM tutum/curl:trusty
MAINTAINER João Pinho <jpe.pinho@gmail.com>

ENV TELEGRAF_VERSION=0.12.0-1
ENV INFLUXDB_HOST 192.168.99.100

RUN curl -s -o /tmp/telegraf_latest_amd64.deb http://get.influxdb.org/telegraf/telegraf_${TELEGRAF_VERSION}_amd64.deb && \
  dpkg -i /tmp/telegraf_latest_amd64.deb && \
  rm /tmp/telegraf_latest_amd64.deb && \
  rm -rf /var/lib/apt/lists/*

COPY telegraf.conf /config/telegraf.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]