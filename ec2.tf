#creating instance 
resource "aws_instance" "gitaction_ec2" {
 ami = var.ami_id
 instance_type = var.instance_type
 key_name = var.key_name
 subnet_id = var.gitaction_subnet.id
 security_groups = [aws_security_group.gitaction_sg.id]
