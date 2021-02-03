#!/bin/sh
echo '------ DOWNLOADING HLS PROXY -------'
wget -o - https://www.hls-proxy.com/downloads/7.4.4/hls-proxy-7.4.4.linux-x64.zip -O /var/tmp/hlsproxy.zip
echo '------ UNZIP HLS PROXY -------'
mkdir -p /var/tmp/hlsp/
unzip -o /var/tmp/hlsproxy.zip -d /var/tmp/hlsp/
cp /var/tmp/hlsp/* /opt/hlsp
echo '------ CLEAN UP TEMP -------'
rm -rf /var/tmp/hlsp/
rm -rf /var/tmp/hlsproxy.zip
echo '------ CHMOD HLS PROXY -------'
chmod +x /opt/hlsp/hls-proxy
echo '------ SERVE HLS PROXY -------'
/opt/hlsp/hls-proxy -port 8085
