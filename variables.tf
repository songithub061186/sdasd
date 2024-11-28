variable "vpc_cidr" {
  type        = string
  description = "Public Subnet CIDR values"
}

variable "cidr_public_subnet" {
  type        = list(string)
  description = "Public Subnet CIDR values"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "Private Subnet CIDR values"
}

variable "eu_availability_zone" {
  type        = list(string)
  description = "Availability Zones"
}

variable "vpc_id" {
  type        = string
  description = "DevOps Project 1 VPC 1"
}


variable "ec2_sg_name" {
     type        = string
     description = "EC2_SG_Name"

}


variable "ec2_jenkins_sg_name" {
      type        = string
      description = "Jenkins_SG_Name"
}



variable "ami_id" {}
variable "instance_type" {}
variable "tag_name" {}
variable "public_key" {}
variable "subnet_id" {}
variable "sg_for_jenkins" {}
variable "enable_public_ip_address" {}
variable "user_data_install_jenkins" {}


variable "lb_target_group_name" {}
variable "lb_target_group_port" {}
variable "lb_target_group_protocol" {}

variable "ec2_instance_id" {
  description = "EC2 instance ID for the target group attachment"
  type        = string
}



output "jenkins_ec2_instance_id" {
  value = aws_instance.jenkins_ec2_instance.id
}



output "sg_ec2_sg_ssh_http_id" {
  value = aws_security_group.ec2_sg_ssh_http.id
}

output "sg_ec2_jenkins_port_8080" {
  value = aws_security_group.ec2_jenkins_port_8080.id
}



output "ssh_connection_string_for_ec2" {
  value = format("%s%s", "ssh -i /Users/rahulwagh/.ssh/aws_ec2_terraform ubuntu@", aws_instance.jenkins_ec2_instance.public_ip)
}



output "dev_proj_1_ec2_instance_public_ip" {
  value = aws_instance.jenkins_ec2_instance.public_ip
}


output "dev_proj_1_lb_target_group_arn" {
  value = aws_lb_target_group.dev_proj_1_lb_target_group.arn 
}

