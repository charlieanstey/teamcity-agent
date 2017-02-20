FROM jetbrains/teamcity-agent:latest

MAINTAINER Charlie Anstey <chaz.anstey@gmail.com>

LABEL dockerImage.teamcity.version="latest" \
      dockerImage.teamcity.buildNumber="latest"

# Taken from http://askubuntu.com/questions/594656/how-to-install-the-latest-versions-of-nodejs-and-npm-for-ubuntu-14-04-lts
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs

RUN npm install -g node-gyp bower cordova grunt-cli gulp-cli karma-cli code-push-cli

RUN code-push login --accessKey `cat /data/teamcity_agent/conf/code-push.accesskey`