FROM python:3.10-slim

# Create CTF user
RUN useradd -m ctfuser

# Set working directory
WORKDIR /home/ctfuser

# Copy server file
COPY server.py .

# Give permission
RUN chmod +x server.py
RUN chown -R ctfuser:ctfuser /home/ctfuser

USER ctfuser

# Run python automatically when container starts
ENTRYPOINT ["python3", "server.py"]
