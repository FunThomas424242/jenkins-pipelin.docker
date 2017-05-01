#! /bin/bash -e

echo DIR:  `pwd`

/bin/tini -- /usr/local/bin/jenkins.sh &

sleep 3m

mkdir /var/jenkins_home/cskripte/
cp /var/jenkins_home/war/WEB-INF/jenkins-cli.jar /var/jenkins_home/cskripte/jenkins-cli.jar


pass=`cat /var/jenkins_home/secrets/initialAdminPassword`

echo "INFO: CREATE PIPLINE JOB - BEGIN"

java -jar cskripte/jenkins-cli.jar -s http://localhost:8080/ create-job jobName < skripte/job.xml --username admin --password ${pass}

echo "INFO: CREATE PIPLINE JOB - END"

sleep 3m

java -jar cskripte/jenkins-cli.jar -s http://localhost:8080/ safe-restart --username admin --password ${pass}

sleep 3m

java -jar cskripte/jenkins-cli.jar -s http://localhost:8080/ safe-shutdown --username admin --password ${pass}

sleep 1m

kill %1
