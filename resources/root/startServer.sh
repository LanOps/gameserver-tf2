#!/bin/bash

cd ${SRCDS_SRV_DIR}

getMetaMod="false"
getSourceMod="false"

if [ ! -d "tf2" ];
then
    mkdir tf2
    cp -r /tmp/cfg tf2/cfg/
fi

# Check if MetaMod Needs updating

if [ ! -d "tf2/addons/metamod" ] || [ ! -f "tf2/addons/mm-version" ];
then
    getMetaMod="true"
fi
if [ -f "tf2/addons/mm-version" ];
then
    content=$(head -n 1 tf2/addons/mm-version)
    if [ "${METAMOD_VERSION_MAJOR}.${METAMOD_VERSION_MINOR}-${METAMOD_BUILD}" != "$content" ];
    then
        getMetaMod="true"
    fi
fi

# Check if SourceMod Needs updating

if [ ! -d "tf2/addons/sourcemod" ] || [ ! -f "tf2/addons/sm-version" ];
then
    getSourceMod="true"
fi
if [ -f "tf2/addons/sm-version" ];
then
    content=$(head -n 1 tf2/addons/sm-version)
    if [ "${SOURCEMOD_VERSION_MAJOR}.${SOURCEMOD_VERSION_MINOR}-${SOURCEMOD_BUILD}" != "$content" ];
    then
        getSourceMod="true"
    fi
fi

/home/steam/steamcmd/steamcmd.sh +login anonymous   \
        +force_install_dir ${SRCDS_SRV_DIR}          \
        +app_update ${SRCDS_APP_ID} validate              \
        +quit
./srcds_run                                         \
    -game tf                                        \
    -console                                        \
    -autoupdate                                     \
    -steam_dir /home/steam/steamcmd/                \
    -steamcmd_script /home/steam/tf2_update.txt     \
    -port ${SRCDS_PORT}                             \
    +sv_pure ${SRCDS_PURE}                          \
    +maxplayers ${SRCDS_MAXPLAYERS}                 \
    +hostname "${SRCDS_HOSTNAME}"                   \
    +sv_password ${SRCDS_PW}                        \
    +rcon_password ${SRCDS_RCONPW}                  \
    sv_region ${SRCDS_REGION}                       \
    +sv_setsteamaccount "${SRCDS_TOKEN}"            \
    +sv_lan "${SRCDS_LAN}"                          \
    +map ${SRCDS_MAP}
