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
    tools {
        jdk("openJDK11")
    }
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


    stages{
        stage('git clone'){

            agent any

            steps {
                echo 'git clone'

                git credentialsId: 'github-jenkins-ssh',
                    branch: 'master',
                    url: 'git@github.com:oen142/spring-jenkins-codedeploy-tutorial.git'
            }
            post {
                success {
                    echo 'successfully clone'
                    notifyStarted()
                }
                always {
                    echo 'i tired ..'
                }
                cleanup {
                    echo 'after all other post'
                }
                failure {
                    echo 'fail clone'
                    notifyStarted()


                }
            }
        }

        stage('S3 Upload'){
            steps {

                sh '''
                aws configure list
                '''
                echo 'S3 Deploy ENV :'
                sh '''
                aws s3 sync ./ s3://dreammaker-jenkins-s3/test
                '''
            }

        }
    }
}