resource "aws_key_pair" "myKey" {
    key_name = var.key_name
    public_key = file(var.public_key_path)
}

data "aws_ami" "amazon-linux-2" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "owner-alias"
        values = ["amazon"]
    }
}

resource "aws_instance" "myec2" {
    instance_type = var.instance_type
    ami = data.aws_ami.amazon-linux-2.id
    vpc_security_group_ids = [aws_security_group.mysg.id]
    key_name      = aws_key_pair.myKey.id
    iam_instance_profile = aws_iam_instance_profile.test.name
}


resource "aws_security_group" "mysg" {
    name = "Test Security group"
    tags = {
        Name = "MySG"
    }
}

resource "aws_security_group_rule" "ingress_rule" {
    for_each        = var.ingress_rule
    type            = "ingress"
    from_port       = each.value.from
    to_port         = each.value.to
    protocol        = each.value.proto
    cidr_blocks     = [each.value.cidr]
    security_group_id = aws_security_group.mysg.id
}

resource "aws_security_group_rule" "egress_rule" {
    for_each        = var.egress_rule
    type            = "egress"
    from_port       = each.value.from
    to_port         = each.value.to
    protocol        = each.value.proto
    cidr_blocks     = [each.value.cidr]
    security_group_id = aws_security_group.mysg.id
}

resource "aws_iam_role" "test_role" {
  name = "test_role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_role_policy_attachment" "AmazonEC2RoleforSSM" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  role       = aws_iam_role.test_role.name
}

resource "aws_iam_instance_profile" "test" {
    name = "test"
    role = aws_iam_role.test_role.name
}

