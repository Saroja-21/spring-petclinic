FROM scratch AS artifact

WORKDIR /artifact

COPY target/*.jar app.jar

FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=artifact /artifact/app.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","app.jar"]
