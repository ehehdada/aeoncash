from ubuntu:disco
maintainer ehehdada, ltd. <ehehdadaltd@gmail.com>
run apt-get update 
run apt-get install -y \
	wget build-essential cmake \
	g++ libboost-all-dev 
run wget https://github.com/aeonix/aeon/releases/download/v0.12.9.0-aeon/aeon-linux-x64-v0.12.9.0.tar.bz2 ; \
	tar xvf aeon-linux-x64-v0.12.9.0.tar.bz2 ; \
	mv aeon-v0.12.9.0 aeon ; \
	cd aeon && make ; \
	ln -s /aeon/build/release/src/aeond /aeond ; \
	ln -s /aeon/build/release/src/simpleminer /simpleminer ; \
	ln -s /aeon/build/release/src/simplewallet /simplewallet
expose 11180 11181
cmd ["/aeond"]
