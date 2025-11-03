#creating vpc1
resource "aws_vpc" "vpc_github_action" {
 cidr_block = var.vpc_github_action

 tags = {
  Name = "vpc_github_action"
 }
}

 #creating subnet

 resource "aws_subnet" "gitaction_subnet" {
  vpc_id = aws_vpc.vpc_github_action
  cidr_block = var.gitaction_subnet

  tags = { 
   Name = "gitaction_subnet"
  }
}

  #creating internet gateway
  resource "aws_internet_gateway" "gitaction_igw"{
   vpc_id = aws_vpc.vpc_github_action

   tags = {
    Name = "gitaction_igw"
   }
  }

   #creating route table 
   resource "aws_route_table" "gitaction_route_table"{
    vpc_id = aws_vpc.vpc_github_action.id

    tags = {
     Name = "gitaction_route_table"
    }
   }
   #creating route to attach internet gateway with route table
    resource "aws_route" "gitaction_route" {
     gateway_id = aws_internet_gateway.gitaction_igw.id
     route_table_id = aws_route_table.gitaction_route.id
     destination_cidr_block = "0.0.0.0/0"
    }

    #creating route table association 
    resource "aws_route_table_association" "gitaction_route_association" {
     route_table_id = aws_route_table.gitaction_route.id
     subnet_id = aws_subnet.gitaction_subnet.id
    }

    #creating security group
    resource "aws_security_group" "gitaction_sg" {
     description = "allowing ports http (80) and ssh(22)"

     ingress {
      description = "allowing ssh port"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
     }
     ingress {
      description = "allowing ssh port"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
     }
     egress {
      description = "allow all outbound"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
     }
 }

     
    
