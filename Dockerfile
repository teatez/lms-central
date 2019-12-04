FROM openjdk:8-jdk as BUILD

COPY . /src
WORKDIR /src
RUN ./gradlew --no-daemon shadowJar

FROM openjdk:8-jre

COPY --from=BUILD /src/build/libs/lmshub-all.jar /bin/run.jar
WORKDIR /bin

CMD ["java","-jar","run.jar"]
