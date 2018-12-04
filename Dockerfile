FROM node:8

RUN mkdir ilp
WORKDIR /ilp
COPY run.sh /ilp/run.sh

RUN npm install -g moneyd moneyd-uplink-xrp moneyd-uplink-eth --unsafe-perm

EXPOSE 8080

RUN chmod +x run.sh 

CMD ["./run.sh"]


