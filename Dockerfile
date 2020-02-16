#base image containing Java runtime
FROM openjdk:8-jdk-alpine

LABEL maintainer="mounamukhar@gmail.com"

# Volume pointing to /tmp to access data
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8888

# The application's jar file
ARG JAR_FILE=build/libs/serving-web-content-0.0.1.jar

# Add the application's jar to the container
ADD ${JAR_FILE} serving-web-content-0.0.1.jar

# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/serving-web-content-0.0.1.jar"]
