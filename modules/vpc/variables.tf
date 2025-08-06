variable "cidr_block" {
  description = "El bloque CIDR para la VPC"
  type        = string
}

variable "region" {
  description = "La región de AWS"
  type        = string
}

variable "name" {
  description = "El nombre de la VPC"
  type        = string
}
  