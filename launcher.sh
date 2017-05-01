#!/bin/bash -e

echo LAUNCH-DIR:  `pwd`

/usr/local/bin/configureJobs.sh &

echo "STARTE JENKINS"

/bin/sh -c /usr/local/bin/jenkins.sh


