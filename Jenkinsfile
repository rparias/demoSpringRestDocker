pipeline {
    agent { docker { image 'maven' } }
    stages {
        stage('Build Jar') {
            steps {
                dir('demo-apirest-crud') {
                    sh 'mvn -v'
                    sh 'mvn clean install -DskipTests'
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
