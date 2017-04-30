FROM jenkins:2.46.2

LABEL maintainer "funthomas424242@gmail.com"

ARG user=jenkins
RUN echo Jenkins user is:  ${user}

WORKDIR /var/jenkins_home

COPY plugins.txt /usr/share/jenkins/ref/
# when stable then: RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
COPY hudson.tasks.Maven.xml hudson.tasks.Maven.xml

USER ${user}
RUN mkdir skripte
COPY jenkins.config.sh skripte/jenkins.config.sh
COPY job.xml skripte/job.xml
RUN skripte/jenkins.config.sh



