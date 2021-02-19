docker ps -q --filter "name=${APP_NAME}" | grep -q . && docker stop spring-app && docker rm -fv spring-app
echo 'Deteniendo app'
# docker image prune -a --filter "until=${date}T$hour:$min10:00"
docker image prune -a --filter="label=spring-app" -f