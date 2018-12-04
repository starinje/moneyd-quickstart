FROM node:8

RUN npm -g config set user root
RUN npm -g install nodegit

RUN mkdir ilp
WORKDIR /ilp
COPY run.sh /ilp/run.sh

RUN npm install -g moneyd moneyd-uplink-xrp moneyd-uplink-eth 

EXPOSE 8080
EXPOSE 7768

RUN chmod +x run.sh 

CMD ["./run.sh"]


