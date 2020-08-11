pipeline {
    agent any
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
        stage('Build') { 
            steps { 
		bat 'mvn -B -DskipTests clean package' 
            }
        }
    }
}
