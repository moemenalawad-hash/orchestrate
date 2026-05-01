FROM node:20-slim

# Install Python 3, pip, venv support, and curl (used by start.sh for backend health check)
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-venv \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy the entire project
COPY . .

# Install frontend dependencies up front so start.sh doesn't need to fetch them at runtime
RUN cd booking_system_frontend && npm install

# Ensure start.sh is executable
RUN chmod +x start.sh

EXPOSE 8080 5173

CMD ["bash", "start.sh"]
