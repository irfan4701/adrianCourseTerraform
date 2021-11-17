resource "aws_subnet" "reserved" {
  count                   = length(var.reserved_subnets_cidr)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = element(var.reserved_subnets_cidr, count.index)
  availability_zone       = data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "RESERVED-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "web" {
  count                   = length(var.web_subnets_cidr)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = element(var.web_subnets_cidr, count.index)
  availability_zone       = data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "WEB-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "db" {
  count                   = length(var.db_subnets_cidr)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = element(var.db_subnets_cidr, count.index)
  availability_zone       = data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "DB-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "app" {
  count                   = length(var.app_subnets_cidr)
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = element(var.app_subnets_cidr, count.index)
  availability_zone       = data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "APP-subnet-${count.index + 1}"
  }
}