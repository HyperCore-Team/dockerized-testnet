FROM golang:latest AS pillars

WORKDIR /app

COPY ./data .

RUN \
  cd /app/repos/go-zenon/ \
  && make znnd \
  && cp ./build/znnd /usr/local/bin/

RUN \
  cd /app/repos/orchestrator/ \
  && make \
  && cp ./orchestrator /usr/local/bin/

RUN \
  cd /app/repos/orchestrator/examples/tss \
  && go build --ldflags '-extldflags "-Wl,--allow-multiple-definition"' -o init_bridge main.go \
  && cp ./init_bridge /usr/local/bin/

RUN mkdir -p /root/.znn/wallet /root/.node

RUN apt update && apt install -y net-tools dnsutils gettext-base

CMD bash -c "(while true; do echo 300; sleep 10; done)&; znnd"

