pipeline {
  agent any
  stages {
    stage('Stage 1') {
      steps {
        sh 'echo "I am here $BUILD_NUMBER"'
      }
    }

  }
  environment {
    DEMO = '1'
  }
}