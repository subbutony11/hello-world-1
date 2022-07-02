FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY ./target/hello-world-1-1.0-server.jar ./
WORKDIR ./
ENTRYPOINT ["java", "-jar", "hello-world-1-1.0-server.jar"]
