#Image: python:3.11-alpine3.21
FROM python:3.11-alpine3.21

# Set the working directory
WORKDIR /usr/src/app

# Copy requirements.txt
COPY requirements.txt ./

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 80

# Start the application
CMD ["python", "app.py"]
