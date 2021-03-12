server_ip=$1
version=$2

scp -i ~/.ssh/id_rsa ./docker-compose-app.yml ./docker-compose-db.yml \
./script.sql ./stop-spring-app.sh ronaldarias@$server_ip:/home/ronaldarias/server

ssh -i ~/.ssh/id_rsa ronaldarias@$server_ip "export BUILD_NUMBER=$version && export APP_NAME=spring-app && cd server && sh stop-spring-app.sh && docker-compose -f docker-compose-app.yml up -d"