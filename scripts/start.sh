#!/bin/bash
(ipfs init &&
ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001 &&
ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8082 &&
ipfs daemon --unrestricted-api) &
(cd /node/crowdsale-app && npm start)