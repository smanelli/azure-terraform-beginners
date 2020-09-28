#!/bin/sh
# Deploys a simple Docker and starts Redis image


apt update
#apt install docker
snap install docker
sleep 10
systemctl start snap.docker.dockerd.service
docker network create redis-network
#docker run --name myredis -d --network redis-network redis redis-server --appendonly yes
docker run --name myredis -d --net=host redis redis-server --appendonly yes
docker run --name myredis -d --expose 6379 -p 6379:6379 redis redis-server --appendonly yes
#docker run -it --network redis-network --rm redis redis-cli -h myredis
#docker run -it --net=host --rm redis redis-cli -h myredis



# cd /tmp
# apt-get -y update > /dev/null 2>&1
# apt install -y apache2 > /dev/null 2>&1

# cat << EOM > /var/www/html/index.html
# <html>
#   <head><title>Meow!</title></head>
#   <body style="background-image: linear-gradient(red,orange,yellow,green,blue,indigo,violet);">
#   <center><img src="http://placekitten.com/800/600"></img></center>
#   <marquee><h1>Meow World</h1></marquee>
#   </body>
# </html>
# EOM

echo "Your demo is now ready."