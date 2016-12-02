FROM ubuntu

RUN apt-get update
RUN apt-get -y install expect redis-server nodejs npm sudo curl
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g coffee-script
RUN npm install -g yo generator-hubot

RUN	useradd -d /akamai-bot -m -s /bin/bash -U akamai-bot
USER	akamai-bot
WORKDIR /akamai-bot
RUN yo hubot --owner="My Boss" --name="Akamai-Bot" --description="Akamai Bot" --defaults 
ADD akamaiApi.js /akamai-bot/scripts/
ADD akamai.js /akamai-bot/scripts/
RUN npm install --save edgegrid
RUN npm install --save hubot-slack

CMD bin/hubot -a slack