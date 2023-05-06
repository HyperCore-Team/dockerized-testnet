FROM golang:latest AS pillars

WORKDIR /app

COPY ./data .

RUN \
  cd /app/repos/go-zenon/ \
  && go mod tidy \
  && make znnd \
  && cp ./build/znnd /usr/local/bin/

RUN \
  cd /app/repos/orchestrator/ \
  && go mod tidy \
  && make \
  && cp ./build/orchestrator /usr/local/bin/

RUN \
  cd /app/repos/scripts \
  && go mod tidy \
  && go build --ldflags '-extldflags "-Wl,--allow-multiple-definition"' -o /usr/local/bin/init_bridge ./tss/main.go;

RUN mkdir -p /root/.znn/wallet /root/.orchestrator

RUN apt update && apt install -y net-tools dnsutils gettext-base

CMD bash -c "(while true; do echo 300; sleep 10; done)&; znnd"

