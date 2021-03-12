echo ${USERNAME}
wget -q https://registry.hub.docker.com/v1/repositories/rparias/springtest/tags -O -  | sed -e 's/[][]//g' -e 's/ //g' -e 's/ //g' | tr '}' '\n'  | awk -F: '{print $3}'