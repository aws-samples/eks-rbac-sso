
#!/bin/bash
export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account) 
export AWS_REGION=$(aws configure get region)  
mkdir ~/okta-blog-config/
cp ~/artifacts/template/*.* ~/okta-blog-config/
cd ~/okta-blog-config
sed -i -e "s~{AWS_REGION}~$AWS_REGION~" *.*
sed -i -e "s~{ACCOUNT_ID}~$ACCOUNT_ID~" *.*
sed -i -e "s~{MASTER_KEY}~$MASTER_KEY~" *.*
echo AWS_REGION: $AWS_REGION
echo ACCOUNT_ID: $ACCOUNT_ID