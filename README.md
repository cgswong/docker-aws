# What is docker-aws

[![Circle CI](https://circleci.com/gh/cgswong/docker-aws/tree/s3cmd.svg?style=svg)](https://circleci.com/gh/cgswong/docker-aws/tree/s3cmd)

[Docker](https://docker.io) image for running the [Amazon Web Services Command Line Interface](http://aws.amazon.com/cli/) and [s3cmd](https://github.com/s3tools/s3cmd). It creates a [Docker](https://docker.io) image containing all dependencies needed to run `aws` and `s3cmd`. That way, you can run these tools in a [Docker](https://docker.io) container without setting the dependencies on the host system.


## How to use
There are specific CLI tools within the full range of the AWS CLI tool chain. Each of these has been mapped to a branch and tag so if you only need a specific CLI tool and/or have image size concerns there is something here to meet your needs. If you want all the AWS tool goodies, i.e. AWS CLI, RDS CLI, and S3CMD, then select the `master` branch with the `latest` tag in [Docker Hub](https://registry.hub.docker.com/u/cgswong/aws). Below are the mappings and usages:

| GitHub Branch | Docker Tag | Size (MB)| Usage Example                       |
| ------------- | ---------- | -------- | ----------------------------------- |
| master        | latest     | 240      | `docker run -it cgswong/aws:latest` |
| aws           | aws        | 69       | `docker run -it cgswong/aws:aws`    |
| s3cmd         | s3cmd      | 44       | `docker run -it cgswong/aws:s3cmd`  |
| rds           | rds        | 179      | `docker run -it cgswong/aws:rds`    |

The master/latest starts a `bash` shell so you can use whatever tool you need. For the other containers they will start with the `--version` flag which shows the version for the respective CLI tool. Simply specify whatever options you need for the respective tool (this will replace the default `--version` flag).


## Build from Source
1. Make sure [Docker](https://www.docker.com) is installed.

2. Clone _docker-aws_ from [GitHub](https://github.com/cgswong/docker-aws)

   ```sh
   git clone https://github.com/cgswong/docker-aws.git
   ```

3. Build the docker image

   ```sh
   cd docker-aws
   docker build -t [your_name]/aws:latest .
   ```

4. Run a docker container with that image

   ```sh
   docker run -it [your_name]/aws:latest
   ```

## AWS Credentials
There are three primary methods for setting up your AWS credentials:

1. Run the setup using the container, i.e. when you run the CLI tools for the first time, you need to configure the [aws cli](http://aws.amazon.com/cli) with your AWS credentials. For example:


   ```sh
   / # aws configure
   AWS Access Key ID [None]: [YOUR_AWS_ACCESS_KEY_ID_HERE]
   AWS Secret Access Key [None]: [YOUR_AWS_SECRET_ACCESS_KEY_ID_HERE]
   Default region name [None]: [YOUR_AWS_REGION_HERE]
   Default output format [None]: [YOUR_AWS_OUTPUT_FORMAT_HERE]
   ```

2. The volume `/root/.aws` has been exposed within the image for external access. Therefore you can mount the AWS credential file to the container:

   ```sh
   docker run --volume ~/.aws:/root/.aws cgswong/aws:latest aws [some_command]
   ```

3. By configuring your EC2 instances to make use of IAM Roles, the AWS CLI tools can then transparently make use of this role. Note however, that not all CLI tools can currently leverage this functionality, namely some of the RDS tools.

## Getting started with the AWS CLI and s3tools
For documentation on the AWS CLI, see the [AWS command line interface documentation](http://aws.amazon.com/documentation/cli/) and the [aws-cli GitHub page](https://github.com/aws/aws-cli). For S3 tools, see the [S3 tools documentation](http://s3tools.org/usage).
