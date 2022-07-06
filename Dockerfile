# The Docker base image we're using
# We're using python instead of the CentOS stream 8 because we want to give
# the base image the smallest size possible. Given that we just have python3
# as a dependency in our application, we can simply choose a python image
FROM python:3.9-slim-buster

# Specify /myportfolio directory as the working directory of the container image
WORKDIR /myportfolio

# Copy all project files into the container image at requirements.txt
COPY requirements.txt .

# Install dependencies using pip3
RUN pip3 install -r requirements.txt

COPY . .

# Specify the port that will be expose from the container. In our case, it's port 5000 by default
CMD ["flask", "run", "--host=0.0.0.0"]

EXPOSE 5000