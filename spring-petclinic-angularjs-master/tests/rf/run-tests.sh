#!/bin/bash
export PATH=$PATH:/home/vagrant
cd $1/spring-petclinic-angularjs-master/tests/rf
pybot -v HOMEPAGE:$2 tests/web-tests.robot
