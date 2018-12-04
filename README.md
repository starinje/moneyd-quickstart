# Background
Interledger is an open source protocol used to send payments across disparate ledgers. The Interledger Protocol (ILP) facilitates the transfer of value between money systems by routing packets of money through a network of connectors that act as intermediate exchange platforms. 

Moneyd is a dameon process that runs locally and is the quickest way to connect to the ILP network.  Moneyd is currently available as an NPM package that is installed and executed using the command line instructions below.

```
npm install -g moneyd moneyd-uplink-xrp
moneyd xrp:configure --testnet
moneyd xrp:start --testnet
```

# The Problem
While not a terribly complicated procedure, a few prerequisites must be met in order to ensure a successful installation and operation:

- Install Node.js (version 8.9.4 or higher)

- Set up node to install modules globally​

- If you already have Moneyd installed, make sure to upgrade to the latest version. Moneyd version 4 or higher is required.

Simple enough, however, installing npm packages globally can often cause permission headaches that require a series of steps to remedy. This added complexity is frustrating and can act as a barrier of entry for potential developer integrations with ILP. Additionally, future version releases of Moneyd must be tracked in order to maintain compatibility with the ILP network.

# Solution
​Moneyd is a local dameon process that runs locally and is the quickest way to connect to the ILP network.

In this proposed solution, Docker is used to containerize the Moneyd daemon, reducing overall installation and deployment procedure. Configuration and launching of the application are achieved via a single command for testnet and livenet environments for both eth and xrp plugins.

Releases of the Moneyd Docker image are pushed to Docker Hub: https://hub.docker.com/r/starinje/moneyd-quickstart/​

To install and run Moneyd command line below is executed:
```
docker run -d -p 7768:7768 -e LEDGER_SECRET='****************' -e LEDGER_TYPE=xrp -e NETWORK_TYPE=live starinje/moneyd-quickstart:0.0.1
```

The application supports the following input arguments provided as environment variables:

- LEDGER_TYPE - supported values: 'xrp', 'eth'

- NETWORK_TYPE - supported values: 'local', 'test', 'live'

- LEDGER_SECRET - required only for livenet operation

The Moneyd instance is now accessible at localhost:7768

# Next Steps
Supporting NPM packages in the Interledger.js ecosystem currently function with the assumption that an instance of MoneyD is running locally. For example the  [ilp-plugin](https://github.com/interledgerjs/ilp-plugin) package creates a plugin connection to the Moneyd instance by referencing the shared ILP_CREDENTIALS environment variable. Because the dockerized application does not share the environment variables of the host machine, this is problematic. Future development to make this work would be an update to the Moneyd codebase to include a method to query for the ILP_CREDENTIALS given the IP address and port of the Moneyd instance. 