# moneyd-quickstart

complete instructions on how to get an instance of moneyd running locally...

Problem:
Connecting to Interleder is a bit confusing and multi-step currently. Assumes developer environment. 
For example when trying to install moneyd globally kept getting permissions errors. Needed to make sure node version was correct, etc...

Proposal:
Dockerize moneyD so it can be deployed locally with a simple 'docker run' command

forked https://github.com/interledgerjs/moneyd
added dockerFile to automate build.
tied into TravisCI build that builds docker image and pushes to Docker Container Registry 

User can now run moneyD with the following steps

Make sure docker is installed:

install docker instructions

docker run "************************"

Pull Docker Image:

docker pull from docker hub...

docker run -d -p 7768:7768 -e LEDGER_SECRET=snLFVV4DZ4kpnE2jj957iHueEHGJb -e LEDGER_TYPE=xrp -e NETWORK_TYPE=test moneyd-quickstart 

TODO:

Need to add travisCI file to build new docker image and push to container registry on git commit

