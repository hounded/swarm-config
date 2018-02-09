docker network create -d overlay --attachable net
docker stack deploy -c docker-compose.couch.yml couch 
sleep 5
docker stack deploy -c docker-compose.otx.yml otx
sleep 5
docker stack deploy -c docker-compose.peers.yml peer
docker stack deploy -c docker-compose.deploy.yml deploy
docker exec -ti peer_peer0.1.$(docker service ps -f 'name=peer_peer0.1' peer_peer0 -q) peer channel create -o orderer:7050 -c composerchannel -f /etc/hyperledger/configtx/composer-channel.tx
docker exec -ti peer_peer0.1.$(docker service ps -f 'name=peer_peer0.1' peer_peer0 -q) peer channel join -b composerchannel.block
docker exec -ti peer_peer1.1.$(docker service ps -f 'name=peer_peer1.1' peer_peer1 -q) peer channel join -b composerchannel.block
