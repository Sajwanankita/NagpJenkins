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
	stage("build & SonarQube analysis") {
            agent any
            steps {
                withSonarQubeEnv('sonarqube') {
                bat 'mvn clean package sonar:sonar'
                }
            }
         }
stage ('Upload file') {
            steps {
                rtUpload (
                    serverId: 'nagp_server', // Obtain an Artifactory server instance, defined in Jenkins --> Manage:
                    spec: """{
                            "files": [
                                    {
                                        "pattern": "**/*.jar",
                                        "target": "nagp_demo_snapshot"
                                    }
                                ]
                            }"""
                )
            }
        }

        stage ('Publish build info') {
            steps {
                rtPublishBuildInfo (
                    serverId: 'nagp_server'
                )
            }
        }

        stage ('Set output resources') {
            steps {
                // 'jfPipelines' step will be skipped if the build is not triggered by JFrog Pipelines.
                jfPipelines(
                    /**
                    * Sets the output resources to send to JFrog Pipelines.
                    * 'pipelinesBuildInfo' is the build-info resource defined in JFrog Pipelines.
                    */
                    outputResources: """[
                        {
                            "name": "pipelinesBuildInfo",
                            "content": {
                                "buildName": "${env.JOB_NAME}",
                                "buildNumber": "${env.BUILD_NUMBER}"
                            }
                        }
                    ]"""
                )
            }
        }
	    
         stage ('Docker Image') {
            steps {
		    bat 'docker build -t sajwanankita/jenkins_demo:1.0 --no-cache -f Dockerfile .' 
            }
        }
	    
	 stage ('Docker push') {
            steps {
                withDockerRegistry([ credentialsId: "dockerId", url: "" ]) {
          	bat 'docker push sajwanankita/jenkins_demo:1.0'
        	}
            }
        }
	    
	    stage ('Start container') {
            steps {
               bat '''
  		  ContainerId= $(docker ps | grep 8080 | cut -d "" -f 1)
    	          if [ ContainerId ]
		  then 
		  	docker stop ContainerId
			docker rm -f ContainerId
 		 '''
            }
        }
	    
	    
    }
}
