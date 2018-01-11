#!/bin/bash
# $1 -> nexus repo ip and port 
# $2 -> application version


rm -rf $HOME/petclinic
mkdir -p $HOME/petclinic
wget http://$1/repository/maven-releases/org/criticalsoftware/sspa/petclinic/$2/petclinic-$2.tar.gz -O $HOME/petclinic/petclinic-$2.tar.gz
chmod +x mkdir -p $HOME/petclinic/petclinic-$2.tar.gz
tar -xvf $HOME/petclinic/petclinic-$2.tar.gz
$HOME/petclinic/petclinic-$2/mvnw spring-boot:run
$HOME/petclinic/petclinic-$2/client/npm install
$HOME/petclinic/petclinic-$2/client/PORT=4444 npm start
