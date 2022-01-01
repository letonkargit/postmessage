FROM openjdk:8-jdk-alpine
COPY target/postmessage-*.war app.war
ENTRYPOINT ["java","-jar","/app.war"]