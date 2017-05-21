[![Build Status](https://travis-ci.org/FunThomas424242/jenkins-pipeline.docker.svg?branch=master)](https://travis-ci.org/FunThomas424242/jenkins-pipeline.docker)

# jenkins-pipeline.docker
Docker Container zum Start einer generischen Build Pipeline


# Container erstellen
```
docker pull funthomas424242-docker-funthomas424242-container.bintray.io/funthomas424242/jenkins-pipeline
```

Start ohne Persistenz
```
docker run -p 8080:8080 -p 50000:50000 funthomas424242-docker-funthomas424242-container.bintray.io/funthomas424242/jenkins-pipeline
```
Start mit Datenablage unter /your/home
```
docker run -p 8080:8080 -p 50000:50000 -v /your/home:/var/jenkins_home funthomas424242-docker-funthomas424242-container.bintray.io/funthomas424242/jenkins-pipeline
```

Beispiel Start für ein spezielles Projekt mit festgelegtem Branch
```
>docker pull funthomas424242-docker-funthomas424242-container.bintray.io/funthomas424242/jenkins-pipeline
>docker run -e "JP_PROJECT_NAME=slidecast-angularjs.example" -e "JP_SCM_URL=https://github.com/FunThomas424242/slidecast-angularjs.example.git" -p 8080:8080 -p 50000:50000 funthomas424242-docker-funthomas424242-container.bintray.io/funthomas424242/jenkins-pipeline
```
