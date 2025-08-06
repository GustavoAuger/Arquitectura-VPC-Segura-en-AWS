variable "vpc_id" {
  description = "ID de la VPC donde crear las subnets"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR para la subnet pública"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR para la subnet privada"
  type        = string
}

variable "availability_zone" {
  description = "Zona de disponibilidad AWS"
  type        = string
}

variable "name_prefix" {
  description = "Prefijo para los nombres de recursos"
  type        = string
  default     = "subnet-M4-L5"
}
