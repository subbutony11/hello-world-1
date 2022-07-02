FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY ./server.jar /var/jenkins_home/workspace/target/maven-app/server.jar
WORKDIR /var/jenkins_home/workspace/target/maven-app/server.jar
ENTRYPOINT ["java", "-jar", "server.jar"]
