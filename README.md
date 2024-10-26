```
Scenario:
========

Write a standard web service that serves a straightforward API. The service has to be containerized. It will act as a small microservice displaying greeting text based on a query parameter.

Requirements:
Programming Language & Framework:
Choose a programming language you are comfortable with (Python, Go, NodeJS).
Create a web application using a simple web framework (e.g., for Python, Flask, for Node.js, Express, or built-in net/http for Go).

Web Server Functionality:
The web server should be listening to port 8080.
Create a new API and add: GET /greet endpoint.
This endpoint should perform a GET request and accept a query parameter name.
The server response should be a dictionary JSON as {"message": "Hello !"}.
If the name parameter is missing, the server reply should be “Now everyone can be a hero...:,”.

Dockerization:
Prepare a Dockerfile to dockerize the web server.
Make sure that the docker image is relatively thin and well-optimized.

Testing & Validation:
Open a web browser and ensure the service is available at http://localhost:8080/greet?name=YourName.
Test the service by sending a few requests using different name values.

Bonus:
Create a health check (GET /health) for the service that accepts a request and returns a JSON response regarding the status of the service (e.g., severity level returned as {"status": "ok"}).
Add a CI/CD pipeline script (e.g., GitHub Actions, Jenkins, Gitlab) that builds a Docker image, starts the service, and runs a basic test suite against the running container.
```
Task steps:

#### 1. Create the Web Service (File: app.py)

Defines two endpoints, /greet and /health.
/greet returns a personalized greeting or a default message if the name parameter is missing.
/health checks the server status, returning {"status": "ok"} for monitoring.

#### 2. Dockerize the Application (File: Dockerfile)

Note: Uses python:3.9-slim for a smaller image. Installs Flask and sets up the /app directory. Exposes port 8080 and runs app.py.

#### 3. Build and Run the Docker Container

Build the Docker image:

```
docker build -t hello-app .
```
Run the Docker container:

```
docker run -p 8080:8080 hello-app
```
#### 4. Test endpoints:

Use curl for testing:
```
$ curl "http://localhost:8080/greet?name=adavarski"
{"message":"Hello adavarski!"}

$ curl "http://localhost:8080/greet"
{"message":"Now everyone can be a hero..."}

$ curl "http://localhost:8080/health"
{"status":"ok"}
```

#### 5. Add a CI/CD pipeline script (GitHub Actions) that builds a Docker image, starts the service, and runs a basic test suite against the running container.

Builds and tests the Docker container with GitHub Actions.

### GitHub Actions output -> https://github.com/adavarski/chaos-assesment/actions/runs/11529771711
