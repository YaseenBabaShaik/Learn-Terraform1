
resource "aws_instance" "web" {
  for_each = var.components
  ami           = data.aws_ami.centos8.id
  instance_type = each.value.instance_type

  tags = {
    Name = each.value.name
  }
}

resource "null_resource" "provision" {
    provisioner "remote-exec" {
     host = aws_instance.web.public_ip
           
    }]
}

data "aws_ami" "centos8" {
 most_recent  =  true
 name_regex   =  "Centos-8-DevOps-Practice"
 owners       =  ["973714476881"]
}

# output "publicip" {
#     value = aws_instance.web.*.public_ip
# }

variable "components" {
    default = {
        cart = {
            name  = "cart"
            instance_type = "t3.micro"
        }
         catalogue = {
            name  = "catalogue"
            instance_type = "t3.small"
        }
    }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls"
  }
}