# TF2 Docker Server

docker run -ti -e SRCDS_TOKEN=xxx -e SRCDS_MAP=ctf_2fort -e SRCDS_LAN=0 -e SRCDS_PW='' -p 27015:27015 -p 27015:27015/udp lanopsdev/gameserver-tf2