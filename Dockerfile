FROM openjdk:8 as BUILD_IMAGE
#RUN mkdir -p /usr/app
ADD src build.gradle settings.gradle Dockerfile /usr/
WORKDIR /usr/
RUN gradle build -x test

RUN sleep 10m

FROM openjdk:8-jdk-alpine
VOLUME /tmp
#COPY gradle/build/libs/spring-boot-minishift-0.0.1-SNAPSHOT.jar /usr/src/boot/
#WORKDIR /usr/src/boot/
EXPOSE 8000
#CMD ["java", "-jar", "spring-boot-minishift-0.0.1-SNAPSHOT.jar"]
CMD ["java","-cp","/tmp/build/inputs/bin/main/com/example/springbootminishift","SpringBootMinishiftApplication"]