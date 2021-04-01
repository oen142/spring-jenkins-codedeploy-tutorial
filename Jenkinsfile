def notifyStarted(){
  slackSend (channel: '#jenkins', color: '#FFFF00', message: "STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
}

def notifyEnd(){
    slackSend (channel: '#jenkins', color: '#000000', message: "End: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
}

def notifySuccessful(stage){
    slackSend (channel: '#jenkins', color: '#00FF00', message: "SUCCESSFUL ${stage}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
}

def notifyFailed(stage){
    slackSend (channel: '#jenkins', color: '#FF0000', message: "FAILED ${stage} : Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
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
        stage('START'){
            steps {
                notifyStarted()
            }
        }

        stage('JAVA Build Test'){
            steps {
                echo 'JAVA Build'
                dir('./execute'){
                    sh 'sh ./buildTest.sh'
                }
            }

            post {
                success {
                    echo 'SUCCESSFULLY JAVA Build Test'
                    notifySuccessful('JAVA Build Test')
                }

                failure {
                    echo 'Failed JAVA Build Test'
                    notifyFailed('JAVA Build Test Failed')
                }
            }
        }
        stage('JAVA Build'){
            steps {
                echo 'JAVA Build'
                dir ('./execute'){
                    sh 'sh ./build.sh'
                }
            }
            post {
                success {
                    echo 'SUCCESSFUL JAVA Build'
                    notifySuccessful('JAVA Build')
                }
                failure
            }
        }
    }

}
