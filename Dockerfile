# Use an official Apache Tomcat image as a base
FROM tomcat:9.0

# Copy the packaged WAR file into the webapps directory of Tomcat
COPY build/libs/Responsive_website-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/my-app.war

# Expose port 8080 (Tomcat's default port)
EXPOSE 8080

# Start Tomcat when the container is run
CMD ["catalina.sh", "run"]
