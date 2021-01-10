variable "type" {
  type = list
  default = ["t2.nano", "t1.micro", "t2.micro"]
}


variable "webports" {
  description = "Ports for apache"
  type = list
  default = [22, 80, 443]
}

variable "ssh_key" {
  default = "./file/my_public_key.pub"
}

variable "ssh_priv_key" {
  default = "./file/my-key-pair.pem"
}
