pipeline {
    agent any
    stages {
        stage('Build Jar') {
            steps {
                dir('demo-apirest-crud') {
                    sh './mvnw clean install -DskipTests'
                    sh 'ls -la target/'
                }
            }
        }
        stage('Build Docker image') {
        }
    }
}
