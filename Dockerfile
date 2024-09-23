# Use the latest Alpine image
# docker build -t my-django-app .
FROM python:alpine

# Install Python and required packages
RUN apk add --no-cache python3 py3-pip

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Create a working directory
WORKDIR /code

# Copy requirements file to the working directory
COPY requirements.txt /code/

# Install Python dependencies
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install Django
RUN pip3 install -r requirements.txt

# Copy the rest of the application code to the working directory
COPY . /code/

# Expose the port that the app runs on
EXPOSE 8000

# Command to run the Django application
CMD ["python3", "container/manage.py", "runserver", "0.0.0.0:8000"]
