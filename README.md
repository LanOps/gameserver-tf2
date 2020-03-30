# TF2 Docker Image
[![Build Status](http://drone.th0rn0.co.uk/api/badges/LanOps/gameserver-tf2/status.svg)](http://drone.th0rn0.co.uk/LanOps/gameserver-tf2)

## Prerequisites

You must create the mount directory and give the container full read and write permissions.

## Usage

```
docker run -it --name "TF2" \
    -v /path/to/local/mount:/home/steam/tf2 \
    -p 27015:27015 \
    -p 27015:27015/udp \
    lanopsdev/gameserver-tf2
```

You can also use the Entrypoint and CMD to customize configs and plugins like you would normally with SRCDS (Port must be changed via Env Variable);

```
docker run -it --name "TF2" \
    -v /path/to/local/mount:/home/steam/tf2 \
    -p 27015:27015 \
    -p 27015:27015/udp \
    lanopsdev/gameserver-tf2 \
    +sv_pure ${SRCDS_PURE}                          \
    +maxplayers ${SRCDS_MAXPLAYERS}                 \
    +sv_password ${SRCDS_PW}                        \
    +rcon_password ${SRCDS_RCONPW}                  \
    +sv_region ${SRCDS_REGION}                      \
    +sv_setsteamaccount ${SRCDS_TOKEN}              \
    +sv_lan ${SRCDS_LAN}                            \
    +map ${SRCDS_MAP}                               \
    +ip 0.0.0.0
```

## Environment Variables

* SRCDS_PORT - Port Number for the server to run on (Default 27015)
