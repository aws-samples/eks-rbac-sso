FROM amazonlinux:latest

# update  
RUN yum -y update 
# Install OpenJDK11, docker, aws-cli
RUN  amazon-linux-extras install java-openjdk11 
RUN yum install -y 	aws-cli \
    wget  \
    tar \
    gzip \
    jq gettext bash-completion

#install kubectl and eksctl
COPY install-kubectl.sh /root/
RUN bash /root/install-kubectl.sh -i

# OktaAWSCLI bash sell setup
COPY bash_profile /root/.bashrc 
RUN yum clean all
