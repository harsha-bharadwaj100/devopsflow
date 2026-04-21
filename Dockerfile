FROM eclipse-temurin:21-jdk

WORKDIR /app

# Copy everything in your java folder to maintain the package path
COPY src/main/java/ /app/

# Compile the specific class using its path
RUN javac devopsflow/Calculator.java

# Run using the Fully Qualified Class Name (FQCN)
CMD ["java", "devopsflow.Calculator"]