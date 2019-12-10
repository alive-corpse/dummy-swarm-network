#!/bin/sh
set -e
cd `dirname "$0"`
[ -f ".env" ] && . ./.env

OVERLAYED=`docker network ls | awk 'NR>1 && $3~/overlay/ && $4~/^swarm$/ { print $2 }'`
echo "Checking and creating overlayed networks"
cat docker-deploy.tpl | sed 's/%REGISTRY%/'"$REGISTRY"'/g;s/%CTNAME%/'"$CTNAME"'/g' > docker-deploy.yml
echo "$NETWORKS" | sed '/^$/d;s/^[ \t]*/      - /' >> docker-deploy.yml
echo >> docker-deploy.yml
echo 'networks:' >> docker-deploy.yml

for network in $NETWORKS; do
    if [ -z "$(echo "$OVERLAYED" | grep '^'"$network"'$')" ]; then
        echo "Creating non existed network $network..."
        docker network create -d overlay $NETPARAMS "$network"
    fi
    echo "    $network:" >> docker-deploy.yml
    echo "        external: true" >> docker-deploy.yml
done

