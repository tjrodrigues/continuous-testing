#!/bin/bash
# $1 -> nexus repo ip and port
# $2 -> application version
# $3 -> application home directory


# sudo mkdir -p $HOME/petclinic
sudo mkdir -p $3/deploy/
wget http://$1/repository/maven-releases/org/criticalsoftware/sspa/petclinic/$2/petclinic-$2.tar.gz -O $3/petclinic-$2.tar.gz
sudo chmod +x $3/petclinic-$2.tar.gz
sudo tar -xvf $3/petclinic-$2.tar.gz -C $3/deploy/
cd $3/deploy/spring-petclinic-angularjs-master
sudo chmod -R +x ./*
./mvnw clean install
cd spring-petclinic-server
../mvnw spring-boot:run 

