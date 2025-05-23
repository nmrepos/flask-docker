# base image
FROM python:3.11.8-alpine

# Setting up the environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create a user for running the app
RUN adduser -D nidhun

# Setting up the work directory
WORKDIR /app

# Installing the dependencies needed for app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copying the application code
COPY app.py .

# adding permissions
RUN chown -R nidhun:nidhun /app

# Switch to non-root user nidhun
USER nidhun

# Exposing the port 8080
EXPOSE 8080

# Defining volume for persistent data
VOLUME ["/app/data"]

# Run the application
CMD ["python", "app.py"]
