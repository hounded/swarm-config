## Hyperledger fabric on swarm

```bash 
./getup.sh
```
### how to create your resourses
```bash
cryptogen generate --config=./crypto-config.yaml
export FABRIC_CFG_PATH=$PWD
configtxgen -profile ComposerOrdererGenesis -outputBlock ./composer-genesis.block
configtxgen -profile ComposerChannel -outputCreateChannelTx ./composer-channel.tx -channelID composerchannel
```
