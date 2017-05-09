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

# IPFS ============================================
ENV IPFS_VERSION 0.4.9-rc1
ENV IPFS_DOWNLOAD_URL https://ipfs.io/ipns/dist.ipfs.io/go-ipfs/v0.4.8/go-ipfs_v0.4.8_linux-amd64.tar.gz
RUN curl -fsSL "$IPFS_DOWNLOAD_URL" -o go-ipfs.tar.gz \
	&& tar xvfz go-ipfs.tar.gz \
	&& mv go-ipfs/ipfs /usr/local/bin/ipfs \
	&& rm go-ipfs.tar.gz
# IPFS ============================================


# Cleanup =========================================
#RUN \
#  rm -rf /var/lib/apt/lists/*
# Cleanup =========================================


#IPFS API
EXPOSE 5001
#IPFS Gateway
EXPOSE 8080



ENTRYPOINT ["/node/start.sh"]