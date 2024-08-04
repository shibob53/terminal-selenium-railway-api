# Use the latest version of cypress/browsers image
FROM cypress/browsers:latest

# Set the working directory
WORKDIR /app

# Install Python and necessary packages in a single RUN command
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt .

# Create a virtual environment
RUN python3 -m venv venv

# Activate the virtual environment and install Python packages
RUN venv/bin/pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set environment variable for Python unbuffered output
ENV PYTHONUNBUFFERED=1

# Ensure the virtual environment is used by setting the PATH
ENV PATH="/app/venv/bin:$PATH"

# Set the command to run the application
CMD ["python3", "main.py"]
