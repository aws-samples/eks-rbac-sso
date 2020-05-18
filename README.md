### Overview
This repository has configuration files to set up an open-source tool named Okta AWS CLI Assume Role Tool (https://github.com/oktadeveloper/okta-aws-cli-assume-role) for SSO of AWS CLI with Kubernetes' kubectl and eksctl. Using these configuration files, you can create a Docker image named okta-eks-image with Okta AWS CLI Assume Role Tool (https://github.com/oktadeveloper/okta-aws-cli-assume-role), kubectl, and eksctl installed and configured. 

 You can follow these directions on AWS Cloud9 IDE or MacOS. Read the accompanying blog here http:///blog.url
 

### Clone this repository
Let's get started by cloning this repository.
```
mkdir ~/environment
cd ~/environment 
git clone https://github.com/hnaqvi01/Okta-EKS.git
```

### Build the docker image
```
docker build -t okt-eks-image .
```

### Edit Okta properties file 

Edit the okta_eks_role.properties file, you can use VIM editor or your favorite editor
```
cd ~/environment/Okta-EKS
vi okta_eks_role.properties
```

okta_eks_role.properties has several place holders, replace with valid values

```
OKTA_ORG=dev-111111.okta.com
OKTA_AWS_APP_URL=https://dev-111111.okta.com/home/amazon_aws/1111aaa111/111
OKTA_USERNAME=user.email@company.com
OKTA_AWS_ROLE_TO_ASSUME=arn:aws:iam::11111:role/OktaEKSRole
OKTA_AWS_REGION=us-west-2
OKTA_PROFILE=default
```

### Run the docker image and connect to it
```
docker run -v ~/environment/Okta-EKS/okta_eks_role.properties:/root/.okta/config.properties  -v /var/run/docker.sock:/var/run/docker.sock -v ~/environment/Okta-EKS/aftifacts/:/root/artifacts/ -it okta-eks-image /bin/bash
```

### Verify okta-aws-cli-assume-role setup
The docker image okta-eks-image has the okta-aws-cli-assume-role installed configured. This open source tool (https://github.com/oktadeveloper/okta-aws-cli-assume-role%20okta-aws-cli-assume-role) creates a shell function named okta-aws. This function supports bash and fish and it can run AWS CLI commands with Okta SSO. Let's verify its setup by getting the current AWS identity.

```
okta-aws default sts get-caller-identity
```

 It will prompt you for your Okta password, username will be pre-filled with the value you provided in the okta_eks_role.properties file. Enter your Okta password and the response will be similar to this


```
{
    "Account": "xxxxx", 
    "UserId": "sssssd:xxxxx@xxxx.com", 
    "Arn": "arn:aws:sts::xxxxxxx:assumed-role/OktaEKSRole/xxxxx@xxxx.com"
}
```

You are all set to use Okta SSO with kubectl, read this blog for more details http:///blog.url. 
