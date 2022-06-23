# moonbeam-docker

Replace the text file in the build folder with the moonbeam binary version of your choice, then you can build the image.

Replace the version below with the one you need.

```
VERSION=0.24.0
```

```
docker build -t moonbeam:$VERSION .
```

Then you can run the image and mount the folders and modify the flags to your liking, and selecting one of the chains:

```
docker run --name moonbeam -p 30333:30333 -p 9933:9933 -p 9944:9944 -v /home/dev/moonbeam/keystore:/moonbeam/keystore -v /home/dev/moonbeam/data:/moonbeam/data moonbeam:$VERSION --port 30333 \
              --rpc-port 9933 \
              --unsafe-rpc-external \
              --ws-port 9944 \
              --execution wasm \
              --wasm-execution compiled \
              --pruning=archive \
              --state-cache-size 0 \
              --db-cache 8192 \
              --base-path /moonbeam/data \
              --keystore-path /moonbeam/keystore \
              --chain moonbeam | alphanet | moonriver ` \
              --sync full \
              --name Moonbeam \
```
