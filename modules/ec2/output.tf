output "network_interface_id" {
    value = aws_instance.trf_instance.primary_network_interface_id
}
output "instance_id" {
    value = aws_instance.trf_instance.id
}