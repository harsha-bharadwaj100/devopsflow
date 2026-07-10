# devopsflow

Simple Java + Maven sample project for practicing a basic DevOps workflow with unit tests, code coverage, Docker, Jenkins, and ngrok.

## Tech Stack

- Java
- Maven
- JUnit 5
- JaCoCo
- Docker
- Jenkins Pipeline
- ngrok

## Project Structure

```text
.
├── Dockerfile
├── Jenkinsfile
├── pom.xml
└── src
    ├── main/java/devopsflow/Calculator.java
    └── test/java/devopsflow/CalculatorTest.java
```

## Prerequisites

- JDK (Java 21+ recommended)
- Maven 3+
- Docker (optional, for container run)

## Build and Test

Run from the repository root:

```bash
mvn clean test
```

This runs unit tests and generates JaCoCo coverage output under:

- `target/site/jacoco/`

## Run Locally

The current `main` method in `Calculator` is empty.  
You can still compile and run the class:

```bash
mvn clean compile
java -cp target/classes devopsflow.Calculator
```

## Run with Docker

Build image:

```bash
docker build -t my-docker-app .
```

Run container:

```bash
docker run --rm my-docker-app
```

## Jenkins Pipeline

`Jenkinsfile` defines:

1. **Build & Test**: `mvn clean test`
2. **Docker build and Run**:
   - `docker build -t my-docker-app .`
   - `docker run my-docker-app`

It also publishes test reports and archives JaCoCo artifacts from `target/site/jacoco/`.

## Local CI/CD Webhook Trigger Setup (GitHub + ngrok)

To trigger the Jenkins pipeline automatically when you push code to GitHub:

1. **Expose your local Jenkins server using ngrok**:
   ```bash
   ngrok http 8080
   ```
2. **Configure the GitHub Webhook**:
   - Navigate to your GitHub repository -> **Settings** -> **Webhooks** -> **Add webhook**.
   - **Payload URL**: `https://<your-ngrok-subdomain>.ngrok-free.dev/github-webhook/` (the trailing `/` is required).
   - **Content type**: `application/json`.
   - **Trigger events**: `Just the push event`.
3. **Enable Trigger in Jenkins**:
   - In your Jenkins pipeline configuration, under **Build Triggers**, check **GitHub hook trigger for GITScm polling**.
