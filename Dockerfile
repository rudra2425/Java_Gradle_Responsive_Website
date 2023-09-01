FROM openjdk:11 as base
WORKDIR /app
COPY . .
RUN chmod +x gradlew
RUN ./gradlew build

FROM tomcat:9
WORKDIR /usr/local/tomcat/webapps
COPY --from=base /app/build/libs/Responsive_website-0.0.1-SNAPSHOT.war my-app.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
