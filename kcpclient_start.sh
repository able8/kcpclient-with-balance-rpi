sudo mkdir -p /dorry_data/kcpclient_conf
sudo cp `pwd`/config.json /dorry_data/kcpclient_conf/
docker run -itd --privileged --restart=always --cap-add=NET_ADMIN --net=host -v /dorry_data/kcpclient_conf:/home/kcpclient --name router_kcp kcpclient-rpi:20170303-1
