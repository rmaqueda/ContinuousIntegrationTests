pipeline {

  agent any

  stages {

    stage('Run Unit Test') {
      steps {
        sh 'fastlane ios tests'
      }
    }

  }

  post {
    always {
      junit 'fastlane/test_output/*.junit'
      cleanWs()
    }
  }

}

