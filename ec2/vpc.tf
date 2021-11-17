#VPC Creation
resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "TerraformVPC"
  }
}

#Internet Gateway Creation
resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name = "main_igw"
  }
}

#EIP For NAT Gateway
resource "aws_eip" "nat" {
  count = 3
  vpc   = true
}

#To Fetch AZs
data "aws_availability_zones" "azs" {
  state = "available"
}

#NAT Gateways
resource "aws_nat_gateway" "ng" {
  count         = 3
  allocation_id = aws_eip.nat.*.id[count.index]
  subnet_id     = aws_subnet.reserved.*.id[count.index]
  tags = {
    Name = "NAT-GW-${count.index + 1}"
  }
}

data "aws_ami" "amazon-linux-2" {
  most_recent = "true"
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

output "ami" {
  value = data.aws_ami.amazon-linux-2.id
}
