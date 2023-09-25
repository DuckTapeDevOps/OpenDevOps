# Use the official Python base image
FROM python:3.9-slim-buster

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt file and install the dependencies
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the FastAPI application code into the container
COPY app/fastApp.py .

# Expose the port that the FastAPI application listens on
EXPOSE 8080

# Define the command to run the FastAPI application
CMD ["uvicorn", "fastApp:app", "--host", "0.0.0.0", "--port", "8080"]