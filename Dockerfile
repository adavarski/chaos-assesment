# Use a lightweight Python image
FROM python:3.9-slim

# Set a working directory
WORKDIR /app

# Install Flask
RUN pip install Flask

# Copy the application code
COPY app.py /app/

# Expose port 8080
EXPOSE 8080

# Run the app
CMD ["python", "app.py"]
