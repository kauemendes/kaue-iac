terraform {                                      #this is we tell terraform we config AWS
  backend "s3" {
    bucket         = "kauecode-state"
    key            = "stage/kauecode-app/terraform.tfstate"
    region         = "sa-east-1"
  }
}

# module "networking" {
#   source = "./modules/networking"
#   region               = "${var.region}"
#   environment          = "${var.environment}"
#   vpc_cidr             = "${var.vpc_cidr}"
#   public_subnets_cidr  = "${var.public_subnets_cidr}"
#   private_subnets_cidr = "${var.private_subnets_cidr}"
#   availability_zones   = "${local.production_availability_zones}"
# }

# module "keypair" {
#   source = "./modules/ssh-keypair"
# }

locals {
    project_name = "kauecode"
    key_name = "kauecode-sshkey-1"
    production_availability_zones = ["sa-east-1a", "sa-east-1c"]
}

# Create a VPC
resource "aws_vpc" "kauecode_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "KaueCodeVPC"
  }
}

# Create a subnet
resource "aws_subnet" "kauecode_subnet" {
  vpc_id            = aws_vpc.kauecode_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "sa-east-1a"
  tags = {
    Name = "KaueCodeSubnet"
  }
}

# Create a security group
resource "aws_security_group" "kauecode_sg" {
  name   = "KaueCodeSecurityGroup"
  vpc_id = aws_vpc.kauecode_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Replace with your desired IP range
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "KaueCodeSecurityGroup"
  }
}

resource "aws_instance" "kauecode-server" {
  ami                     = "ami-01a38093d387a7497"
  instance_type           = "t2.micro"

  # subnet_id     = "${module.networking.public_subnet_id}"
  # key_name      = "${module.keypair.key_name}"
  
  subnet_id                   = aws_subnet.kauecode_subnet.id
  vpc_security_group_ids      = [aws_security_group.kauecode_sg.id]
  associate_public_ip_address = true


  availability_zone       = "sa-east-1a"
  key_name                = "test-new"
  tags = {
    Name = "${local.project_name}-server"
  }
}