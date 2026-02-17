FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install SSH + Python
RUN apt update && \
    apt install -y openssh-server python3 && \
    mkdir /var/run/sshd

# Create user with python as default shell
RUN useradd -m -s /usr/bin/python3 ctfuser && \
    echo "ctfuser:ctfpass123" | chpasswd

WORKDIR /home/ctfuser

COPY server.py .

RUN chown -R ctfuser:ctfuser /home/ctfuser

# Enable password login
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]




