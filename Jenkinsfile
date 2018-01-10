stage ('Build'){
	node('testEnv'){
		sh "echo Checking out and build solution..."
		git 'https://github.com/tjrodrigues/continuous-testing.git'
		withMaven(maven: 'maven3') {
			sh "mvn clean install -f spring-petclinic-reactjs-master/pom.xml -DskipTests"
		}
	}
}

stage('Unit Test & Satic Analysis') {
	parallel (
		"Unit Test" : { 
			node ('testEnv') {                          
				sh "echo Executing Unit tests..." 
				withMaven(maven: 'maven3') {
					sh "mvn test -f spring-petclinic-reactjs-master/pom.xml"
				}
				//junit 'webgoat-container/target/surefire-reports/*.xml'
			} 
		},
		"SonarQube" : { 
			node ('testEnv') {   
				sh "echo Executing SonarQube Analysis..." 
				git 'https://github.com/tjrodrigues/continuous-testing.git'
				withSonarQubeEnv('SonarQube'){
					withMaven(maven: 'maven3'){
						sh "mvn clean install -f spring-petclinic-reactjs-master/pom.xml -DskipTests $SONAR_MAVEN_GOAL -Dsonar.host.url=$SONAR_HOST_URL"
					}
				} 
			} 
		}
	)
}

stage ('Packaging'){
	node('testEnv'){
		sh "echo Create distribution package and save it to Nexus"
		//sh "mvn clean package -DskipTests -f spring-petclinic-reactjs-master/pom.xml"
		sh "echo ************************** ${WORKSPACE}/spring-petclinic-reactjs-master/target/petclinic-dist.tar.gz"
		nexusArtifactUploader artifacts: [[artifactId: 'petclinic', classifier: '', file: "${WORKSPACE}/spring-petclinic-reactjs-master/target/petclinic-dist.tar.gz", type: 'tar.gz']], credentialsId: 'Nexus', groupId: 'org.criticalsoftware.sspa', nexusUrl: '192.168.3.22:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'maven-snapshots', version: '1.4.0-SNAPSHOT'

	}
}