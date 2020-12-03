pipeline {
    agent any
    stages {
        // stage('Build Jar') {
        //     agent { docker { image 'maven' } }
        //     steps {
        //         dir('demo-apirest-crud') {
        //             sh 'mvn -v'
        //             sh 'mvn clean install'
        //             sh 'ls -la target/'
        //         }
        //     }
        // }
        // stage('Build Docker image') {
        //     steps {
        //         dir('demo-apirest-crud') {
        //             sh "docker build -t rparias/springtest:v${BUILD_NUMBER} ."
        //             withCredentials([usernamePassword(credentialsId: 'docker_hub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
        //                 sh "docker login --username ${USERNAME} --password ${PASSWORD}"
        //                 sh "docker push rparias/springtest:v${BUILD_NUMBER}"
        //             }
        //         }
        //     }
        // }
        stage('Deploy to Server') {
            steps {
                sh 'scp -i ~/.ssh/id_rsa ./docker-compose.yml ./script.sql ronaldarias@10.211.55.5:/home/ronaldarias/server'
            }
        }
    }
}
