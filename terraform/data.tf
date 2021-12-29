# data "template_file" "inventory" {
#   template = file("${path.module}/templates/hosts.tpl")

#   vars = {
#     dns01_hostname = "nfs01.liujia.com"
#     dns01_ip       = tolist(module.ec2-nfs01.private_ip)[0]
#     key_path       = "~/.ssh/id_rsa"
#   }
# }
