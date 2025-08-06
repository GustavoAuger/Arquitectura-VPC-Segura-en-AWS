# Definición de variables
variable "aws_region" {
  description = "La región de AWS donde se desplegará la infraestructura"
  type        = string
}

variable "vpc_cidr_block" {
  description = "El bloque CIDR para la VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "El nombre de la VPC"
  type        = string
  default     = "vpc-M4-L5"
}

variable "public_subnet_cidr" {
  description = "El bloque CIDR para la subred pública"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "El bloque CIDR para la subred privada"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "El tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "aws_availability_zone" {
  description = "La zona de disponibilidad AWS"
  type        = string
  default     = "us-east-1a"
}
variable "key_name" {
  description = "Nombre del par de claves SSH para acceso a EC2"
  type        = string
}
variable "my_ip_cidr" {
  description = "El bloque CIDR para la subred pública"
  type        = string
}
