FROM gradle:jdk8-alpine as builder
COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build

RUN sleep 10m

FROM openjdk:8-jdk-alpine
VOLUME /tmp
#COPY gradle/build/libs/spring-boot-minishift-0.0.1-SNAPSHOT.jar /usr/src/boot/
#WORKDIR /usr/src/boot/
EXPOSE 8000
#CMD ["java", "-jar", "spring-boot-minishift-0.0.1-SNAPSHOT.jar"]
CMD ["java","-cp","/tmp/build/inputs/bin/main/com/example/springbootminishift","SpringBootMinishiftApplication"]