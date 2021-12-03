output "dev5" {
  value = aws_instance.dev5.public_ip
}
output "dev" {
  #   value = aws_instance.dev[*].public_ip
  value = {
    for k, v in aws_instance.dev : k => {
      id = v.id
      ip = v.public_ip
    }
  }
}
