def notifyStarted(){
  slackSend (channel: '#jenkins', color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
}

pipeline{
    agent any

    /* triggers {
        pollSCM('*//* 3 * * * *')
    } */
    environment {
        AWS_DEFAULT_REGION = 'ap-northeast-2'
        HOME = '.'
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
        }
    }
}