pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t mongmang/const-app:latest .'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
                sh 'docker push mongmang/const-app:latest'
                    }
                }
        }
        stage('Deploy') {
            steps {
                script {
                    withCredentials([sshUserPrivateKey(credentialsId: 'sshKeygen', keyFileVariable: 'identity', passphraseVariable: '', usernameVariable: 'userName')]) {
                        def remote = [:]
                        remote.name = 'readyidc'
                        remote.host = '203.159.93.42'
                        // remote.port = 22
                        remote.allowAnyHosts = true
                        remote.user = userName
                        remote.identityFile = identity
                        remote.password = 'p3N0*cgjq1d1'
                        sshCommand remote: remote, command: "docker pull mongmang/const-app:latest"
                        sshCommand remote: remote, command: "docker compose stop"
                        sshCommand remote: remote, command: "docker compose up -d"
                    }
                }
            }
        }
    }
}
