# Use a lightweight JDK 17 image for runtime
FROM eclipse-temurin:17.0.15_6-jdk-jammy

# Accept build-time variables (from --build-arg)
ARG APP_NAME

# Convert ARG to ENV (so they're available at runtime)
ENV APP_NAME=$APP_NAME

# Set working directory
WORKDIR /opt

# Copy JAR with dynamic name (assuming standard Maven naming: ${APP_NAME}-*.jar)
COPY target/${APP_NAME}.jar ${APP_NAME}.jar

# Expose default Spring Boot port (change if needed)
EXPOSE 8080

# Run the JAR (use ENV variable in ENTRYPOINT)
ENTRYPOINT ["java", "-jar", "${APP_NAME}.jar"]




