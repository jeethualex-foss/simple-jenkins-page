FROM redhat/ubi10

USER root

# Install the application dependencies
RUN yum install java-21-openjdk wget -y

# Install jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
RUN rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
RUN yum repolist
RUN yum install jenkins -y

WORKDIR /deployments

EXPOSE 8080

CMD ["jenkins","start"]