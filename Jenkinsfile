pipeline {
  agent any
  stages {
    stage('Stage 1') {
      steps {
        sh 'echo "Hello $BUILD_NUMBER from $DEMO"'
      }
    }

  }
  environment {
    DEMO = '1'
  }
}