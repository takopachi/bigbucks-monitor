pipeline {
    agent any

    environment {
        REMOTE_HOST = "192.168.222.180"
        REMOTE_DIR = "/opt/monitor"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git credentialsId: 'github-token', url: 'https://github.com/takopachi/bigbucks-monitor.git', branch: 'main'
            }
        }

        stage('Deploy to Monitor Server') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: 'monitor-key', keyFileVariable: 'SSH_KEY', usernameVariable: 'SSH_USER')]) {
                    sh '''
                        scp -i "$SSH_KEY" -o StrictHostKeyChecking=no -r Jenkinsfile app.py deploy.sh requirements.txt static templates "$SSH_USER@$REMOTE_HOST:$REMOTE_DIR/"
                        ssh -i "$SSH_KEY" -o StrictHostKeyChecking=no "$SSH_USER@$REMOTE_HOST" "$REMOTE_DIR/deploy.sh"
                    '''
                }
            }
        }
    }
}
