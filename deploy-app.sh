scp -i ~/.ssh/id_rsa ./docker-compose-app.yml ./docker-compose-db.yml \
./script.sql ./stop-spring-app.sh ronaldarias@$1:/home/ronaldarias/server

ssh -i ~/.ssh/id_rsa ronaldarias@$1 "export BUILD_NUMBER=$2 && export APP_NAME=spring-app && cd server && sh stop-spring-app.sh && docker-compose -f docker-compose-app.yml up -d"