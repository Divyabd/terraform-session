
provider "aws" {
   alias  = "east1"
  region = "us-east-1"
}


provider "aws" {
 alias  = "east2"
  region = "us-east-2"
}

resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

module "my_vpc" {
    source = "../modules/vpc_subnet"
    vpc_cidr=var.vpc_cidr
    vpc_id=module.my_vpc.vpc_id
    subnet_cidr=var.subnet_cidr
    providers={
        aws=aws.east2
    }

    
}
module "my_vpc1" {
    source = "../modules/vpc_subnet"
    vpc_cidr=var.vpc_cidr
    vpc_id=module.my_vpc1.vpc_id
    subnet_cidr=var.subnet_cidr
    providers={
        aws=aws.east1
    }

    
}

module "my_instace" {
  
    source = "../modules/ec2"
    subnet_id=module.my_vpc.subnet_id
   ami=var.ami_east2
    instance_type="t2.micro"
  providers={
        aws=aws.east2
    }

   
}
module "my_instace1" {
  
    source = "../modules/ec2"
    subnet_id=module.my_vpc1.subnet_id
    ami=var.ami_east1
    instance_type="t2.micro"
  providers={
        aws=aws.east1
    }

   
}
module "my_security" {
  
    source = "../modules/security_groups"
    name="rule"
    instance_id=module.my_instace.instance_id
    vpc_id=module.my_vpc.vpc_id
    //subnet_id=module.my_vpc.subnet_id
    description="security_group"
    //network_interface_id=module.my_instace.instance_id
     providers={
        aws=aws.east2
    }
}
module "my_security1" {
  
    source = "../modules/security_groups"
    name="rule"
    instance_id=module.my_instace1.instance_id
    vpc_id=module.my_vpc1.vpc_id
    //subnet_id=module.my_vpc.subnet_id
    description="security_group"
    //network_interface_id=module.my_instace.instance_id
     providers={
        aws=aws.east1
    }
}


