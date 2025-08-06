variable "vpc_id" {
  type = string
}

variable "igw_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "name_prefix" {
  type = string
}
variable "nat_gateway_id" {
  description = "ID del NAT Gateway para la ruta privada"
  type        = string
}

variable "private_subnet_id" {
  description = "ID de la subnet privada"
  type        = string
}
