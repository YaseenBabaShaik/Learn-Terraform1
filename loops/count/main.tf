
resource "aws_instance" "web" {
  for_each = var.components
  ami           = data.aws_ami.centos8.id
  instance_type = "t3.micro"

  tags = {
    Name = each.value.name
  }
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
         cart = {
            name  = "catalogue"
            instance_type = "t3.small"
        }
    }
}