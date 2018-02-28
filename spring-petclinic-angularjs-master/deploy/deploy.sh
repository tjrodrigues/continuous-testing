#!/bin/bash
# $1 -> nexus repo ip and port
# $2 -> application version
# $3 -> application home directory

sudo mkdir -p $3/app-deploy
sudo wget http://$1/repository/maven-releases/org/criticalsoftware/sspa/petclinic/$2/petclinic-$2.tar.gz -O $3/app-deploy/petclinic-$2.tar.gz
sudo chmod +x $3/app-deploy/petclinic-$2.tar.gz
sudo tar -xvf $3/app-deploy/petclinic-$2.tar.gz -C $3/app-deploy
cd $3/app-deploy/spring-petclinic-angularjs-master
sudo chmod -R +x ./*
//sudo ./mvnw clean install
cd $3/app-deploy/spring-petclinic-angularjs-master/spring-petclinic-server
sudo nohup ../mvnw spring-boot:run &
