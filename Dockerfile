FROM ajoergensen/baseimage-alpine

ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/ajoergensen/docker-privoxy.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0-rc1"

RUN \
        apk add --no-cache privoxy && \
	rm /etc/privoxy/config

COPY root/ /

RUN \
	chmod +x -v /etc/cont-init.d/*.sh /etc/services.d/*/run

# Expose Privoxy Port
EXPOSE 8118
