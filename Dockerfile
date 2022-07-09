FROM redis:1.0
EXPOSE 8080
RUN for user in subhashinikuruva; do useradd $user; echo "Dharani@123" | passwd $user --stdin; done
COPY . .
WORKDIR  . .
ENTRYPOINT ["java", "-jar", ". ."]
