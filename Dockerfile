FROM gradle:4.5-jdk-alpine as BUILD_IMAGE
RUN ls /home
RUN chown -R admin /usr
RUN mkdir -p /usr/app
COPY src build.gradle settings.gradle Dockerfile /usr/app
WORKDIR /usr/app
RUN gradle build -x test

RUN sleep 10m

FROM openjdk:8-jdk-alpine
VOLUME /tmp
#COPY gradle/build/libs/spring-boot-minishift-0.0.1-SNAPSHOT.jar /usr/src/boot/
#WORKDIR /usr/src/boot/
EXPOSE 8000
#CMD ["java", "-jar", "spring-boot-minishift-0.0.1-SNAPSHOT.jar"]
CMD ["java","-cp","/tmp/build/inputs/bin/main/com/example/springbootminishift","SpringBootMinishiftApplication"]