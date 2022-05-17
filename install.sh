#!/bin/bash
echo "############################################"
echo "############################################"
echo "###########                     ############"
echo "###########   Fahmi GHAMACHA    ############"
echo "###########      - FGA -        ############"
echo "###########                     ############"
echo "############################################"
echo "############################################"
echo "############################################"
echo
# edit the next lien to point to your project directory 
DIR_SETUP="/appli/myapp"
# read -p ' Please insert the setup directory: ' DIR_SETUP
echo "Starting install with setup directory ==> $DIR_SETUP"
echo
DIR_NGINX="$DIR_SETUP/nginx"
DIR_NEXTCLOUD="$DIR_SETUP/nextcloud"
DIR_TOOLS="$DIR_SETUP/tools"
echo
echo "########### Create Network  ##########"
echo
docker network create -d overlay myapp;
echo
echo "########### Build the proxy image ##########"
cd $DIR_NGINX;
docker build -t nginx .
echo
echo "########### Create the nextcloud stack  #########"
cd $DIR_NEXTCLOUD;
docker stack deploy -c docker-compose.yml nextcloud;
echo
echo "########### Create the nginx stack  ##########"
cd $DIR_NGINX;
echo
docker stack deploy -c docker-compose.yml nginx;
echo
echo "########### Create Tools stack  ##########"
echo
cd $DIR_TOOLS;
# docker stack deploy -c docker-compose.yml tools;
