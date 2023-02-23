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