variable "instance_type" {
    default = "t2.micro"
}

variable "ami" {
    default = "ami-0742b4e673072066f"
}

variable ingress_rule {
  type        = map(map(any))
  default     = {
      rule1   = { from = 22, to = 22, proto = "tcp", cidr = "0.0.0.0/0", desc = "test1"}
      rule2   = { from = 80, to = 80, proto = "tcp", cidr = "0.0.0.0/0", desc = "test1"}
  }  
}

variable egress_rule {
  type        = map(map(any))
  default     = {
      rule1   = { from = 0, to = 0, proto = -1, cidr = "0.0.0.0/0", desc = "Allow All"}
  }  
}

variable "key_name" {
    default = "demo"
}

variable "public_key_path" {
    default = "/home/irfan/Projects/Terraform/adrianCantrill/SimpleAutomationWithCFN/demo.pub"
}