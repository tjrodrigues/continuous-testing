stage ('Build'){
	node('testEnv'){
		sh "echo Checking out and build solution..."
		git 'https://github.com/tjrodrigues/continuous-testing.git'
		withMaven(maven: 'maven3') {
			sh "mvn clean install -f spring-petclinic-rest-master/pom.xml"
		}
	}
}

stage('Unit Test & Satic Analysis') {
	parallel (
		"Unit Test" : { 
			node ('testEnv') {                          
				sh "echo Executing Unit tests..." 
				withMaven(maven: 'maven3') {
					sh "mvn test -f spring-petclinic-rest-master/pom.xml"
				}
				//junit 'webgoat-container/target/surefire-reports/*.xml'
			} 
		},
		"SonarQube" : { 
			node ('testEnv') {   
				//def mvnHome
				//mvnHome = tool 'M3'
				//sh "echo Executing SonarQube Analysis..." 
				//checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CloneOption', depth: 0, noTags: false, reference: '', shallow: false, timeout: 30]], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/tjrodrigues/continuousTesting.git']]])
				//withSonarQubeEnv('sonar.critical.pt') {
				//	if (isUnix()) {
				//		sh "'${mvnHome}/bin/mvn' install $SONAR_MAVEN_GOAL -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.login=$SONAR_AUTH_TOKEN"
				//	} else {
				//		bat(/"${mvnHome}\bin\mvn" install $SONAR_MAVEN_GOAL -Dsonar.host.url=$SONAR_HOST_URL -Dsonar.login=$SONAR_AUTH_TOKEN/)
				//	}
				//} 
			} 
		}
	)
}