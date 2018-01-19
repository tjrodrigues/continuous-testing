stage ('Build'){
	node('testEnv'){
		sh "echo Checking out and build solution..."
		git 'https://github.com/tjrodrigues/continuous-testing.git'
		withMaven(maven: 'maven3') {
			sh '''cd ${WORKSPACE}/spring-petclinic-angularjs-master
				./mvnw clean install -DskipTests'''
		}
	}
}

stage('Unit Test & Satic Analysis') {
	parallel (
		"Unit Test" : { 
			node ('testEnv') {                          
				sh "echo Executing Unit tests..." 
				withMaven(maven: 'maven3') {
					sh "cd ${WORKSPACE}/spring-petclinic-angularjs-master"
					sh "./mvnw test"
				}
			} 
		},
		"SonarQube" : { 
			node ('testEnv') {   
				sh "echo Executing SonarQube Analysis..." 
				git 'https://github.com/tjrodrigues/continuous-testing.git'
				withSonarQubeEnv('SonarQube'){
					withMaven(maven: 'maven3'){
						sh "cd ${WORKSPACE}/spring-petclinic-angularjs-master"
						sh "./mvnw install -DskipTests $SONAR_MAVEN_GOAL -Dsonar.host.url=$SONAR_HOST_URL"
					}
				} 
			} 
		}
	)
}

stage ('Packaging'){
	node('testEnv'){
		sh "echo Create distribution package and save it to Nexus"
		nexusArtifactUploader artifacts: [[artifactId: 'petclinic', classifier: '', file: "${WORKSPACE}/spring-petclinic-angularjs-master/target/petclinic-dist.tar.gz", type: 'tar.gz']], credentialsId: 'Nexus', groupId: 'org.criticalsoftware.sspa', nexusUrl: '192.168.3.11:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-releases', version: "1.4.${BUILD_NUMBER}"

	}
}

stage ('Deploy'){
	node('testEnv'){
		sh "echo Deploying services ..."
		sh "${WORKSPACE}/spring-petclinic-angularjs-master/deploy/deploy.sh 192.168.3.11:8081 1.4.${BUILD_NUMBER}"
		waitUntil {
			// Wait until app is up and running
			try {
				//sh 'timeout 240 wget --retry-connrefused --tries=240 --waitretry=10 http://localhost:8080/api/pettypes' // -o /dev/null
				return true
				} catch (exception) {
					return false
				}
		}
	}
}
