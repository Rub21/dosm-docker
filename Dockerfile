FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y wget build-essential libz-dev zlib1g-dev git curl
# Install node for some images process dependencies
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o osmconvert
RUN cp osmconvert /usr/bin/osmconvert
RUN git clone https://github.com/Rub21/dosm.git && cd dosm && npm install && npm link
RUN mkdir -p app
WORKDIR app/