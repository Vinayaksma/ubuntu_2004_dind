FROM ubuntu:20.04

# MAINTAINER  Vinayak Malage <vinay1486@live.com>

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh

# Install the magic wrapper.
# ADD ./wrapdocker /usr/local/bin/wrapdocker
# RUN chmod +x /usr/local/bin/wrapdocker
RUN apt-get install -y tar cmake make git ssh wget openssh-server curl sudo gnupg
RUN apt-get install -y --no-install-recommends git-core ca-certificates
# #WORKDIR /home
 RUN mkdir /root/.ssh
 RUN ssh-keyscan -t rsa gitlab.com >> /root/.ssh/known_hosts
 RUN ssh-keyscan -t rsa github.com >> /root/.ssh/known_hosts
 RUN curl -L "https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


# RUN chmod +x /usr/local/bin/docker-compose
 RUN apt-get install -y apt-transport-https ca-certificates software-properties-common
 RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
 RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
 RUN mkdir -p /etc/apt/keyrings
 RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
 RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

 RUN apt-get update
 RUN apt-get install nodejs -y mocha chai
 RUN npm install -g semantic-release @semantic-release/gitlab
#RUN sudo wrapdocker
# CMD ["/bin/bash","wrapdocker"]
# CMD ["/bin/bash", "-c", "while true; do sleep 30; done;"]