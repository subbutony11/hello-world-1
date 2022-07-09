FROM redis:1.0
EXPOSE 8080
COPY . .
WORKDIR  . .
ENTRYPOINT ["java", "-jar", ". ."]
