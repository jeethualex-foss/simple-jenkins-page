FROM redhat/ubi10

USER root

# Install the application dependencies
RUN yum install java-21-openjdk-devel git wget unzip -y

# Install jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
RUN yum repolist
RUN yum install jenkins -y

RUN mkdir /deployments
RUN chmod 777 -Rf /deployments
COPY bakup-jenkins.zip /deployments
RUN unzip /deployments/bakup-jenkins.zip
RUN mv bakup-jenkins /root/.jenkins
RUN rm /deployments/bakup-jenkins.zip

ENV GIT_HOME=/usr/bin/git
ENV JAVA_HOME=/etc/alternatives/java_sdk_openjdk
RUN mkdir /root/.ssh
RUN ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts

WORKDIR /deployments

EXPOSE 8080

CMD ["jenkins","start"]