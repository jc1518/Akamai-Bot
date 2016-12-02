#!/bin/bash

NAME='akamai-bot'

case $1 in
	build)
		docker build -t $NAME .
		;;
	delete)
		echo 'deleting old container and image...'
		docker rm $NAME && docker rmi $NAME
		;;
	create)
		if [[ $(docker ps | grep -c $NAME) -ne 0 ]]; then
			echo 'stopping running container...'
			docker stop $NAME
		fi
		if [[ $(docker ps -a | grep -c $NAME) -ne 0 ]]; then
			echo 'removing old container...'
			docker rm $NAME
		fi
		echo 'creating new container...'
	  docker run --env-file ./credentials -v /etc/localtime:/etc/localtime:ro --name $NAME -it $NAME
	  ;;
	log)
	  docker logs -f $NAME
	  ;;  
	start)
    echo 'starting container...'
	  docker start $NAME
	  ;;
	stop)
		echo 'stopping container...'
	  docker stop $NAME
	  ;;
	 *)
	 echo 'usage: helper.sh <build|create|delete|start|stop>'
	 echo ''
	 ;;
esac