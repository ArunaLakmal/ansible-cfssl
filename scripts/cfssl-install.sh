#!/bin/bash

sudo curl -s -L -o /bin/cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
sudo curl -s -L -o /bin/cfssljson https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
sudo curl -s -L -o /bin/cfssl-certinfo https://pkg.cfssl.org/R1.2/cfssl-certinfo_linux-amd64
sudo chmod +x /bin/cfssl*

#python3 need to be installed
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py 
python3 get-pip.py 

#python packages
pip install botocore boto boto3 ansible awscli

ansible-galaxy collection install community.aws