pipeline {
  agent any
  stages {
    stage('Stage 1') {
      steps {
        echo 'Hello $BUILD_NUMBER from $DEMO'
      }
    }

  }
  environment {
    DEMO = '1'
  }
}