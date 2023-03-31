region                  = "us-east-1"
profile                 = "dev"
cidr_block              = "10.0.0.0/16"
public_subnet1_cidr     = "10.0.1.0/24"
public_subnet2_cidr     = "10.0.2.0/24"
public_subnet3_cidr     = "10.0.3.0/24"
private_subnet1_cidr    = "10.0.4.0/24"
private_subnet2_cidr    = "10.0.5.0/24"
private_subnet3_cidr    = "10.0.6.0/24"
private_routetable_cidr = "0.0.0.0/0"
public_routetable_cidr  = "0.0.0.0/0"
ami_id                  = "ami-0c38b997ba1247ba0"
domain_name             = "dev.ananthakrishnakalle.me"

//amazonlinux-ami = "ami-0dfcb1ef8550277af"
db_username = "postgres"
db_password = "postgresql"
db_host     = "csye6225"
//db_name = "users"
