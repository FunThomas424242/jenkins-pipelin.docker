#!/bin/bash -e

echo LAUNCH-DIR:  `pwd`

/usr/local/bin/configureJobs.sh &

echo "STARTE JENKINS"

/usr/local/bin/jenkins.sh

kill %1
# fg 1
