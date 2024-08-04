# Use the latest version of cypress/browsers image
FROM cypress/browsers:latest

# Set the working directory
WORKDIR /app

# Install Python and necessary packages in a single RUN command
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python packages
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Set environment variable for Python unbuffered output
ENV PYTHONUNBUFFERED=1

# Set environment variable for the PATH
ENV PATH /root/.local/bin:${PATH}

# Set the command to run the application
CMD ["python3", "main.py"]
