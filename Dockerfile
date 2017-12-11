from ubuntu:latest
maintainer ehehdada, ltd. <ehehdadaltd@gmail.com>
run apt-get update 
run apt-get install -y \
	wget build-essential cmake \
	g++ libboost-all-dev 
run wget https://github.com/aeonix/aeon/archive/v0.9.14.0.tar.gz
run tar xvf v0.9.14.0.tar.gz
run cd aeon-0.9.14.0 && make 
run ln -s /aeon-0.9.14.0/build/release/src/aeond /aeond
run ln -s /aeon-0.9.14.0/build/release/src/simpleminer /simpleminer
run ln -s /aeon-0.9.14.0/build/release/src/simplewallet /simplewallet
expose 11180 11181
cmd ["/aeond"]
