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

 /*
# Módulo EC2
module "ec2" {
  source       = "./modules/ec2"
  ami_id       = "ami-0ca9fb66e076a6e32"
  instance_type = var.instance_type
  subnet_id    = data.aws_subnet.vpc_subnets.id
  region       = var.aws_region
}
 */
