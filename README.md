# Akamai Bot

## Overview
Akamai Bot is a hubot based automation bot, and optionally it can be integrated into other platforms (e.g Slack). It allows users to perform some Akamai tasks simply by talking to the bot.

## Installation
- Setup the Akamai API credentials, one for DIAG (diagnostic tools) and one for CCU (content control utility).    
-  Setup Slack team and create a token for Hubot.  
-  Create a file and add the credentials that are created in above steps. In my example, it is named as akamai-bot-credentials. Note: please keep the single quote.   
```bash
HUBOT_SLACK_TOKEN=xoxb-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
AKAMAI_DIAG_CLIENT_TOKEN='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
AKAMAI_DIAG_CLIENT_SECRET='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
AKAMAI_DIAG_ACCESS_TOKEN='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
AKAMAI_DIAG_URL='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
AKAMAI_CCU_CLIENT_TOKEN='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
AKAMAI_CCU_CLIENT_SECRET='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
AKAMAI_CCU_ACCESS_TOKEN='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
AKAMAI_CCU_URL='xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
```
- You can either deploy the codes to your Hubot instance, or simply use docker image that I build.  
```bash
docker pull jc1518/akamai-bot
```
- Create your container. (Ctrl+C to stop)
```bash
docker run --env-file ./akamai-bot-credentials -v /etc/localtime:/etc/localtime:ro --name akamai-bot -it jc1518/akamai-bot
```
- You only need to create the container once. Use start or stop command in the future.
```bash
# start container
docker start akamai-bot

# stop container
docker stop akamai-bot

# track log
docker logs -f akamai-bot
```

## Usage

![help](screenshots/help.png)

## Examples

![ip](screenshots/ip.png)

![error](screenshots/error.png)

![purge](screenshots/purge.png)




