stage ('Build'){
	node('testEnv'){
		sh "echo Checking out and build solution..."
		git 'https://github.com/tjrodrigues/continuous-testing.git'
//		withMaven(maven: 'maven3') {
//			sh '''cd ${WORKSPACE}/spring-petclinic-angularjs-master
//				./mvnw clean install -DskipTests'''
//		}
	}
}

stage('Unit Test & Satic Analysis') {
	parallel (
		"Unit Test" : { 
			node ('testEnv') {                          
				sh "echo Executing Unit tests..." 
				//withMaven(maven: 'maven3') {
				//  sh '''cd ${WORKSPACE}/spring-petclinic-angularjs-master
				//	./mvnw test'''
				//}
			} 
		},
		"SonarQube" : { 
			node ('testEnv') {   
				sh "echo Executing SonarQube Analysis..." 
				git 'https://github.com/tjrodrigues/continuous-testing.git'
				//withSonarQubeEnv('SonarQube'){
					//withMaven(maven: 'maven3'){
					//	sh '''cd ${WORKSPACE}/spring-petclinic-angularjs-master
					//	./mvnw install -DskipTests $SONAR_MAVEN_GOAL -Dsonar.host.url=$SONAR_HOST_URL'''
					//}
				//} 
			} 
		}
	)
}

stage ('Packaging'){
	node('testEnv'){
		sh "echo Create distribution package and save it to Nexus"
		//sh '''cd ${WORKSPACE}
		//sudo tar -czvf spring-petclinic-angularjs-master.tar.gz spring-petclinic-angularjs-master/'''
		//nexusArtifactUploader artifacts: [[artifactId: 'petclinic', classifier: '', file: "${WORKSPACE}/spring-petclinic-angularjs-master.tar.gz", type: 'tar.gz']], credentialsId: 'Nexus', groupId: 'org.criticalsoftware.sspa', nexusUrl: '192.168.3.11:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-releases', version: "2.0.${BUILD_NUMBER}"

	}
}

stage ('Deploy'){
	node('testEnv'){
		sh "echo Stopping previous deployments ..."
		sh "pgrep -f wrapper | sudo xargs kill -9"
		sh "pgrep -f mvnw | sudo xargs kill -9"
		sh "echo Deploying services ..."
		//sh "${WORKSPACE}/spring-petclinic-angularjs-master/deploy/deploy.sh 192.168.3.11:8081 2.0.${BUILD_NUMBER} ${WORKSPACE}"
		sh "${WORKSPACE}/spring-petclinic-angularjs-master/deploy/deploy.sh 192.168.3.11:8081 2.0.1 ${WORKSPACE}"
		sh '''cd ${WORKSPACE}/app-deploy/spring-petclinic-angularjs-master/
		export JENKINS_NODE_COOKIE=dontKillMe
		sudo nohup ./mvnw spring-boot:run &'''
		//waitUntil {
			// Wait until app is up and running
		    //try {
				//sh 'timeout 30 wget --retry-connrefused --tries=15 --waitretry=10 http://192.168.3.11:8080' // -o /dev/null
				//return true
				//} catch (exception) {
					//return false
				//}
		//}
	}
}
