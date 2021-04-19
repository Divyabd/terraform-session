variable "key_name" {
    default="hii.pem"
  
}

variable "public_key_path"{
    default="D:/keyPair"

}

variable "intance-type" {
 default="t2.micro" 
}

variable "vpc_cidr" {
 default="190.168.0.0/16"
}
variable "subnet_cidr" {
 default="190.168.1.0/24" 
}

variable "ami_east1" {
 default="ami-042e8287309f5df03"
}
variable "ami_east2" {
 default="ami-08962a4068733a2b6"
}