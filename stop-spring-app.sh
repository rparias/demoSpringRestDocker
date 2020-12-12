docker ps -q --filter "name=spring-app" | grep -q . && docker stop spring-app && docker rm -fv spring-app
echo 'Deteniendo app'