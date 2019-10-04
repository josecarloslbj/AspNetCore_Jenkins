AspNetCore_Jenkins


http://www.macoratti.net/19/01/intro_docker7.htm

dotnet publish --configuration Release --output dist


Dessa forma já temos o arquivo Dockerfile criado para gerar a imagem. Para fazer isso usamos o comando  build e informamos o nome da imagem, a tag e um ponto(.). O comando fica assim:




/**************************************************/
Jenkins rodando no docker
/*************************************************/
Step-1: Build the docker image.
This Dockerfile will use a Jenkins container as a base image and then install the docker client , So that it can communicate with the docker daemon.
from jenkinsci/jenkins:lts
 
USER root
RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update  -qq \
    && apt-get install docker-ce=17.12.1~ce-0~debian -y
RUN usermod -aG docker jenkins
(you can clone the Dockerfile from this github repo)
Build the image with below command
$ docker image build -t jenkins-docker .
Note: Change the version of docker inside the Dockerfile based on your own requirements.
Step-2: Start the container with mounted docker daemon
After successfully building the container in step 1 we need to run the container with mounted docker daemon
$ docker container run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkins-docker
Note: The docker daemon running on host machine must be compatible with docker client running in Jenkins container. check the version of the host with docker --version and install the appropriate version of docker client inside the Jenkins container.
Conclusion:
Your Jenkins container now should have a functional docker installation. verify it by running
docker container ls
From inside the Jenkins container. The output should have same as running docker container ls from the docker host.

/**********************************************************************/


https://medium.com/@manav503/how-to-build-docker-images-inside-a-jenkins-container-d59944102f30

/*****************/
docker build -t aspnetcoremvc/app1:1.0 .
/****************/
docker rm -f dotnet
/****************/
docker run -p 5000:80 -d --name dotnet aspnetcoremvc/app1:1.0
/***************/
