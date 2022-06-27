# Container image that runs your code
FROM ubuntu

# install glibc compatibility for alpine
RUN apt update && apt install -y unzip curl && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && sudo ./aws/install 
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY ecr-check-tag.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
