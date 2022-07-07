FROM openjdk:8-jre-alpine
EXPOSE 8080
RUN for user in ec2-user;do useradd $user echo "subbu@123" | passwd $user --stdin; done
COPY . .
WORKDIR  . .
ENTRYPOINT ["java", "-jar", ". ."]
