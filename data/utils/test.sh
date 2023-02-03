#!/bin/bash
INDEX=1

# Hello I'm container 1 of 5 
echo "Hello I'm container $INDEX of $COUNT"

JSON_INDEX=$INDEX-1
ADDRESS=`cat ./configs/genesis.json | python3 -c "import sys, json; print(json.load(sys.stdin)['PillarConfig']['Pillars'][$JSON_INDEX]['BlockProducingAddress'])"`

echo "Address=$ADDRESS"
# index=$INDEX 

CONFIG=`INDEX=$INDEX ADDRESS=$ADDRESS envsubst < ./configs/config.template.json`
echo "$CONFIG"