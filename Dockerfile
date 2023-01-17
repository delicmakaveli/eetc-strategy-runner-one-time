# Use an official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.10-slim-buster

# Set the working directory
WORKDIR /eetc-strategy-runner-one-time

# Install dependencies
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Copy local code to the container image.
COPY . .

# Run the web service on container startup. Here we use the uvicorn webserver
CMD uvicorn main:app --host 0.0.0.0 --port $PORT
