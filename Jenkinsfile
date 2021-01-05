pipeline {

  agent any

  options {
    ansiColor('xterm')
  }

  environment {
    XC_PROJECT= "ContinuousIntegrationTests.xcodeproj"
    XC_SCHEME = "ContinuousIntegrationTests"
    SOURCE_DIR = "ContinuousIntegrationTests"
  }

  stages {

    stage('Install dependencies') {
      steps {
        sh 'bundle install'
      }
    }

    stage('Run Unit Test') {
      steps {
        sh 'bundle exec fastlane ios tests'
      }
    }

    stage('Quality measure') {
      steps {
        sh 'slather coverage -x --scheme ${XC_SCHEME} --output-directory sonar-reports --jenkins ${XC_PROJECT}'
        sh 'swiftlint lint ${SOURCE_DIR} > sonar-reports/swiftlint.txt'
        sh 'lizard --xml ${SOURCE_DIR} > sonar-reports/lizard-report.xml'
        sh 'tailor -no-color --max-line-length=100 --max-file-length=500 --max-name-length=40 --max-name-length=40 --min-name-length=4 ${SOURCE_DIR} > sonar-reports/${XC_SCHEME}-tailor.txt'

        script {
          if (env.CHANGE_ID) {
            sh 'sonar-scanner -Dsonar.login=${SONAR_TOKEN} -Dsonar.pullrequest.key=${CHANGE_ID} -Dsonar.pullrequest.branch=${CHANGE_BRANCH} -Dsonar.pullrequest.base=${CHANGE_TARGET}'
          } else {
            sh 'sonar-scanner -Dsonar.login=${SONAR_TOKEN} -Dsonar.branch.name=${GIT_BRANCH}'
          }
        }
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

