pipeline {
	environment {
   		 registry = "sajwanankita/jenkins_demo"
    		registryCredential = 'dockerId'
	}
    agent any
    tools { 
        maven 'Maven' 
        jdk 'JDK' 
    }
    stages {
	    
	    
	stage('clean') { 
		steps {
			deleteDir()
		}
	}

	stage('checkout') {
		steps {
			checkout scm
		}
	}
        stage ('Build') {
            steps {
                bat 'mvn -Dmaven.test.failure.ignore=true install' 
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
                }
            }
        }
	

     
	    
	    stage ('Docker push 2') {
            steps {
               bat '''
  		  FOR /F "tokens=* USEBACKQ" %%F IN (`docker ps -a -qf name^=hello_world`) DO (
                        SET ContainerID=%%F
			ECHO %%F
			ECHO %ContainerID%
			ECHO %%ContainerID
			
                    )
		    ECHO %ContainerID%
		    
					
			IF [%ContainerID%] EQU []  (
			   docker run -d --name hello_world sajwanankita/jenkins_demo:1.0
			) ELSE (
				docker restart ContainerID
			)
		  
 		 '''
            }
        }
	    
	    
    }
}
