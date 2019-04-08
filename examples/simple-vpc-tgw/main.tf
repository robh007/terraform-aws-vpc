provider "aws" {
  region = "eu-west-1"
}

module "transit" {
  source = "../../"

  name = "transit-example"

  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  assign_generated_ipv6_cidr_block = false

  enable_nat_gateway = true
  single_nat_gateway = true

  create_tgw                 = true
  subnet_type_tgw_attachment = "private"
  cidr_tgw                   = ["10.0.0.0/8"]

  public_subnet_tags = {
    Name = "public"
  }

  private_subnet_tags = {
    Name = "private"
  }

  tags = {
    Owner       = "user"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "transit-tgw"
  }

  tgw_tags = {
    Name = "tgw"
  }
}


