# Use an official Python runtime as a parent image
FROM python:3.8-slim

RUN apt-get update
RUN apt-get install g++ git libffi-dev musl-dev gcc -y

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . /usr/src/app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir jupyter

# Make port 8891 available to the world outside this container
EXPOSE 8891

# Run jupyter notebook when the container launches
CMD ["jupyter", "notebook", "--ip='0.0.0.0'", "--port=8891", "--no-browser", "--allow-root"]
