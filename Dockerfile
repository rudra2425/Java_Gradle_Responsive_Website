# Use the official OpenJDK 11 base image
FROM openjdk:11 as base

# Set the working directory inside the container
WORKDIR /app

# Copy all files from the current directory into the container
COPY . .

# Make the Gradle wrapper script executable
RUN chmod +x gradlew

# Build the Java application using Gradle
RUN ./gradlew build

# Use the official Tomcat 9 base image
FROM tomcat:9

# Set the working directory inside the Tomcat container (webapps directory)
WORKDIR /usr/local/tomcat/webapps

# Copy the built WAR file from the previous stage into the Tomcat container
COPY --from=base /app/build/libs/Responsive_website-0.0.1-SNAPSHOT.war ROOT.war

# Remove the default ROOT application and expose port 8080
RUN rm -rf ROOT && mv ROOT.war /usr/local/tomcat/webapps/

# Expose port 8080 for Tomcat
EXPOSE 8080

# Start Tomcat when the container is run
CMD ["catalina.sh", "run"]
