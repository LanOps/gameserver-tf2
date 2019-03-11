FROM lanopsdev/gameserver-steamcmd:latest
MAINTAINER Thornton Phillis (Th0rn0@lanops.co.uk)

# Env Defaults
ENV SRCDS_HOSTNAME default
ENV SRCDS_PORT 27015 
ENV SRCDS_MAXPLAYERS 14 
ENV SRCDS_TOKEN 0 
ENV SRCDS_RCONPW rconpass 
ENV SRCDS_PW password
ENV SRCDS_REGION -1
ENV SRCDS_PURE 1
ENV SRCDS_MAP ctf_2fort
ENV APP_ID 232250

# Add Start Script
RUN mkdir -p /home/steam/tf2 
RUN { \
        echo '@ShutdownOnFailedCommand 1'; \
        echo '@NoPromptForPassword 1'; \
        echo 'login anonymous'; \
        echo 'force_install_dir /home/steam/tf2/'; \
        echo 'app_update $APP_ID'; \
        echo 'quit'; \
} > /home/steam/tf2_update.txt
ADD resources/root/startServer.sh /home/steam/startServer.sh

# Expose Ports
EXPOSE 27015 27020 27005 51840
EXPOSE 27015/udp

# Start Server
CMD ["/home/steam/startServer.sh"]

