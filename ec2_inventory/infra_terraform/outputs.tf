output "ami_id" {
  value = data.aws_ami.amazon-linux-image.id
}

output "server-one-ip" {
    value = aws_instance.myapp-server-one.public_ip
}

output "server-two-ip" {
    value = aws_instance.myapp-server-two.public_ip
}
