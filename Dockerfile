ARG JENKINS_VERSION=lts-jdk17

FROM jenkins/jenkins:${JENKINS_VERSION}

LABEL maintainer="StevenLei <shanestevenlei@gmail.com>"

USER root

RUN apt-get update && apt-get install -y lsb-release \
  && curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc https://download.docker.com/linux/debian/gpg \
  && echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends docker-ce-cli \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

USER jenkins

RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
