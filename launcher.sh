#!/bin/bash -e

echo jenkins launch directory:  `pwd`

echo jenkins hosted by docker container: `cat /proc/self/cgroup | grep -o  -e "docker-.*.scope" | head -n 1 | sed "s/docker-\(.*\).scope/\\1/"`


/usr/local/bin/configureJobs.sh &

echo "Starting jenkins"
/bin/sh -c /usr/local/bin/jenkins.sh


