FROM redis:1.0
EXPOSE 8080
RUN for user in USER; do adduser $user;echo "PASS" | passwd $user --stdin; done
COPY . .
WORKDIR  . .
ENTRYPOINT ["java", "-jar", ". ."]
