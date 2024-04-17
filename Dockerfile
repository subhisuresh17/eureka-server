# Use a base image with Java 17 installed
FROM adoptopenjdk/openjdk17:alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project object model (POM) file
COPY pom.xml .

# Copy the entire source code
COPY src ./src

# Build the application using Maven
RUN ./mvnw package -DskipTests

# Expose port 8761
EXPOSE 8761

# Set the startup command for the container
CMD ["java", "-jar", "target/eureka-server.jar"]
