# aws-infra

We have four main files for our Terraform configuration. 

1. The "provider.tf" file specifies the provider and region details. 
2. The "variables.tf" file defines all the variables, their types, and default values. 
3. The "main.tf" file lists all the resources that need to be created. 
4. The "variables.tfvars" file is used to pass values like CIDR blocks and regions via the command prompt.

To run the Terraform configuration, we need to use three commands. 
1. First, we use "terraform init" to prepare the backend processes for creation. 
2. Next, we use "terraform apply" to create all the resources listed in the configuration files, with a confirmation prompt before creation. 
3. Finally, we use "terraform destroy" to remove all the created resources.

In this configuration, we have created a VPC, three private subnets, and three public subnets in different availability zones within the same region. 
We have also created one public route table, one private route table, and one internet gateway. 
To keep our project organized, we have added ".tfvars", ".terraform.lock.hcl", and "terraform.state" to our gitignore file.

Assignment 4

Prerequisites: In this assignment we are setting up networking infrastructure using terraform on AWS. For that we have installed AWS CLI and terraform

Requirements and Description: users "aws_cli_dev" and "aws_cli_demo" have been created in dev and demo aws user accounts with administrator access respectively.
Now we create access keys under the security credentials of the users and configure them in the AWS CLI for each of the dev and demo profiles.

Steps to run the project:

The below commands are used to setup the virtual private cloud (vpc) network infrastructure in the AWS region as per inputs provided


1. "terraform init" - Initializes the backend and provider plugins hashicorp/aws
2. "terraform fmt" - Formats the terraform files in the directory
   
3. "terraform apply" -var-file var.tfvars" - It will setup the vpc with subnets (public and private) with the internet gateway as per the configuration provided in the main.tf file. The data.tf file contains the Availability Zones data source allows access to the list of AWS Availability Zones which can be accessed by an AWS account within the region configured in the provider. The "-var-file var.tfvars" helps in executing the application with the values defined in the var.tfvars file for the vpc cidr block, public and private subnets, profile and aws_region.
4. The EC2 instance is created in the VPC created and is attached to the github secrets configured
   
5. "terraform destroy" -var-file var.tfvars" - It will destroy the network infrastructure setup on AWS.

Assignment 5:

In this assignment we are adding 4 new routes in our web application

1. POST : v1/product/productID/image -> to post a new image

2. GET : v1/product/productID/image -> to get all images

3. GET : v1/product/productID/image/imageId -> to get specific image

4. DELETE : v1/product/productID/image/imageId -> to delete a specific image

When we post and delete images , they should get uploaded and deleted in the S3 bucket in Aws ec2 instance

This assignment should ensure that our app runs in the ec2 instance and get connected to the rds instance.

Assignment 6:

Registering a Domain Name:

Go to Namecheap or any other domain registrar and register a domain name. If you're a student, you can get a free .me TLD domain from Namecheap with the Github Student Developer pack.

Configuring Amazon Route 53:

1. Log in to your AWS account and go to the Amazon Route 53 console.
2. Create a public hosted zone for your domain name by clicking on "Create Hosted Zone" and entering your domain name (e.g. yourdomainname.tld) in the "Domain Name" field. Leave the other fields as default and click on "Create Hosted Zone."
3. After creating the hosted zone, you will see four Route 53 name servers listed for your hosted zone. Copy these name servers to use in the next step.
4. Go to Namecheap or your domain registrar's console and update the domain's name servers to the Route 53 name servers you copied in the previous step.
5. Create a subdomain and hosted zone for the dev AWS account by clicking on "Create Hosted Zone" again and entering "dev" in the "Name" field and selecting "Public Hosted Zone" in the "Type" field. Enter your domain name (e.g. yourdomainname.tld) in the "Domain Name" field and leave the other fields as default. Click on "Create Hosted Zone."
6. After creating the dev hosted zone, you will see four Route 53 name servers listed for the hosted zone. Copy these name servers to use in the next step.
7. Go back to the hosted zone for your main domain name and click on "Create Record Set." Enter "dev" in the "Name" field, select "A - IPv4 address" in the "Type" field, and enter the IP address of your dev server in the "Value" field. Leave the other fields as default and click on "Create."
8. Create a subdomain and hosted zone for the demo AWS account by repeating steps 5-7, replacing "dev" with "prod."

Assignment 9:

Below is the command that will upload the Namecheap SSL certificate to AWS.

$ aws --profile demo acm import-certificate --certificate file="Certificate.pem" --certificate-chain file="CertificateChain.pem" --private key="PrivateKey.pem"

To upload the certificate, I changed the file paths with my own file paths and extension names.

Added two separate kms keys, one for encrypting ebs volumes and the other for encrypting rds instances.

Modified the security group entrance rule for the load balancer to use port 443 (https).