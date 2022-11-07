#!/bin/sh
echo '------ DOWNLOADING HLS PROXY -------'
wget https://www.hls-proxy.com/downloads/8.4.6/hls-proxy-8.4.6.linux-x64.zip -O /var/tmp/hlsproxy.zip
echo '------ UNZIP HLS PROXY -------'
mkdir -p /var/tmp/hlsp/
unzip -o /var/tmp/hlsproxy.zip -d /var/tmp/hlsp/
cp /var/tmp/hlsp/* /opt/hlsp
echo '------ CLEAN UP TEMP -------'
rm -rf /var/tmp/hlsp/
rm -rf /var/tmp/hlsproxy.zip
echo '------ CHMOD HLS PROXY -------'
chmod +x /opt/hlsp/hls-proxy
echo '------ ALLOW HLS PROXY ON EVERY INTERFACE -------'
/opt/hlsp/hls-proxy -address 0.0.0.0 -port 8085 -save -quit
echo '------ SERVE HLS PROXY -------'
/opt/hlsp/hls-proxy
