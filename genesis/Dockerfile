FROM golang:latest

WORKDIR /app

COPY ./data .

RUN \
  cd /app/repos/znn-sdk-go/examples/scripts \
  && go build --ldflags '-extldflags "-Wl,--allow-multiple-definition"' -o generate_genesis generate_genesis.go \
  && cp /app/repos/znn-sdk-go/examples/scripts/generate_genesis /usr/local/bin/generate_genesis;

RUN \
  cd /app/repos/orchestrator/examples/peers \
  && go build --ldflags '-extldflags "-Wl,--allow-multiple-definition"' -o generate_tss_peers main.go \
  && cp /app/repos/orchestrator/examples/peers/generate_tss_peers /usr/local/bin/generate_tss_peers;