FROM python:2.7-slim

# Python unbuffered (write the output as soon as needed)
ENV PYTHONUNBUFFERED 1

# Folder into which the source will be copied inside the destination container
WORKDIR /django

# Add all to working dir
ADD . /django

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Make port 8000 available to the world outside this container
EXPOSE 8000

