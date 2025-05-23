FROM python:3.10-slim

# Install system dependencies required by PyAudio
RUN apt-get update && apt-get install -y \
    portaudio19-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Copy your requirements.txt
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy your app files
COPY . .

# Command to run your app (change as needed)
CMD ["streamlit", "run", "app.py"]
