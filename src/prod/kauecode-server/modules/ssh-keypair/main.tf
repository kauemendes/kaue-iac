resource "tls_private_key" "pk" {
    algorithm = "ED25519"
}

resource "aws_key_pair" "kp" {
    key_name   = "workstation-kauecode-config"
    public_key = file("/home/kauemendes/keys/workstation-kauecode-config/key.pub")
}

resource "local_file" "private_key_pem" {
    content  = tls_private_key.pk.private_key_pem
    filename = "${var.keyfolder}/${var.keyname}.pem"
}