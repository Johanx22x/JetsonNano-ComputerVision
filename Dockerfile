FROM archlinux:latest

WORKDIR /jetson

# Update the system
RUN pacman -Syu --noconfirm

# Install dependencies
RUN pacman -S --noconfirm \
    python3 \
    python-pip \
    python-setuptools \
    python-wheel \
    cmake \
    gcc \
    make \
    git \
    pkg-config \
    gtk3 \
    libcanberra \
    mesa \
    libglvnd \
    opencv \
    opencv-samples

# Install Python dependencies
COPY requirements.txt .

# Remove EXTERNALLY-MANAGED
RUN rm -rf /usr/lib/python3.11/EXTERNALLY-MANAGED && \
    pip3 install -r requirements.txt

# Give root access to video devices
RUN usermod -a -G video root

# Copy source code
COPY ./src .

# Run the application
CMD [ "python", "main.py" ]
