FROM docker.io/library/ubuntu:20.04 AS builder

RUN apt-get update && apt-get install -y ca-certificates && update-ca-certificates

FROM debian:buster-slim

RUN mkdir -p /moonbeam/data && mkdir /moonbeam/config && mkdir /moonbeam/keystore

COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

COPY build/* /moonbeam
RUN chmod uog+x /moonbeam/moonbeam*

# 30333 for parachain p2p
# 30334 for relaychain p2p
# 9933 for RPC call
# 9944 for Websocket
# 9615 for Prometheus (metrics)
EXPOSE 30333 30334 9933 9944 9615

ENTRYPOINT ["/moonbeam/moonbeam"]
