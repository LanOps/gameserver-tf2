# TF2 Docker Image

## Usage

```
docker run -it --name "TF2" \
    -e SRCDS_HOSTNAME=myServer \
    -e SRCDS_PORT=27015 \
    -e SRCDS_MAP=ctf_2fort \
    -e SRCDS_MAXPLAYERS=24 \
    -e SRCDS_TOKEN=xxx \
    -e SRCDS_LAN=0 \
    -e SRCDS_PW=default \
    -e SRCDS_RCONPW=default \
    -p 27015:27015 \
    -p 27015:27015/udp \
    lanopsdev/gameserver-tf2
```

### For Persistance mount the /home/steam/tf2 directory

```
docker run -it --name "TF2" \
    -v localVolume:/home/steam/tf2 \
    -e SRCDS_HOSTNAME=myServer \
    -e SRCDS_PORT=27015 \
    -e SRCDS_MAP=ctf_2fort \
    -e SRCDS_MAXPLAYERS=24 \
    -e SRCDS_TOKEN=xxx \
    -p 27015:27015 \
    -p 27015:27015/udp \
    lanopsdev/gameserver-tf
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