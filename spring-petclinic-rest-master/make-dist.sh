#!/bin/bash
rm -rf spring-petclinic
mkdir -p spring-petclinic
cp mvnw spring-petclinic
cp mvnw.cmd spring-petclinic
cp pom.xml spring-petclinic
cp -r target spring-petclinic
rm -rf spring-petclinic/target/generated-test-sources spring-petclinic/target/maven-status spring-petclinic/target/spring-petclinic-1.5.2.war.original spring-petclinic/target/surefire-reports spring-petclinic/target/maven-archiver spring-petclinic/target/spring-petclinic-1.5.2 spring-petclinic/target/test-classes
tar -zcvf spring-petclinic.tar.gz spring-petclinic

