# Background
Interledger is an open source protocol used to send payments across disparate ledgers. The Interledger Protocol (ILP) facilitates the transfer of value between money systems by routing packets of money through a network of connectors that act as intermediate exchange platforms. 

# Solution
​Moneyd is a local dameon process that runs locally and is the quickest way to connect to the ILP network.

In this proposed solution, Docker is used to containerize the Moneyd daemon, reducing overall installation and deployment procedure. Configuration and launching of the application are achieved via a single command for testnet and livenet environments for both eth and xrp plugins.

Releases of the Moneyd Docker image are pushed to Docker Hub: https://hub.docker.com/r/starinje/moneyd-quickstart/​

To install and run Moneyd command line below is executed:
```
docker run -d -p 7768:7768 -e LEDGER_SECRET='****************' -e LEDGER_TYPE=xrp -e NETWORK_TYPE=live starinje/moneyd-quickstart:0.0.1
```

The application supports the following input arguments provided as environment variables:

-LEDGER_TYPE - supported values: 'xrp', 'eth'

-NETWORK_TYPE - supported values: 'local', 'test', 'live'

-LEDGER_SECRET - required only for livenet operation

The Moneyd instance is now accessible at port 7768




