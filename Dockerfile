FROM eclipse-temurin:17-jdk-focal
ARG JAR_PATH=target/*.jar
COPY ${JAR_PATH} spring-petclinic.jar
ENTRYPOINT ["java", "-jar", "spring-petclinic.jar"]
