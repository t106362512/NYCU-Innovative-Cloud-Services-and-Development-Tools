# #FOR DEVELOP
module "pm_tunnel" {
  source  = "flaupretre/tunnel/ssh"
  version = "1.6.1"

  target_host = "192.168.113.240"
  target_port = "8006"

  gateway_host = "140.113.220.212"
  gateway_port = "5022"
}
