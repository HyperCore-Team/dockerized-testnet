#!/usr/bin/env bash
# get the container IP
IP=`ifconfig eth0 | grep 'inet ' | awk '{print $2}'`

# get the service name you specified in the docker-compose.yml 
# by a reverse DNS lookup on the IP
SERVICE=`dig -x $IP +short | cut -d'_' -f2`

# extract the replica number from the same PTR entry
export INDEX=`dig -x $IP +short | sed 's/.*_\([0-9]*\)\..*/\1/'`
JSON_INDEX=$((INDEX-1))
export ADDRESS=`cat /app/configs/genesis.json | python3 -c "import sys, json; print(json.load(sys.stdin)['PillarConfig']['Pillars'][$JSON_INDEX]['BlockProducingAddress'])"`
export MIN_PEERS=$((PILLARS_REPLICAS+0))
export LOCAL_PUBKEYS=`cat /app/configs/orchestrator.TssConfig.LocalPubKeys.json`
export PUBKEY_WHITELIST=`cat /app/configs/orchestrator.TssConfig.PubKeyWhitelist.json`

envsubst < /app/configs/config.template.json > /root/.znn/config.json
envsubst < /app/configs/orchestrator.template.json > /root/.node/config.json

if [ -d "/app/bootstraps/${PILLARS_REPLICAS}-pillars" ];
then
    cp -avr /app/bootstraps/$PILLARS_REPLICAS-pillars/* /root/.znn/
fi

(if (($INDEX==1))
then 
    echo "PILLAR #$INDEX Initialising bridge in 60 seconds"
    sleep 60
    init_bridge $PILLARS_REPLICAS
fi) &