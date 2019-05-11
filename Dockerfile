FROM openjdk:8-jdk-alpine
COPY ./build/libs/spring-app-0.0.1-SNAPSHOT.jar /usr/src/boot/
WORKDIR /usr/src/boot/
EXPOSE 8000
CMD ["java", "-jar", "spring-app-0.0.1-SNAPSHOT.jar"]