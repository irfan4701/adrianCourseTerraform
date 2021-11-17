resource "aws_network_acl" "reserved" {
  vpc_id     = aws_vpc.main_vpc.id
  subnet_ids = aws_subnet.reserved.*.id
  tags = {
    Name = "Reserved-NACL"
  }
}

resource "aws_network_acl" "web" {
  vpc_id     = aws_vpc.main_vpc.id
  subnet_ids = aws_subnet.web.*.id
  tags = {
    Name = "WEB-NACL"
  }
}

resource "aws_network_acl" "db" {
  vpc_id     = aws_vpc.main_vpc.id
  subnet_ids = aws_subnet.db.*.id
  tags = {
    Name = "DB-NACL"
  }
}

resource "aws_network_acl" "app" {
  vpc_id     = aws_vpc.main_vpc.id
  subnet_ids = aws_subnet.app.*.id
  tags = {
    Name = "App-NACL"
  }
}

resource "aws_network_acl_rule" "reserved" {
  for_each       = var.common_rules
  network_acl_id = aws_network_acl.reserved.id
  rule_number    = each.value.rule_no
  egress         = each.value.egress
  protocol       = each.value.proto
  rule_action    = each.value.action
  cidr_block     = each.value.cidr
  from_port      = each.value.from
  to_port        = each.value.to
}

resource "aws_network_acl_rule" "web" {
  for_each       = var.common_rules
  network_acl_id = aws_network_acl.web.id
  rule_number    = each.value.rule_no
  egress         = each.value.egress
  protocol       = each.value.proto
  rule_action    = each.value.action
  cidr_block     = each.value.cidr
  from_port      = each.value.from
  to_port        = each.value.to
}

resource "aws_network_acl_rule" "db" {
  for_each       = var.common_rules
  network_acl_id = aws_network_acl.db.id
  rule_number    = each.value.rule_no
  egress         = each.value.egress
  protocol       = each.value.proto
  rule_action    = each.value.action
  cidr_block     = each.value.cidr
  from_port      = each.value.from
  to_port        = each.value.to
}

resource "aws_network_acl_rule" "app" {
  for_each       = var.common_rules
  network_acl_id = aws_network_acl.app.id
  rule_number    = each.value.rule_no
  egress         = each.value.egress
  protocol       = each.value.proto
  rule_action    = each.value.action
  cidr_block     = each.value.cidr
  from_port      = each.value.from
  to_port        = each.value.to
}

variable "common_rules" {
  type = map(map(any))
  default = {
    rule1 = { rule_no = 100, egress = "false", proto = "tcp", action = "allow", cidr = "0.0.0.0/0", from = "22", to = "22" }
    rule2 = { rule_no = 100, egress = "true", proto = "-1", action = "allow", cidr = "0.0.0.0/0", from = "0", to = "0" }
  }
}