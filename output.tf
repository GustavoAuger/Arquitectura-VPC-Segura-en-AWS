# Salidas

/* 
output "instance_id" {
  value = module.ec2.instance_id
}
*/

output "vpc" {
  value = module.vpc.vpc_id
}

output "public_subnet" {
  value = module.subnets.public_subnet_id
}

output "private_subnet" {
  value = module.subnets.private_subnet_id
}

/* 
output "subnet" {
  value = data.aws_subnet.vpc_subnets.id
}


output "ami_ec2" {
  value = data.aws_ami.latest_amazon_linux.id
}
*/
