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
				withSonarQubeEnv('SonarQube'){
					withMaven(maven: 'maven3'){
						sh "mvn install -f spring-petclinic-reactjs-master/pom.xml -DskipTests $SONAR_MAVEN_GOAL -Dsonar.host.url=$SONAR_HOST_URL"
					}
				} 
			} 
		}
	)
}

stage ('Packaging'){
	node('testEnv'){
		sh "echo Create distribution package and save it to Nexus"
		withMaven(maven: 'maven3'){
			sh "mvn package -DskipTests -f spring-petclinic-reactjs-master/pom.xml"
		}

	}
}