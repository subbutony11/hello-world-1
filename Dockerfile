FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY /var/jenkins_home/workspace/maven-app/server/target/server.jar
 /usr/app/
WORKDIR /usr/app
ENTRYPOINT ["java", "-jar", "/var/jenkins_home/workspace/maven-app/server/target/server.jar
"]
