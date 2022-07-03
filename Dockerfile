FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY ./target/maven-project-1.0-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app
ENTRYPOINT ["java", "-jar", "maven-project-1.0-SNAPSHOT.jar"]
