FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install curl gnupg software-properties-common git && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && apt-get -y install terraform && \
    rm -rf /var/lib/apt/lists/*
ADD ./ ./
ENTRYPOINT ["./entrypoint.sh"]
