resource "aws_route_table" "reserved_rt" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }
  tags = {
    Name = "RESERVED-RT"
  }
}

resource "aws_route_table" "app_rt" {
  count  = 3
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ng.*.id[count.index]
  }
  tags = {
    Name = "APP-RT-${count.index + 1}"
  }
}

resource "aws_route_table" "web_rt" {
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }
  tags = {
    Name = "WEB-RT"
  }
}

resource "aws_route_table" "db_rt" {
  count  = 3
  vpc_id = aws_vpc.main_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ng.*.id[count.index]
  }
  tags = {
    Name = "DB-RT-${count.index + 1}"
  }
}

#Route Table Association

resource "aws_route_table_association" "reserved" {
  count          = length(var.reserved_subnets_cidr)
  subnet_id      = element(aws_subnet.reserved.*.id, count.index)
  route_table_id = aws_route_table.reserved_rt.id
}

resource "aws_route_table_association" "web" {
  count          = length(var.web_subnets_cidr)
  subnet_id      = element(aws_subnet.web.*.id, count.index)
  route_table_id = aws_route_table.web_rt.id
}

resource "aws_route_table_association" "db" {
  count          = 3
  subnet_id      = aws_subnet.db.*.id[count.index]
  route_table_id = aws_route_table.db_rt.*.id[count.index]
}

resource "aws_route_table_association" "app" {
  count          = 3
  subnet_id      = aws_subnet.app.*.id[count.index]
  route_table_id = aws_route_table.app_rt.*.id[count.index]
}
