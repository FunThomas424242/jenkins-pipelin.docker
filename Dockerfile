FROM jenkins:2.46.2

LABEL maintainer "funthomas424242@gmail.com"

ARG user=jenkins
RUN echo Jenkins user is:  ${user}

WORKDIR /var/jenkins_home

COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

#USER root
#COPY jenkins.config.sh /usr/local/bin/jenkins.config.sh
#ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.config.sh"]

USER ${user}
RUN mkdir skripte
COPY jenkins.config.sh skripte/jenkins.config.sh
RUN skripte/jenkins.config.sh


# RUN cp /var/jenkins_home/war/WEB-INF/jenkins-cli.jar /var/jenkins_home/skripte/jenkins-cli.jar

# RUN java -jar skripte/jenkins-cli.jar -s http://localhost:8080/ help --username admin --password geheim_aus_datei



