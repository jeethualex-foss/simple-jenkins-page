FROM redhat/ubi10

USER root

# Install the application dependencies
RUN yum install java-21-openjdk-devel git wget maven unzip -y

# Install jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
RUN yum repolist
RUN yum install jenkins -y

RUN mkdir /deployments
RUN chmod 777 -Rf /deployments
RUN git clone https://github.com/jeethualex-foss/simple-jenkins-files.git
RUN mv simple-jenkins-files/bakup-jenkins /root/.jenkins

RUN mkdir /root/.ssh
RUN ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts

WORKDIR /deployments

EXPOSE 8080

CMD ["jenkins","start"]