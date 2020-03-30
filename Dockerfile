FROM lanopsdev/gameserver-steamcmd:latest
MAINTAINER Thornton Phillis (Th0rn0@lanops.co.uk)

# Env - Defaults

ENV SRCDS_PORT 27015 

# Env - Server

ENV SRCDS_SRV_DIR /home/steam/tf2
ENV SRCDS_APP_ID 232250

# Env - SourceMod & MetaMod

ENV SOURCEMOD_VERSION_MAJOR 1.9
ENV SOURCEMOD_VERSION_MINOR 0
ENV SOURCEMOD_BUILD 6275
ENV METAMOD_VERSION_MAJOR 1.10
ENV METAMOD_VERSION_MINOR 7
ENV METAMOD_BUILD 968

# Add Start Script

RUN mkdir -p ${SRCDS_SRV_DIR} 
RUN { \
        echo '@ShutdownOnFailedCommand 1'; \
        echo '@NoPromptForPassword 1'; \
        echo 'login anonymous'; \
        echo 'force_install_dir $SRCDS_SRV_DIR'; \
        echo 'app_update $SRCDS_APP_ID'; \
        echo 'quit'; \
} > /home/steam/tf2_update.txt
ADD resources/root/startServer.sh /home/steam/startServer.sh

# Pre Load LanOps Server Configs

RUN mkdir -p ${SRCDS_SRV_DIR}/tf2/cfg/
COPY resources/root/cfg /tmp/cfg/

# Expose Ports

EXPOSE ${SRCDS_PORT} 
EXPOSE ${SRCDS_PORT}/udp
EXPOSE 27020 27005 51840

# Start Server

ENTRYPOINT ["/home/steam/startServer.sh"]
CMD ['+sv_pure 1', '+maxplayers 32', '+sv_region -1', '+sv_lan 0', '+map ctf_2fort', '+ip 0.0.0.0']
