FROM amd64/alpine:latest
EXPOSE 8085
RUN apk update
RUN apk add wget
RUN apk add unzip
RUN mkdir -p /opt/hlsp
VOLUME [ "/opt/hlsp" ]
COPY checkforhls-proxy-version-compatiblity.sh .
ENTRYPOINT [ "./checkforhls-proxy-version-compatiblity.sh" ]
RUN mkdir -p /var/tmp/hlsp/
RUN unzip -o /var/tmp/hlsproxy.zip -d /var/tmp/hlsp/
RUN cp /var/tmp/hlsp/* /opt/hlsp
RUN rm -rf /var/tmp/hlsp/
RUN rm -rf /var/tmp/hlsproxy.zip
RUN chmod +x /opt/hlsp/hls-proxy
RUN /opt/hlsp/hls-proxy -address 0.0.0.0 -port 8085 -save -quit
RUN /opt/hlsp/hls-proxy
