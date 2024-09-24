terraform {                                      #this is we tell terraform we config AWS
  backend "s3" {
    bucket         = "kauecode-state"
    key            = "stage/kauecode-app/terraform.tfstate"
    region         = "sa-east-1"
  }
}

module "networking" {
  source = "./modules/networking"
  region               = "${var.region}"
  environment          = "${var.environment}"
  vpc_cidr             = "${var.vpc_cidr}"
  public_subnets_cidr  = "${var.public_subnets_cidr}"
  private_subnets_cidr = "${var.private_subnets_cidr}"
  availability_zones   = "${local.production_availability_zones}"
}

module "keypair" {
  source = "./modules/ssh-keypair"
}

locals {
    project_name = "kauecode"
    key_name = "kauecode-sshkey-1"
    production_availability_zones = ["sa-east-1a", "sa-east-1c"]
}

resource "aws_instance" "kauecode-server" {
  ami           = "ami-01a38093d387a7497"
  instance_type = "t2.micro"
  subnet_id     = "${module.networking.public_subnet_id}"
  availability_zone = "sa-east-1a"
  key_name      = "${module.keypair.key_name}"
  tags = {
    Name = "${local.project_name}-server"
  }
}
