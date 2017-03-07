# kcpclient-with-balance-rpi
It is a docker image of pen and kcpclient (at most 4) built on Raspberry pi 3 (arm7l).

# Usage

* Fetch the code
```
git clone git@github.com:LaoLuMian/kcpclient-with-balance-rpi.git
```

* Modify the configuration
```
cd kcpclient-with-balance-rpi
vim config.json
```

* Run multiple kcpclient

You have 2 options

```
./kcpclient_start.sh
```

OR 

```
sudo mkdir -p /dorry_data/kcpclient_conf
sudo cp `pwd`/config.json /dorry_data/kcpclient_conf/
docker run -itd --privileged --restart=always --cap-add=NET_ADMIN --net=host -v /dorry_data/kcpclient_conf:/home/kcpclient --name router_kcp kcpclient-rpi:20170303-1
```

