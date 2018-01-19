stage ('Deploy'){
	parallel (
			"Service deployment" : { 
				node ('testEnv') {                          
					sh "echo Deploying services ..."
					sh "spring-petclinic-reactjs-master/deploy/deploy-services.sh 192.168.3.11:8081 1.4.38"
					waitUntil {
						// Wait until app is up and running
						try {
							//sh 'timeout 120 bash -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' 192.168.3.11:8080/api/pettypes)" != "200" ]]; do sleep 5; done''
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
							//sh 'timeout 120 bash -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' 192.168.3.11:8080/api/pettypes)" != "200" ]]; do sleep 5; done''
							return true
							} catch (exception) {
								return false
							}
					}
				} 
			}
		)
}