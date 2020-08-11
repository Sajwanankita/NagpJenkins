pipeline {
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
                sh 'mvn -Dmaven.test.failure.ignore=true install' 
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
                }
            }
        }
    }
}
