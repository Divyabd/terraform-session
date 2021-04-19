
output "vpc_id" {
    value = aws_vpc.trf_vpc.id
}

output "subnet_id" {
    value = aws_subnet.main.id
}
