pipeline {
    agent { docker { image 'maven' } }
    stages {
        stage('Build Jar') {
            steps {
                dir('demo-apirest-crud') {
                    sh 'docker run -it --rm maven:3.3-jdk-8 mvn clean install'
                    sh 'ls -la target/'
                }
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'Build Docker Image'
            }
        }
    }
}
