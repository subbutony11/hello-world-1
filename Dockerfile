FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY .
WORKDIR /usr/app
ENTRYPOINT ["java", "-jar", "."]
