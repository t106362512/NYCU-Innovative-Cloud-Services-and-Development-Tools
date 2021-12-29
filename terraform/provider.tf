provider "proxmox" {
  pm_api_url      = "https://192.168.113.240:8006/api2/json"
  pm_user         = var.PM_USERNAME
  pm_password     = var.PM_PASSWORD
  pm_tls_insecure = true

  # #FOR DEVELOP
  # pm_api_url      = "https://${module.pm_tunnel.host}:${module.pm_tunnel.port}/api2/json"
  # pm_debug = true
  # pm_log_enable = true
  # pm_log_file   = "terraform-plugin-proxmox.log"
  # pm_log_levels = {
  #   _default    = "debug"
  #   _capturelog = ""
  # }
}
