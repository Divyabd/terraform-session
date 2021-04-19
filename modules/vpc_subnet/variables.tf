variable "region"{
default="us-west-2"
}

variable "vpc_cidr"{
    type=string
    //default="190.160.0.0/16"

}

variable "subnet_cidr"{
    type=string
   // default=["190.160.1.0/24","190.160.2.0/24","190.160.3.0/24","190.160.4.0/24"]

}

# variable "available"{
    
#     type="list"
#     default=["us-west-2a","us-west-2b","us-west-2c","us-west-2d"]

# }
variable "vpc_id"{

}
# data "aws_vpc" "vpc"{
#     filter {
#       name ="tag.Name"
#       value=["terraform-vpc-one"]
#     }
# }
# data "aws_subnet" "subnet"{
#     filter {
#       name ="tag.Name"
#       value=["terraform-subnet-one"]
#     }
# }