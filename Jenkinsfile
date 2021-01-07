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

      emailext  body: '''${SCRIPT, template="build-report.groovy"}''',
                subject: '[Jenkins FP] ${JOB_NAME}',
                recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']]

      cleanWs()
    }
  }

}

