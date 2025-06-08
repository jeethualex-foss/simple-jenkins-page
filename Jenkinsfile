pipeline {
    agent any
    stages {
        stage('Example') {
            steps {
                echo 'Hello World'

                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/jeethualex-foss/simple-jenkins-page.git']])

                sh '''
                java --version
                ls -la
                '''
            }
        }
    }
}