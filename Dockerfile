FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY ./target/ValaxyTech/hello-world-1.0-SNAPSHOT.jar /usr/app
WORKDIR /usr/app
ENTRYPOINT ["java", "-jar", "ValaxyTech/hello-world-1.0-SNAPSHOT.jar"]
