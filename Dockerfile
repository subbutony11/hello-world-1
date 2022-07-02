FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY ./target/hello-world-1-1.1-SNAPSHOT.jar /usr/app/
WORKDIR /usr/app
ENTRYPOINT ["java", "-jar", "hello-world-1-1.0-SNAPSHOT.jar"]
