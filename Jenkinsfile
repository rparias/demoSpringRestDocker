pipeline {
    agent any
    stages {
        stage('Build Jar') {
            agent {
                docker { image 'maven:3-alpine' }
            }
            steps {
                dir('demo-apirest-crud') {
                    sh 'echo Prueba de Docker y maven'
                    sh 'mvn --version'
                    sh 'mvn clean install -DskipTests'
                    sh 'ls -la target/'
                }
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'docker ps'
            }
        }
    }
}
