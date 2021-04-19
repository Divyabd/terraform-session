

//creating instance
resource "aws_instance" "trf_instance" {
  subnet_id=var.subnet_id
   ami=var.ami
   instance_type=var.instance_type
  tags={
    Name = "instace_One"
  }
  
}
