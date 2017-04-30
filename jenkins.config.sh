#! /bin/bash -e

echo DIR:  `pwd`

/bin/tini -- /usr/local/bin/jenkins.sh &

sleep 1m

mkdir /var/jenkins_home/cskripte/
cp /var/jenkins_home/war/WEB-INF/jenkins-cli.jar /var/jenkins_home/cskripte/jenkins-cli.jar


pass=`cat /var/jenkins_home/secrets/initialAdminPassword`


java -jar cskripte/jenkins-cli.jar -s http://localhost:8080/ help --username admin --password ${pass}

sleep 1m

kill %1
