provider "aws" {
    region = "us-west-2"  # Change to your desired region
}

resource "tls_private_key" "example" {
    algorithm = "ED25519"
}

resource "aws_key_pair" "example" {
    key_name   = "example-key-pair"
    public_key = tls_private_key.example.public_key_openssh
}

resource "local_file" "private_key_pem" {
    content  = tls_private_key.example.private_key_pem
    filename = "${path.module}/example-key-pair.pem"
}

output "private_key_pem" {
    value     = tls_private_key.example.private_key_pem
    sensitive = true
}

output "public_key_openssh" {
    value = tls_private_key.example.public_key_openssh
}