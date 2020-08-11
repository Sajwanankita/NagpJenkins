pipeline {
    agent any
  
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
    stages {
        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package' 
            }
        }
    }
}
