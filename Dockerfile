FROM python:3.10-slim

# Install system dependencies for PyAudio
RUN apt-get update && apt-get install -y portaudio19-dev && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy your project files
COPY . /app

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Set command to run your app
CMD ["streamlit", "run", "app.py"]
