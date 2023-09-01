# Use an official Apache Tomcat image as a base
FROM tomcat:9.0

# Copy the packaged WAR file into the webapps directory of Tomcat
COPY build/libs/myapp.war /usr/local/tomcat/webapps/myapp.war

# Expose port 8080 (Tomcat's default port)
EXPOSE 8080

# Start Tomcat when the container is run
CMD ["catalina.sh", "run"]
