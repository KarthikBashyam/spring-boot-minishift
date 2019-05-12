FROM gradle:5.4.1-jdk8-alpine
ADD src src
ADD build.gradle .
RUN gradle build -x test

FROM openjdk:8-jdk-alpine
COPY /home/gradle/build/libs/spring-boot-minishift-0.0.1-SNAPSHOT.jar /usr/src/boot/
WORKDIR /usr/src/boot/
EXPOSE 8000
CMD ["java", "-jar", "spring-boot-minishift-0.0.1-SNAPSHOT.jar"]