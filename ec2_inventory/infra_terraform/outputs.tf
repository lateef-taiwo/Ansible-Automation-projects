output "ami_id" {
  value = data.aws_ami.amazon-linux-image.id
}

output "server-one-ip" {
    value = aws_instance.myapp-server-one.public_ip
}

output "server-two-ip" {
    value = aws_instance.myapp-server-two.public_ip
}

output "uat-server-one-ip" {
    value = aws_instance.uat-server-one.public_ip
}

output "uat-server-two-ip" {
    value = aws_instance.uat-server-two.public_ip
}

output "prod-server-one-ip" {
    value = aws_instance.prod-server-one.public_ip
}

output "prod-server-two-ip" {
    value = aws_instance.prod-server-two.public_ip
}