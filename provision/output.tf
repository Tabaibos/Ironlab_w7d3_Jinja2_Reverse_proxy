# outputs.tf

output "instance_public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value = { for name, instance in aws_instance.jinja2-nginxlab :
  name => instance.public_ip }
}


output "instance_private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value = { for name, instance in aws_instance.jinja2-nginxlab :
  name => instance.public_ip }
}
