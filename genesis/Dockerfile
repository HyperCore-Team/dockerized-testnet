FROM golang:latest

WORKDIR /app

COPY ./data .

RUN \
  cd /app/repos/scripts \
  && go mod tidy \
  && go build --ldflags '-extldflags "-Wl,--allow-multiple-definition"' -o /usr/local/bin/generate_genesis ./genesis/main.go;

RUN \
  cd /app/repos/scripts \
  && go mod tidy \
  && go build --ldflags '-extldflags "-Wl,--allow-multiple-definition"' -o /usr/local/bin/generate_tss_peers ./peers/main.go;