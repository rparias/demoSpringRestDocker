docker-jenkins-start:
	docker run --name jenkins -p 8081:8080 -p 50000:50000 -v $(shell pwd)/jenkins_home:/var/jenkins_home jenkins/jenkins:lts