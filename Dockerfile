FROM python:2.7-slim

# Python unbuffered (write the output as soon as needed)
ENV PYTHONUNBUFFERED 1

# Folder into which the source will be copied inside the destination container
RUN mkdir -p /django
WORKDIR /django

# Add all to working dir
ADD requirements.txt /django/requirements.txt
ADD testdockerdjango/ /django

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Run server
CMD python manage.py makemigrations && python manage.py migrate && python manage.py runserver 0.0.0.0:8000

# Make port 8000 available to the world outside this container
EXPOSE 8000

