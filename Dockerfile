FROM ubuntu:latest

RUN apt-get update && apt-get -y install curl gnupg software-properties-common && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && apt-get -y install terraform && \
    rm -rf /var/lib/apt/lists/*

ADD ./ /aws-eks-provisioner
WORKDIR /aws-eks-provisioner

ENTRYPOINT ["./entrypoint.sh"]
