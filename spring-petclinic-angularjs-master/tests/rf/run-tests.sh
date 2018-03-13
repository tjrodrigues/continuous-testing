#!/bin/bash
export PATH=$PATH:/home/vagrant/
cd $1/spring-petclinic-angularjs-master/tests/rf
pybot -v HOMEPAGE:http://192.168.3.11:8080 tests/web-tests.robot
