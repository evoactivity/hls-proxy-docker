FROM amd64/ubuntu:latest
EXPOSE 8085

RUN apt-get update && apt-get install -y \
 wget

RUN mkdir -p /opt/hlsp
VOLUME [ "/opt/hlsp" ]
COPY index.sh .
ENTRYPOINT [ "./index.sh" ]




