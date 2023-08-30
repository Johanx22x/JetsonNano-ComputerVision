FROM ubuntu:20.04

WORKDIR /jetson

# Update and upgrade Ubuntu
RUN apt-get update && apt-get upgrade -y

# Install Python and pip
RUN apt-get install -y \
    python3 \
    python3-pip

# Install Python dependencies
COPY requirements.txt .

RUN pip3 install -r requirements.txt

# Copy source code
COPY ./src .

# Run the application
CMD ["python3", "main.py"]