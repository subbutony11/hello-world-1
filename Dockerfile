FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY ./target/server.war /usr/app/
WORKDIR /usr/app
ENTRYPOINT ["java", "-war", "server.war"]
