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
            post {
                success {
                    echo 'Deleting image from Jenkins'
                    sh "docker rmi rparias/springtest:v${BUILD_NUMBER}"
                }
            }
        }
        stage('Deploy to Server') {
            steps {
                script {
                    def TAG = "v${BUILD_NUMBER}"
                    sh 'scp -i ~/.ssh/id_rsa ./docker-compose-app.yml ronaldarias@10.211.55.6:/home/ronaldarias/server'
                    sh "ssh -i ~/.ssh/id_rsa ronaldarias@10.211.55.6 'export BUILD_NUMBER=${TAG} && export APP_NAME=spring-app && cd server && sh stop-spring-app.sh && docker-compose -f docker-compose-app.yml up -d'"
                }
            }
        }
    }
//buscar q el terminal me devuelva 0 (exit code 0), y tambien que el prune ponga por defecto Y, y crear el script para la fecha
//crear el post despues de todo para borrar las images
}

// q pasos deberia tener el pipeline de produccion
// armar un caso de estudio, basado en eso vamos a disenar el pipeline
// averiguar como usar la api de docker registry y docker hub
// se pueden leer todos los tags en el docker registry
