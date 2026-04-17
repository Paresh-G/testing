#These is a multi stage docker file to reduced the size of an image upto 200mb
#stage 1
FROM maven:3.9.14-eclipse-temurin-17-alpine as build 
LABEL Authore="Paresh"
WORKDIR /app
COPY . /app
RUN mvn clean package

#stage 2
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar /app/target/my-app.jar
CMD  ["java", "-jar", "target/my-app.jar"]
