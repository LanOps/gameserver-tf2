#!/bin/sh

cd ${SRCDS_SRV_DIR}

getMetaMod="false"
getSourceMod="false"

if [ ! -d "tf" ];
then
    mkdir tf
    cp -r /tmp/cfg tf/cfg/
fi

# Check if MetaMod Needs updating

if [ ! -d "tf/addons/metamod" ] || [ ! -f "tf/addons/mm-version" ];
then
    getMetaMod="true"
fi
if [ -f "tf/addons/mm-version" ];
then
    content=$(head -n 1 tf/addons/mm-version)
    if [ "${METAMOD_VERSION_MAJOR}.${METAMOD_VERSION_MINOR}-${METAMOD_BUILD}" != "$content" ];
    then
        getMetaMod="true"
    fi
fi

# Check if SourceMod Needs updating

if [ ! -d "tf/addons/sourcemod" ] || [ ! -f "tf/addons/sm-version" ];
then
    getSourceMod="true"
fi
if [ -f "tf/addons/sm-version" ];
then
    content=$(head -n 1 tf/addons/sm-version)
    if [ "${SOURCEMOD_VERSION_MAJOR}.${SOURCEMOD_VERSION_MINOR}-${SOURCEMOD_BUILD}" != "$content" ];
    then
        getSourceMod="true"
    fi
fi

# Update MetaMod

if [ "$getMetaMod" = "true" ];
then
    curl -sSL https://mms.alliedmods.net/mmsdrop/$METAMOD_VERSION_MAJOR/mmsource-$METAMOD_VERSION_MAJOR.$METAMOD_VERSION_MINOR-git$METAMOD_BUILD-linux.tar.gz \
        -o /tmp/metamod.tar.gz
    tar -xzvf /tmp/metamod.tar.gz --directory $SRCDS_SRV_DIR/tf
    rm /tmp/metamod.tar.gz
    if [ -f "tf/addons/mm-version" ];
    then
        rm tf/addons/mm-version
    fi
    echo "${METAMOD_VERSION_MAJOR}.${METAMOD_VERSION_MINOR}-${METAMOD_BUILD}" > tf/addons/mm-version
fi

# Update SourceMod

if [ "$getSourceMod" = "true" ];
then
    curl -sSL https://sm.alliedmods.net/smdrop/$SOURCEMOD_VERSION_MAJOR/sourcemod-$SOURCEMOD_VERSION_MAJOR.$SOURCEMOD_VERSION_MINOR-git$SOURCEMOD_BUILD-linux.tar.gz \
        -o /tmp/sourcemod.tar.gz
    tar -xzvf /tmp/sourcemod.tar.gz --directory $SRCDS_SRV_DIR/tf
    rm /tmp/sourcemod.tar.gz
    if [ -f "tf/addons/sm-version" ];
    then
        rm tf/addons/sm-version
    fi
    echo "${SOURCEMOD_VERSION_MAJOR}.${SOURCEMOD_VERSION_MINOR}-${SOURCEMOD_BUILD}" > tf/addons/sm-version
fi

# Run Server

/home/steam/steamcmd/steamcmd.sh +login anonymous   \
        +force_install_dir ${SRCDS_SRV_DIR}         \
        +app_update ${SRCDS_APP_ID} validate        \
        +quit
./srcds_run                                         \
    -game tf                                        \
    -console                                        \
    -autoupdate                                     \
    -steam_dir /home/steam/steamcmd/                \
    -steamcmd_script /home/steam/tf2_update.txt     \
    -port ${SRCDS_PORT}                             \
    $@
