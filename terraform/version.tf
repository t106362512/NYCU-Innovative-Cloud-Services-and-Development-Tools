terraform {
  required_version = ">= 1.1.1"
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "2.9.3"
    }
  }
}
