# Proveedor de AWS
provider "aws" {
  region = local.region
  profile = "gustavodev"
}


# Módulo VPC
module "vpc" {
  source = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
  region     = var.aws_region
  name       = var.vpc_name
}

# Módulo Subnet
module "subnets" {
  source             = "./modules/subnet"
  vpc_id             = module.vpc.vpc_id
  public_subnet_cidr = var.public_subnet_cidr
  private_subnet_cidr= var.private_subnet_cidr
  availability_zone  = var.aws_availability_zone
 /* name_prefix      = "subnet-M4-L5"*/ # nombre por defecto ya agregado dentro del modulo subnet
}
# Módulo IGW  
module "igw" {
  source      = "./modules/igw"
  vpc_id      = module.vpc.vpc_id
  name_prefix = "gateway-M4-L5"
}
# Módulo Route Table
module "routes" {
  source              = "./modules/routes"
  vpc_id              = module.vpc.vpc_id
  igw_id              = module.igw.igw_id
  nat_gateway_id      = module.nat.nat_gateway_id
  public_subnet_id    = module.subnets.public_subnet_id
  private_subnet_id   = module.subnets.private_subnet_id
  name_prefix         = "route-table-M4-L5"
}
# Módulo Elastic IP
module "elastic_ip" {
  source      = "./modules/elastic_ip"
  name_prefix = "elastic-ip-M4-L5"
}
# Módulo NAT
module "nat" {
  source            = "./modules/nat"
  public_subnet_id  = module.subnets.public_subnet_id
  eip_allocation_id = module.elastic_ip.eip_allocation_id
  name_prefix       = "nat-M4-L5"
}
# Módulo Security Group 

module "security_group" {
  source       = "./modules/security_group"
  vpc_id       = module.vpc.vpc_id
  name_prefix  = "M4-L5"
  my_ip_cidr   = var.my_ip_cidr

}
# Módulo EC2
module "ec2" {
  source             = "./modules/ec2"
  ami_id             = data.aws_ami.amazon_linux.id
  instance_type      = var.instance_type
  key_name           = var.key_name
  public_subnet_id   = module.subnets.public_subnet_id
  private_subnet_id  = module.subnets.private_subnet_id
  public_sg_id       = module.security_group.public_sg_id
  private_sg_id      = module.security_group.private_sg_id
  name_prefix        = "M4-L5"
}

