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
		sh '''
		echo "PATH = ${PATH}"
		echo "M2_HOME = ${M2_HOME}"
		'''
            }
        }
    }
}
