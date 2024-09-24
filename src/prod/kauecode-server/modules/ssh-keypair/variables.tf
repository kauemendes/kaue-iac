variable "keyfolder" {
    description = "Folder to store pem"
    type        = string
    default     = "/home/kauemendes/keys/workstation-kauecode-config"
}

variable "keyname" {
    description = "Name of the pem key file"
    type        = string
    default     = "workstation-kauecode-1"
}

variable "ssh_pub_key_path" {
    description = "The pub ssh key path"
    type        = string
    default     = "/home/kauemendes/keys/workstation-kauecode-config/key.pub"
}
