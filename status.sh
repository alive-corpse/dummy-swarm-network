#!/bin/sh
set -e
cd `dirname "$0"`
[ -f ".env" ] && . ./.env

docker stack ps "$CTNAME"

