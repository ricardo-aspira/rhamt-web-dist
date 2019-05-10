# Purpose
This is a project to construct an image of [RedHat Application Migration Toolkit](https://developers.redhat.com/products/rhamt/overview/).

# Prerequisites
* Docker version 18.09.2
* git-lfs/2.3.4
* git version 2.17.1

# Building the image
After cloning this repository, being at main folder, run: `docker build -t rhamt:4.2.1 -t rhamt:latest .`

# Running the image locally
After building the image, you can run the image with: `docker run -d -p 8080:8080 rhamt`.

In case you want to run it from  **dockerhub**, just do: `docker run -d -p 8080:8080 ricardosouzamorais/rhamt`<br/>
The **RHAMT** uses an H2 database to store all analysis but since it is done inside the container, in case you lose it , all data will be lost.

In order to overpass that, we can tell **RHAMT** to run pointing its H2 database to outside the container, with the following command, pointing the current directory as a location on host to get a copy of H2 database: ``

To check the logs, get the container ID using the `docker ps` command and run the following to get that in a tail way: `docker logs -f <CONTAINER_ID>`

# Accessing RHAMT

In our favorite browser, just navigate to: `http://localhost:8080`
