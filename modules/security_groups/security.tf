
data "aws_instance" "instance" {
  instance_id = var.instance_id
}
resource "aws_security_group" "sg" {
  name        = var.name
  description =var.description
  vpc_id      = var.vpc_id
//subnet_id=var.subnet_id
    //
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "instace_security"
  }
}



resource "aws_network_interface_sg_attachment" "sg_attachment" {
security_group_id    = aws_security_group.sg.id
network_interface_id = data.aws_instance.instance.network_interface_id
}