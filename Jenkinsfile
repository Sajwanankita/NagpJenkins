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

	    
	    stage ('Start container') {
            steps {
               bat '''
  		  docker ps
		  set name = 'hello'
		  %%(docker ps -qf "name=%%name")
 		 '''
            }
        }
	    
	    
    }
}
