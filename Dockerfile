FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y wget build-essential libz-dev zlib1g-dev git curl python-pip software-properties-common python-software-properties python-lxml
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o osmconvert
RUN cp osmconvert /usr/bin/osmconvert
RUN wget -O - http://m.m.i24.cc/osmfilter.c |cc -x c - -O3 -o osmfilter
RUN cp osmfilter /usr/bin/osmfilter
RUN git clone https://github.com/Rub21/dosm.git && cd dosm && npm i && npm link
RUN mkdir -p app
WORKDIR app/
ADD osm2new.py osm2new.py