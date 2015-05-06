What is docker-aws
==============
[![Circle CI](https://circleci.com/gh/cgswong/docker-aws/tree/rds.svg?style=svg)](https://circleci.com/gh/cgswong/docker-aws/tree/rds)

[Docker](https://docker.io) image for running the [Amazon Web Services Command Line Interface](http://aws.amazon.com/cli/) and [s3cmd](https://github.com/s3tools/s3cmd). It creates a [Docker](https://docker.io) image containing all dependencies needed to run `aws` and `s3cmd`. That way, you can run these tools in a [Docker](https://docker.io) container without setting the dependencies on the host system.


Run from Docker Hub
-------------------
A pre-built image is available on [Docker Hub](https://registry.hub.docker.com/u/cgswong/aws) and can be run as follows:

    docker run -it cgswong/aws

The container will start a `sh` shell with the tools command ready to use.


Build from Source
-----------------
1. Make sure [Docker](https://www.docker.com) is installed.

2. Clone _docker-aws_ from [GitHub](https://github.com/cgswong/docker-aws)

   ```sh
   git clone https://github.com/cgswong/docker-aws.git
   ```
3. Build the docker image

   ```sh
   cd docker-aws
   docker build -t cgswong/aws:latest .
   ```

4. Run a docker container with that image

   ```sh
   docker run -it cgswong/aws
   ```


How To
------
The following commands should be run inside the [cgswong/aws](https://github.com/cgswong/docker-aws) Docker container. When you run the script for the first time, you need to configure the [aws cli](http://aws.amazon.com/cli) with your AWS credentials:


```sh
/ # aws configure
AWS Access Key ID [None]: [YOUR_AWS_ACCESS_KEY_ID_HERE]
AWS Secret Access Key [None]: [YOUR_AWS_SECRET_ACCESS_KEY_ID_HERE]
Default region name [None]: [YOUR_AWS_REGION_HERE]
Default output format [None]: [YOUR_AWS_OUTPUT_FORMAT_HERE]
```


Getting started with the AWS CLI and s3tools
--------------------------------------------
For documentation on the AWS CLI, see the [AWS command line interface documentation](http://aws.amazon.com/documentation/cli/) and the [aws-cli GitHub page](https://github.com/aws/aws-cli). For S3 tools, see the [S3 tools documentation](http://s3tools.org/usage).