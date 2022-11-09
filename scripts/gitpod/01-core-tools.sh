#!/bin/bash
install_awscli() {
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm -rf awscliv2.zip
    rm -rf ./aws
}

if ! command -v aws &> /dev/null; then install_awscli; fi
if ! command -v tig &> /dev/null; then sudo apt install tig; fi
if ! command -v mc &> /dev/null; then sudo apt install mc; fi

