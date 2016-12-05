#TODO: remove existing repos
git clone https://github.com/Appdynamics/dropwizard-sample-app
git clone https://github.com/ChrisJTaylor/java-sandbox

/opt/maven/apache-maven-3.3.9/bin/mvn package -f ~/dropwizard-sample-app/

#docker build -f ./Dockerfile.ubuntu -t ubuntu/dropwizard-example .
#docker run -p 8082:8082 -p 8083:8083 -d ubuntu/dropwizard-example:latest

docker build -f ./Dockerfile.alpine -t alpine/dropwizard-example .
docker run -p 8082:8082 -p 8083:8083 -d alpine/dropwizard-example:latest
