# Use the official Tomcat 9 base image
FROM tomcat:9

# Set the working directory inside the Tomcat container (webapps directory)
WORKDIR /usr/local/tomcat/webapps

# Copy the built WAR file and rename it to my-app.war
COPY ./build/libs/Responsive_website-0.0.1-SNAPSHOT.war my-app.war

# Expose port 8080 for Tomcat
EXPOSE 8080

# Start Tomcat when the container is run
CMD ["catalina.sh", "run"]
