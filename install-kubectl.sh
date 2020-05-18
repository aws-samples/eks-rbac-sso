#Intstall kubectl 
curl --silent --location -o /usr/local/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.15.10/2020-02-22/bin/linux/amd64/kubectl
chmod +x /usr/local/bin/kubectl
 
#Install eksctl 
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp 
mv -v /tmp/eksctl /usr/local/bin


# Install https://github.com/oktadeveloper/okta-aws-cli-assume-role
wget https://raw.githubusercontent.com/oktadeveloper/okta-aws-cli-assume-role/master/bin/install.sh
bash install.sh -i
