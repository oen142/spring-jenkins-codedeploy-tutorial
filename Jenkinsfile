def notifyStarted(){
  slackSend (channel: '#jenkins', color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
}

def notifyEnd(){
    slackSend (channel: '#cicd', color: '#000000', message: "End: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
}

def notifySuccessful(stage){
    slackSend (channel: '#cicd', color: '#00FF00', message: "SUCCESSFUL ${stage}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
}

def notifyFailed(stage){
    slackSend (channel: '#cicd', color: '#FF0000', message: "FAILED ${stage} : Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
}

pipeline{
    agent any

    triggers {
        pollSCM('*/3 * * * *')
    }



    /* triggers {
        pollSCM('*//* 3 * * * *')
    } */
    environment {
        AWS_DEFAULT_REGION = 'ap-northeast-2'
        HOME = '.'
    }

    stages {
        stage('SonarQube'){
          environment {
            scannerHome = tool 'SonarQubeScanner'
          }

          steps {

            withSonarQubeEnv('SonarQubeServer') { // Will pick the global server connection you have configured

              sh 'chmod +x ./gradlew'
              sh './gradlew sonarqube'

            }
          }
        }
    }

}