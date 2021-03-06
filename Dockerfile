FROM cav94mat/rpi-base
LABEL maintainer="cav94mat@gmail.com"

ENV UID=1000 GID=1000
COPY run.sh     /bin/run.sh
COPY run.lib.sh /lib/run.lib.sh

RUN chmod +x /bin/run.sh && /bin/run.sh --install

VOLUME /conf
EXPOSE 7575/tcp 

HEALTHCHECK --interval=5m --timeout=10s --start-period=30s --retries=3 \
  CMD ["/bin/run.sh", "--health"] || exit 1
  
CMD ["/bin/run.sh"]
