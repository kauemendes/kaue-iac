output "key_name" {
    description = "The name of the SSH key pair"
    value       = aws_key_pair.example.key_name
}

output "public_key" {
    description = "The public key of the SSH key pair"
    value       = aws_key_pair.example.public_key
}

output "private_key" {
    description = "The private key of the SSH key pair"
    value       = aws_key_pair.example.private_key
    sensitive   = true
}