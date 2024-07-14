# Use Python base image version 3.8
FROM python:3.8

# Set working directory in the container
WORKDIR /app

# Expose the application port
EXPOSE 3111

# Copy requirements.txt to the working directory
COPY requirements.txt .

# Install packages defined in requirements.txt
RUN pip install -r requirements.txt

# Copy the TechTrends application code to the working directory
COPY . .

# Initialize the database with pre-defined posts
RUN python init_db.py

# Command to run the application at container start
CMD ["python", "app.py"]
