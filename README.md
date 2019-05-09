# Purpose
This is a project to construct an image of [RedHat Application Migration Toolkit](https://developers.redhat.com/products/rhamt/overview/).

# Building the image
After cloning this repository, being at main folder, run: `docker build -t rhamt:4.2.1 -t rhamt:latest .`

# Running the image locally
After building the image, you can run the image with: `docker run --name rhamt -d -p 8080:8080 rhamt`.

In case you want to run it from  **dockerhub**, just do: `docker run --name rhamt -d -p 8080:8080 ricardosouzamorais/rhamt`

To check the logs an a tail way, run: `docker logs -f rhamt`

# Accessing RHAMT

In our favorite browser, just navigate to: `http://localhost:8080`
