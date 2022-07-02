FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY ./target/maven-app-1.0-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app
ENTRYPOINT ["java", "-jar", "maven-app-1.0-SNAPSHOT.jar"]
