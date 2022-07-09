FROM redis:1.0
EXPOSE 8080
RUN for user in subbu; do useradd $user; echo "1234" | passwd $user --stdin; done
COPY . .
WORKDIR  . .
ENTRYPOINT ["java", "-jar", ". ."]
