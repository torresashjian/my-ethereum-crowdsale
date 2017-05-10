FROM ubuntu:14.04
MAINTAINER Miguel Torres <migueltorreslopez@gmail.com>

# Utility packages=================================
RUN \
    apt-get update && apt-get upgrade -q -y --no-install-recommends && \
    apt-get install sudo && \
  	sudo apt-get install curl -y && \
	sudo apt-get install xz-utils 
# Utility packages=================================


# Setup Environment================================
RUN \
	mkdir /node

COPY ./scripts /node
# Setup Environment================================

# NodeJs ==========================================
# gpg keys listed at https://github.com/nodejs/node
RUN \
	curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash - && \
	sudo apt-get install -y nodejs && \
	sudo npm install --unsafe-perm -g express && \
	sudo npm install -g express-fileupload
# NodeJs ==========================================

# IPFS ============================================
ENV IPFS_VERSION 0.4.9-rc1
ENV IPFS_DOWNLOAD_URL https://ipfs.io/ipns/dist.ipfs.io/go-ipfs/v0.4.8/go-ipfs_v0.4.8_linux-amd64.tar.gz
RUN curl -fsSL "$IPFS_DOWNLOAD_URL" -o go-ipfs.tar.gz \
	&& tar xvfz go-ipfs.tar.gz \
	&& mv go-ipfs/ipfs /usr/local/bin/ipfs \
	&& rm go-ipfs.tar.gz
# IPFS ============================================


# Crowdsale-app ===================================
COPY ./crowdsale-app /node/crowdsale-app
RUN cd /node/crowdsale-app && \
	sudo npm install --save
# Crowdsale-app ===================================

# Cleanup =========================================
#RUN \
#  rm -rf /var/lib/apt/lists/*
# Cleanup =========================================


#React
EXPOSE 3000
#IPFS API
EXPOSE 5001
#IPFS Gateway
EXPOSE 8080



ENTRYPOINT ["/node/start.sh"]