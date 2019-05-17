FROM openjdk:8 AS build
ENV APP_HOME=/usr/src
COPY src $APP_HOME
COPY build.gradle settings.gradle gradlew Dockerfile $APP_HOME
COPY gradle $APP_HOME/gradle
RUN gradle build -x test

RUN sleep 10m

FROM openjdk:8-jdk-alpine
VOLUME /tmp
#COPY gradle/build/libs/spring-boot-minishift-0.0.1-SNAPSHOT.jar /usr/src/boot/
#WORKDIR /usr/src/boot/
EXPOSE 8000
#CMD ["java", "-jar", "spring-boot-minishift-0.0.1-SNAPSHOT.jar"]
CMD ["java","-cp","/tmp/build/inputs/bin/main/com/example/springbootminishift","SpringBootMinishiftApplication"]