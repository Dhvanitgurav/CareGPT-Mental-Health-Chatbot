FROM python:3.10-slim

# Install system dependencies including gcc and portaudio dev headers
RUN apt-get update && apt-get install -y \
    gcc \
    portaudio19-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Copy requirements.txt
COPY requirements.txt .

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy app code
COPY . .

# Run command (change app.py as per your app)
CMD ["streamlit", "run", "app.py"]
