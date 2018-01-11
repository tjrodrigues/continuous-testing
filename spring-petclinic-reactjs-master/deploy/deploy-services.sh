#!/bin/bash
# $1 -> nexus repo ip and port
# $2 -> application version

sudo -S <<< "eumetsatvv" rm -rf $HOME/petclinic
# sudo mkdir -p $HOME/petclinic
sudo wget http://$1/repository/maven-releases/org/criticalsoftware/sspa/petclinic/$2/petclinic-$2.tar.gz -O $HOME/petclinic-$2.tar.gz
sudo chmod +x $HOME/petclinic-$2.tar.gz
sudo tar -xvf $HOME/petclinic-$2.tar.gz -C $HOME/
sudo chmod +x $HOME/petclinic/mvnw
cd $HOME/petclinic
sudo ./mvnw spring-boot:run &
