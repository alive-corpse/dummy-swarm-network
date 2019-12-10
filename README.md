# Dummy container for deploying overlayed networks

For creating overlayed distributed network through amout of docker swarm nodes, you should deploy some containers, that connected to this networks for all the hosts. So, this simple dummy container is intended for creating global networks.

## Example of usage:

1. Copy .env_example file to .env
2. Edit it for your purposes
3. Run ./renew-networks.sh to generate new docker-deploy.yml file
4. Deploy it with ./deploy.sh

## Scripts

* renew-networks.sh - generate docker-deploy.yml file from template and .env content
* deploy.sh - deploying dummy container to the all docker swarm nodes
* status.sh - status of containers
* rm.sh - removing all the dummy containers from swarm nodes 

