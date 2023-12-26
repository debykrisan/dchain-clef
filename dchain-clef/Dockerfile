FROM ubuntu

# copy the required files
COPY start.sh /tmp/
COPY clef /root/.clef

# update and install tools
RUN apt-get update && apt-get -y install expect software-properties-common

# install geth and clef
RUN add-apt-repository -y ppa:ethereum/ethereum && apt-get update && apt-get -y install ethereum

# running script to start clef
CMD bash /tmp/start.sh