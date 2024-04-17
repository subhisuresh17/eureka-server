FROM ubuntu:20.04

# Install timezone data and set the timezone
RUN apt-get update && \
    apt-get install -y tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata

# Install Java, Git, Maven, and other dependencies
RUN apt-get install -y openjdk-17-jdk git maven

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven project object model (POM) file
COPY pom.xml .

# Copy the entire source code
COPY src ./src

# Build the application using Maven
RUN mvn -B -DskipTests clean package

# Expose port 8761
EXPOSE 8761

# Set the startup command for the container
CMD ["java", "-jar", "target/eureka-server.jar"]
