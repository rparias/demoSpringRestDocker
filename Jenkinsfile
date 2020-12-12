pipeline {
    agent any
    stages {
        stage('Build Jar') {
            agent { docker { image 'maven' } }
            steps {
                dir('demo-apirest-crud') {
                    sh 'mvn -v'
                    sh 'mvn clean install'
                    sh 'ls -la target/'
                }
            }
        }
        stage('Build Docker image') {
            steps {
                dir('demo-apirest-crud') {
                    sh "docker build -t rparias/springtest:v${BUILD_NUMBER} ."
                    withCredentials([usernamePassword(credentialsId: 'docker_hub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        sh "docker login --username ${USERNAME} --password ${PASSWORD}"
                        sh "docker push rparias/springtest:v${BUILD_NUMBER}"
                    }
                }
            }
        }
        stage('Deploy to Server') {
            steps {
                sh 'scp -i ~/.ssh/id_rsa ./docker-compose-app.yml ronaldarias@10.211.55.6:/home/ronaldarias/server'
                sh 'ssh -i ~/.ssh/id_rsa ronaldarias@10.211.55.6 "docker ps -q --filter "name=spring-app" | grep -q . && docker stop spring-app && docker rm -fv spring-app"'
                sh 'ssh -i ~/.ssh/id_rsa ronaldarias@10.211.55.6 "export BUILD_NUMBER=${BUILD_NUMBER} && cd server && docker-compose -f docker-compose-app.yml up -d"'
            }
        }
    }
}
