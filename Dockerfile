ii# Use an official Ubuntu base image
FROM ubuntu:20.04

# Set environment variables to avoid interaction during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages: cowsay, fortune, netcat, and bash
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune \
    netcat \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Create a directory for the application
RUN mkdir -p /app

# Copy the Wisecow script into the container
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Set the working directory
WORKDIR /app

# Expose the port that the service will use
EXPOSE 4499

# Run the Wisecow application
ENTRYPOINT ["/app/wisecow.sh"]

