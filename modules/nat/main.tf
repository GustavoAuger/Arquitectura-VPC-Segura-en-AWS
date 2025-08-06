resource "aws_nat_gateway" "nat" {
  allocation_id = var.eip_allocation_id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "${var.name_prefix}-nat-gw"
  }
}