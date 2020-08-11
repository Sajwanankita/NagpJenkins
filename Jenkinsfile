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
                bat 'mvn -Dmaven.test.failure.ignore=true install' 
            }
            post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
                }
            }
        }
	stage("build & SonarQube analysis") {
            agent any
            steps {
                withSonarQubeEnv('sonarqube') {
                bat 'mvn clean package sonar:sonar'
                }
            }
         }
    }
}
