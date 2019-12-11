FROM alpine:latest AS unzip

LABEL maintainer="ricardosouzamorais"
LABEL github="https://github.com/ricardo-aspira"

RUN apk --no-cache add zip

COPY migrationtoolkit-rhamt-web-distribution-4.2.1-with-authentication.zip /tmp/migrationtoolkit-rhamt-web-distribution-4.2.1-with-authentication.zip
RUN unzip -o /tmp/migrationtoolkit-rhamt-web-distribution-4.2.1-with-authentication.zip -d /tmp

FROM openjdk:8

RUN useradd jboss \
        && usermod -G jboss jboss \
        && mkdir /opt/rhamt \
        && mkdir /opt/submitted-ears \
        && mkdir /opt/rhamt-h2-data \
        && chown jboss:jboss /opt -R

WORKDIR /opt/rhamt

COPY --chown=jboss:jboss --from=unzip /tmp/rhamt-web-distribution-4.2.1.Final ./

RUN find /opt

EXPOSE 8080

USER jboss

ENTRYPOINT ["/opt/rhamt/run_rhamt.sh", "-b 0.0.0.0", "-Dwindup.data.dir=/opt/rhamt-h2-data"]
