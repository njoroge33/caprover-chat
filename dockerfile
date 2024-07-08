# Use the official slim Python image from the Docker Hub
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install virtualenv
RUN pip install --upgrade pip
RUN pip install virtualenv

# Create a virtual environment
RUN virtualenv venv

# Activate the virtual environment and install dependencies
RUN . venv/bin/activate && pip install -r requirements.txt

# Copy the rest of the working directory contents into the container
COPY . /app/

# Expose the port the app runs on
EXPOSE 8765

# Run the application
CMD ["solara", "run", "app.py"]
