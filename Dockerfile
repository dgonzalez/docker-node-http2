FROM debian:stretch


RUN apt-get update && apt-get install git build-essential python -y \
 && git clone https://github.com/jasnell/node /node/

WORKDIR /node/

RUN  git checkout initial-pr \
 && ./configure \
 && make -j8 \
 && ln -s /node/out/Release/node /usr/local/bin/node

CMD ["node"]
