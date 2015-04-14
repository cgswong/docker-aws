What is docker-aws
==============
[Docker](https://docker.io) image for running the [Amazon Web Services Command Line Interface](http://aws.amazon.com/cli/). It creates a [Docker](https://docker.io) image containing all dependencies needed to run `aws`. That way, you can run `aws` in a [Docker](https://docker.io) container without setting the `aws` dependencies on the host system.


Background
----------
The `aws` command is a command line interface for [Amazon's Web Services](http://aws.amazon.com), like [EC2](http://aws.amazon.com/ec2), [S3](http://aws.amazon.com/s3/), etc.


Run from Docker Hub
-------------------
A pre-built image is available on [Docker Hub](https://registry.hub.docker.com/u/cgswong/aws) and can be run as follows:

    docker run -it cgswong/aws

The container will start a `bash` shell with the [aws](http://docs.aws.amazon.com/cli/latest/reference/) command ready to use.


Build from Source
-----------------
1. Make sure [Docker](https://www.docker.com) is installed.

2. Clone _docker-aws_ from [GitHub](https://github.com/cgswong/docker-aws)

   ```bash
   git clone https://github.com/cgswong/docker-aws.git
   ```
3. Build the docker image

   ```bash
   cd docker-aws
   docker build -t cgswong/aws:latest .
   ```

4. Run a docker container with that image

   ```bash
   docker run -it cgswong/aws
   ```


How To
------
The following commands should be run inside the [cgswong/aws](https://github.com/cgswong/docker-aws) Docker container. When you run the script for the first time, you need to configure the [aws cli](http://aws.amazon.com/cli) with your AWS credentials:


```
> aws configure
AWS Access Key ID [****************VSSQ]:
AWS Secret Access Key [****************UkAC]:
Default region name [aws-central-1]:
Default output format [None]:
```


Getting started with the AWS CLI
--------------------------------
For documentation on the AWS CLI, see the [AWS command line interface documentation](http://aws.amazon.com/documentation/cli/) and the [aws-cli GitHub page](https://github.com/aws/aws-cli).