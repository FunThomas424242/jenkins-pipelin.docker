# jenkins-pipeline.docker
Docker Container zum Start einer generischen Build Pipeline


# Container erstellen
docker pull funthomas424242/jenkins-pipeline

Start ohne Persistenz
```
docker run -p 8080:8080 -p 50000:50000 funthomas424242/jenkins-pipeline
```
Start mit Datenablage unter /your/home
```
docker run -p 8080:8080 -p 50000:50000 -v /your/home:/var/jenkins_home funthomas424242/jenkins-pipeline
```
