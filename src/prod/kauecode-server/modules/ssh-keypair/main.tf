resource "tls_private_key" "pk" {
    algorithm = "RSA"
}

resource "aws_key_pair" "kp" {
    key_name   = "workstation-kauecode-1-config"
    public_key = file("/home/kauemendes/keys/workstation-kauecode-config/rsa-key.pub")
}

resource "local_file" "private_key_pem" {
    content  = tls_private_key.pk.private_key_pem
    filename = "${var.keyfolder}/${var.keyname}.pem"
}