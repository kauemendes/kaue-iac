output "subnet_id" {
  description = "value of the subnet id"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "value of the security group id"
  value       = aws_security_group.sg.id
}