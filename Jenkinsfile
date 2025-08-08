pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/takopachi/bigbucks-monitor.git'
            }
        }
        stage('Deploy to Monitor Server') {
            steps {
                sh 'scp -o StrictHostKeyChecking=no -r * administrator@192.168.222.180:/opt/monitor/'
                sh 'ssh -o StrictHostKeyChecking=no administrator@192.168.222.180 "/opt/monitor/deploy.sh"'
            }
        }
    }
}
