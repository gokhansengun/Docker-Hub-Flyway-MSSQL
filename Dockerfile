FROM shouldbee/flyway

MAINTAINER Gokhan Sengun <gokhansengun@gmail.com>

COPY run-flyway.sh /scripts/run-flyway.sh

# only a hack, will be fixed in later version of docker-compose
RUN chmod +x /scripts/run-flyway.sh

WORKDIR /flyway

ENTRYPOINT [ "/scripts/run-flyway.sh" ]
