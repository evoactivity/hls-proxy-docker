CONTAINER_ALREADY_STARTED="CONTAINER_ALREADY_STARTED_PLACEHOLDER"
if [ ! -e $CONTAINER_ALREADY_STARTED ]; then
    touch $CONTAINER_ALREADY_STARTED
    echo "-- First container startup --"
# base path to server
base="https://www.hls-proxy.com/downloads/"
# get files contained in base dir
lynx -dump -listonly "${base}" | grep http | grep '1\.0\.[0-9]+\.zip' | awk '{print $2}' > .tmpfiles
# get latest version number (x)
version=$(awk -F'.' '{ print $3 }' .tmpfiles | sort | tail -n1)
# get filename of latest build
latest=$(grep "1.0.${version}" .tmpfiles)
# download latest file
wget -qO - "${base}${latest}" > /var/tmp/hlsproxy.zip
echo '------ UNZIP HLS PROXY -------'
mkdir -p /var/tmp/hlsp/
unzip -o /var/tmp/hlsproxy.zip -d /var/tmp/hlsp/
cp /var/tmp/hlsp/* /opt/hlsp
rm -rf /var/tmp/hlsp/
rm -rf /var/tmp/hlsproxy.zip
echo '------ CHMOD HLS PROXY -------'
chmod +x /opt/hlsp/hls-proxy
else
    echo "-- Not first container startup --"
fi
