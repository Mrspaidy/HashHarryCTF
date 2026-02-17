FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y openssh-server python3 && \
    mkdir /var/run/sshd

# Create user with bash shell
RUN useradd -m -s /bin/bash ctfuser && \
    echo "ctfuser:ctfpass123" | chpasswd

WORKDIR /home/ctfuser

COPY server.py .

RUN chown -R ctfuser:ctfuser /home/ctfuser

# Auto run python script on login
RUN echo "python3 /home/ctfuser/server.py" >> /home/ctfuser/.bashrc

# Enable password login
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]




