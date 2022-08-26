yum install docker -y 
service docker start
cp ./cosc2767-assignment2-website/Dockerfile_jenkins Dockerfile
docker build -t my-jenkins-image .
docker run -d --name jenkins -p 8080:8080 my-jenkins-image
docker exec jenkins cat /var/jenkins_home/secrets/initialAdminPassword
