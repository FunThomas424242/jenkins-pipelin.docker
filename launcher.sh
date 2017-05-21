#!/bin/bash -e

echo jenkins launch directory:  `pwd`

echo jenkins hosted by docker container: ${HOSTNAME}


/usr/local/bin/configureJobs.sh &

echo "Starting jenkins"
/bin/sh -c /usr/local/bin/jenkins.sh


