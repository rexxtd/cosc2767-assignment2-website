yum install docker -y 
service docker start
cp ./cosc2767-assignment2-website/Dockerfile_jenkins Dockerfile
RUN cd /opt
RUN wget https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.tar.gz
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
RUN tar -xvzf apache-maven-3.8.6-bin.tar.gz
RUN mv apache-maven-3.8.6 maven
RUN tar -xvzf apache-tomcat-9.0.65.tar.gz
RUN mv apache-tomcat-9.0.65 tomcat

docker build -t my-jenkins-image .
docker run -d --name jenkins -p 8080:8080 my-jenkins-image
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
