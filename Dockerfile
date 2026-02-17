FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install SSH server
RUN apt update && \
    apt install -y openssh-server && \
    mkdir /var/run/sshd

# Create CTF user with password
RUN useradd -m -s /bin/bash spaidyslabsx1 && \
    echo "spaidyslabsx1:spaidyslabsx1" | chpasswd

# Set working directory
WORKDIR /home/ctfuser

# Copy your existing python file
COPY server.py .

# Permissions
RUN chown -R spaidyslabsx1:spaidyslabsx1 /home/spaidyslabsx1

# Allow password authentication
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# 🔥 Force Python challenge after login (NO SHELL ESCAPE)
RUN echo "ForceCommand python3 /home/spaidyslabsx1/server.py" >> /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]


