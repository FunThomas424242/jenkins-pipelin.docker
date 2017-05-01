FROM jenkinsci/jenkins:2.46.2

LABEL maintainer "funthomas424242@gmail.com"

# ARG user=jenkins
# RUN echo Jenkins user is:  ${user}
RUN echo Angemeldet als:  `whoami`

WORKDIR /var/jenkins_home

COPY plugins.txt /usr/share/jenkins/ref/
# when stable then: RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
COPY hudson.tasks.Maven.xml /usr/share/jenkins/ref/hudson.tasks.Maven.xml


RUN mkdir skripte
COPY job.xml /usr/share/jenkins/ref/skripte/job.xml

# launcher and entrypoint
COPY launcher.sh /usr/local/bin/launcher.sh
COPY configureJobs.sh /usr/local/bin/configureJobs.sh


ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/launcher.sh"]




