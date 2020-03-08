# TF2 Docker Image
[![Build Status](http://drone.th0rn0.co.uk/api/badges/LanOps/gameserver-tf2/status.svg)](http://drone.th0rn0.co.uk/LanOps/gameserver-tf2)
## Usage

```
docker run -it --name "TF2" \
    -e SRCDS_HOSTNAME=myServer \
    -e SRCDS_MAP=ctf_2fort \
    -e SRCDS_MAXPLAYERS=24 \
    -e SRCDS_TOKEN=xxx \
    -e SRCDS_LAN=0 \
    -e SRCDS_RCONPW=default \
    -e SRCDS_MAP_ROTATION=mapcycle_default.txt \
    -e SRCDS_CONFIG_FILE=server.cfg \
    -p 27015:27015 \
    -p 27015:27015/udp \
    lanopsdev/gameserver-tf2
```

### For Persistance mount the /home/steam/tf2 directory

```
docker run -it --name "TF2" \
    -v localVolume:/home/steam/tf2 \
    -e SRCDS_HOSTNAME=myServer \
    -e SRCDS_MAP=ctf_2fort \
    -e SRCDS_MAXPLAYERS=24 \
    -e SRCDS_TOKEN=xxx \
    -e SRCDS_MAP_ROTATION=mapcycle_default.txt \
    -e SRCDS_CONFIG_FILE=server.cfg \
    -p 27015:27015 \
    -p 27015:27015/udp \
    lanopsdev/gameserver-tf2
```


## Environment Variables

* SRCDS_PORT - Port Number for the server to run on (Default 27015)
* SRCDS_PURE - Set the pure level of the server (Default 1)
* SRCDS_MAXPLAYERS - Max number of players (Default 14)
* SRCDS_HOSTNAME - Server Name (Default myServer)
* SRCDS_PW - Password for access to the server (Default password)
* SRCDS_RCONPW - Password for RCON (Default rconpass)
* SRCDS_REGION - Server Region (Default -1)
* SRCDS_TOKEN - Server token from [http://steamcommunity.com/dev/managegameservers](http://steamcommunity.com/dev/managegameservers) - Required for Browser Broadcast
* SRCDS_LAN - Set Lan Server (Default 0)
* SRCDS_MAP - Starting Map (Default ctf_2fort)
* SRCDS_MAP_ROTATION - Select a map cycle (located in tf/cfg, default mapcycle_default.txt)
* SRCDS_CONFIG_FILE - Allow for selecting a different server config file (Default server.cfg)
