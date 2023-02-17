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