stage ('Build'){
	node('testEnv'){

		git 'https://github.com/tjrodrigues/continuous-testing.git'
		
		withMaven(maven: 'maven3') {
        // some block
			sh "mvn clean install"
		}

		
	}
}
