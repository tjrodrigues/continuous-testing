stage ('Deploy'){
	parallel (
			"Service deployment" : { 
				node ('testEnv') {                          
					sh "echo Deploying services ..."
					sh "spring-petclinic-reactjs-master/deploy/deploy-services.sh 192.168.3.11:8081 1.4.42"
					waitUntil {
						// Wait until app is up and running
						try {
							sh 'timeout 15 wget --retry-connrefused --tries=25 --waitretry=10 http://localhost:8080/api/pettypes' // -o /dev/null
							return true
							} catch (exception) {
								return false
							}
					}
				} 
			},
			"Frontend deployment" : { 
				node ('testEnv') {                          
					sh "echo Deploying frontend ..."
					sh "spring-petclinic-reactjs-master/deploy/deploy-frontend.sh"
					waitUntil {
						// Wait until app is up and running
						try {
							sh 'timeout 15 wget --retry-connrefused --tries=25 --waitretry=10 http://localhost:4444' // -o /dev/null
							return true
							} catch (exception) {
								return false
							}
					}
				} 
			}
		)
}