FROM jenkinsci/jenkins:2.46.2

LABEL maintainer "funthomas424242@gmail.com"

RUN echo Angemeldet als:  `whoami`

WORKDIR /var/jenkins_home

ARG SCM_URL=https://github.com/FunThomas424242/jenkins-pipeline.docker.git
ENV SCM_URL_ENV=${SCM_URL}
ARG WAIT_FOR_SHUTDOWN=1m
ENV WAIT_FOR_SHUTDOWN_ENV=${WAIT_FOR_SHUTDOWN}
ARG SCM_BRANCH_PATTERN='*/master'
ENV SCM_BRANCH_PATTERN_ENV=${SCM_BRANCH_PATTERN}

# Plugins installieren
COPY plugins.txt /usr/share/jenkins/ref/
# when stable then: RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

# System configurieren (Maven M3)
COPY hudson.tasks.Maven.xml /usr/share/jenkins/ref/hudson.tasks.Maven.xml

# Pipeline Template speichern
RUN mkdir /usr/share/jenkins/ref/skripte/
COPY job-template.xml /usr/share/jenkins/ref/skripte/job-template.xml

# launcher and entrypoint festlegen
COPY launcher.sh /usr/local/bin/launcher.sh
COPY configureJobs.sh /usr/local/bin/configureJobs.sh

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/launcher.sh"]




