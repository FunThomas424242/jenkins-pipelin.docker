FROM jenkinsci/jenkins:2.61

LABEL maintainer "funthomas424242@gmail.com"

RUN echo Angemeldet als:  `whoami`

WORKDIR /var/jenkins_home

ARG JP_SCM_URL_ARG=https://github.com/FunThomas424242/jenkins-pipeline.docker.git
ENV JP_SCM_URL=${JP_SCM_URL_ARG}
ARG JP_WAIT_FOR_SHUTDOWN_ARG=1m
ENV JP_WAIT_FOR_SHUTDOWN=${JP_WAIT_FOR_SHUTDOWN_ARG}
ARG JP_SCM_BRANCH_PATTERN_ARG='origin/master'
ENV JP_SCM_BRANCH_PATTERN=${JP_SCM_BRANCH_PATTERN_ARG}
ARG JP_PROJECT_NAME_ARG="jenkins-pipeline"
ENV JP_PROJECT_NAME=${JP_PROJECT_NAME_ARG}
ARG JP_WORKSPACE_PATH_ARG=/var/jenkins_home/mnt
ENV JP_WORKSPACE_PATH=${JP_WORKSPACE_PATH_ARG}

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

VOLUME ${JP_WORKSPACE_PATH}


