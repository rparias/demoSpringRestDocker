pipeline {
    agent any
    stages {
        stage('Build Jar') {
            steps {
                dir('demo-apirest-crud') {
                    sh 'mvn clean install'
                    sh 'ls -la target/'
                }
            }
        }
    }
}
