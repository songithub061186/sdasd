
vpc_cidr             = "11.0.0.0/16"
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet  = ["11.0.3.0/24", "11.0.4.0/24"]
eu_availability_zone = ["us-east-1a", "us-east-1b"]
vpc_id               = "dev_proj_1_vpc_eu_central_1.id"
ec2_sg_name          = "Ec2_security_group"
ec2_jenkins_sg_name  = "Jenkins_security_group"
ami_id                    = "ami-005fc0f236362e99f"
instance_type             = "t2.micro"
tag_name                  = "Jenkins:Ubuntu Linux EC2"
public_key                = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDy5kaxc6fm66Irs6gRXTni077W0sXMqGYEnWBWL3lyi"
subnet_id                 = "aws_subnet.dev_proj_1_public_subnets.id"
sg_for_jenkins            = ["sg_ec2_sg_ssh_http_id", "sg_ec2_jenkins_port_8080"]
enable_public_ip_address  = true

user_data_install_jenkins = <<EOF
#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install openjdk-21-jdk -y

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null


sudo apt-get update -y
sudo apt-get install jenkins -y

sleep 30
echo "Waiting for 30 seconds before installing the Terraform..."
wget https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_386.zip
yes | sudo apt-get install unzip
unzip 'terraform*.zip'
sudo mv terraform /usr/local/bin/

EOF


#TARGET GROUP

lb_target_group_name     = "jenkins-lb-target-group"
lb_target_group_port     = 8080
lb_target_group_protocol = "HTTP"
ec2_instance_id = "jenkins_ec2_instance"


















/*sudo apt-get update
yes | sudo apt install openjdk-11-jdk-headless
echo "Waiting for 30 seconds before installing the jenkins package..."
sleep 30
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
yes | sudo apt-get install jenkins
sleep 30
echo "Waiting for 30 seconds before installing the Terraform..."
wget https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_386.zip
yes | sudo apt-get install unzip
unzip 'terraform*.zip'
sudo mv terraform /usr/local/bin/
=======
vpc_cidr             = "11.0.0.0/16"
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
cidr_private_subnet  = ["11.0.3.0/24", "11.0.4.0/24"]
eu_availability_zone = ["us-east-1a", "us-east-1b"]
vpc_id               = "dev_proj_1_vpc_eu_central_1.id"
ec2_sg_name          = "Ec2_security_group"
ec2_jenkins_sg_name  = "Jenkins_security_group"
ami_id                    = "ami-005fc0f236362e99f"
instance_type             = "t2.micro"
tag_name                  = "Jenkins:Ubuntu Linux EC2"
public_key                = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDy5kaxc6fm66Irs6gRXTni077W0sXMqGYEnWBWL3lyi"
subnet_id                 = "aws_subnet.dev_proj_1_public_subnets.id"
sg_for_jenkins            = ["sg_ec2_sg_ssh_http_id", "sg_ec2_jenkins_port_8080"]
enable_public_ip_address  = true

user_data_install_jenkins = <<EOF
#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install openjdk-21-jdk -y

sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null


sudo apt-get update -y
sudo apt-get install jenkins -y

sleep 30
echo "Waiting for 30 seconds before installing the Terraform..."
wget https://releases.hashicorp.com/terraform/1.9.8/terraform_1.9.8_linux_386.zip
yes | sudo apt-get install unzip
unzip 'terraform*.zip'
sudo mv terraform /usr/local/bin/

EOF


/*sudo apt-get update
yes | sudo apt install openjdk-11-jdk-headless
echo "Waiting for 30 seconds before installing the jenkins package..."
sleep 30
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
yes | sudo apt-get install jenkins
sleep 30
echo "Waiting for 30 seconds before installing the Terraform..."
wget https://releases.hashicorp.com/terraform/1.6.5/terraform_1.6.5_linux_386.zip
yes | sudo apt-get install unzip
unzip 'terraform*.zip'
sudo mv terraform /usr/local/bin/
>>>>>>> f7aefec7796844488ff78233f49ca266528f4ccb
*/