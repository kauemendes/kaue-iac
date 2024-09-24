output "key_name" {
    description = "The name of the SSH key pair"
    value       = aws_key_pair.kp.key_name
}

output "public_key_name" {
    description = "The public key of the SSH key pair"
    value       = aws_key_pair.kp.public_key
}