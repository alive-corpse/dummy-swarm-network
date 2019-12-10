version: "3.6"

services:
  dummy: 
    image: 'alpine:latest'
    restart: always
    hostname: %CTNAME%
    deploy:
      mode: global
    entrypoint:
      - "tail"
      - "-f"
      - "/dev/null"
    networks:
