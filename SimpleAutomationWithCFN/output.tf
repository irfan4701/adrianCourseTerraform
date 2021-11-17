output  "instance_id" {
  value       = aws_instance.myec2.id
}

output  "public_dns" {
  value       = aws_instance.myec2.public_dns
}

output  "pub_ip" {
  value       = aws_instance.myec2.public_ip
}

output  "AZ" {
  value       = aws_instance.myec2.availability_zone
}
