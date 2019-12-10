#!/bin/sh
set -e
cd `dirname "$0"`
[ -f ".env" ] && . ./.env

docker stack deploy "$CTNAME" -c docker-deploy.yml --with-registry-auth

