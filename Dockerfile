FROM gradle:5.4.1-jdk8-alpine
ADD src src
ADD build.gradle .
ADD gradlew .
COPY gradle .
RUN gradle/gradlew build -x test

RUN sleep 10m

FROM openjdk:8-jdk-alpine
VOLUME /tmp
#COPY gradle/build/libs/spring-boot-minishift-0.0.1-SNAPSHOT.jar /usr/src/boot/
#WORKDIR /usr/src/boot/
EXPOSE 8000
#CMD ["java", "-jar", "spring-boot-minishift-0.0.1-SNAPSHOT.jar"]
CMD ["java","-cp","/tmp/build/inputs/bin/main/com/example/springbootminishift","SpringBootMinishiftApplication"]