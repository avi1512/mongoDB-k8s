# Pull base image.
FROM ubuntu:22.04

RUN apt update && apt upgrade -y && apt install wget curl gnupg2 -y && \
    wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc |  gpg --dearmor | tee /usr/share/keyrings/mongodb.gpg > /dev/null && \
    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list && \
    apt update && \
    apt install mongodb-org -y


#RUN apt update && apt upgrade -y && apt install gnupg2 curl -y && \
#    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
#    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
#    apt-get update && apt-get install mongodb-org -y

#RUN apt update && apt upgrade -y && apt install gnupg2 curl -y && \
#    curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
#   gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
#   --dearmor && \
#    echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list && \ 
#    apt install -y mongodb

# Install MongoDB.
#RUN \
#  apt update && apt install gnupg2 curl -y && \
#  curl -fsSL https://pgp.mongodb.com/server-7.0.asc | gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor && \
#  apt-get update && apt-get install -y mongodb-org
