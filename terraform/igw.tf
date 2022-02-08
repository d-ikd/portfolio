resource "aws_internet_gateway" "realshinkitv-igw" {
  vpc_id = aws_vpc.realshinkitv-vpc.id

  tags = {
    Name = "realshinkitv-igw"
  }
}
