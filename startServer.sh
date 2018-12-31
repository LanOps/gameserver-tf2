#!/bin/sh

cd /home/steam/tf2
/home/steam/steamcmd/steamcmd.sh +login anonymous 	\
        +force_install_dir /home/steam/tf2 			\
        +app_update ${APP_ID} validate 				\
        +quit
./srcds_run 										\
	-game tf 										\
	-console 										\
	-autoupdate 									\
	-steam_dir /home/steam/steamcmd/ 				\
	-steamcmd_script /home/steam/tf2_update.txt 	\
	-port ${SRCDS_PORT} 							\
	+sv_pure ${SRCDS_PURE} 							\
	+maxplayers ${SRCDS_MAXPLAYERS} 				\
	+hostname "${SRCDS_HOSTNAME}" 					\
	+sv_password ${SRCDS_PW} 						\
	+rcon_password ${SRCDS_RCONPW} 					\
	sv_region ${SRCDS_REGION} 						\
	+sv_setsteamaccount "${SRCDS_TOKEN}" 			\
	+sv_lan "${SRCDS_LAN}" 							\
	+map ${SRCDS_MAP}
