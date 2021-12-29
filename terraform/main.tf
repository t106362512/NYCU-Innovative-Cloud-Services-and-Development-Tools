resource "proxmox_vm_qemu" "cloudinit" {
  name        = var.INSTANCE_NAME
  desc        = "APS(${var.INSTANCE_IP}) for using terraform and cloudinit"
  target_node = "p2"
  clone       = "Ubuntu2004-agent"
  agent       = 1
  os_type     = "cloud-init"
  cores       = 2
  sockets     = 1
  vcpus       = 0
  cpu         = "host"
  memory      = 1024
  scsihw      = "virtio-scsi-pci"
  ipconfig0   = "ip=${var.INSTANCE_IP}/${var.INSTANCE_IP_MASK},gw=${var.INSTANCE_GATEWAY}"
  ciuser      = var.INSTANCE_USERNAME
  sshkeys     = var.INSTANCE_PUBLICK_KEY

  disk {
    size     = "31948M"
    type     = "scsi"
    storage  = "local-zfs"
    iothread = 1
    ssd      = 1
    discard  = "on"
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
    tag    = 114
  }

  connection {
    type        = "ssh"
    host        = self.ssh_host
    user        = var.INSTANCE_USERNAME
    private_key = file(var.INSTANCE_PRIVATE_KEY_PATH)

    # user        = self.ssh_user
    # private_key = self.ssh_private_key

    # #FOR DEVELOP
    # bastion_host        = "140.113.220.212"
    # bastion_port        = 5022
    # bastion_user        = "ccw"
    # bastion_private_key = file(pathexpand("~/.ssh/id_rsa"))
  }

  provisioner "remote-exec" {
    inline = [
      "systemd-machine-id-setup"
    ]
  }
}

resource "null_resource" "ansible" {
  depends_on = [resource.proxmox_vm_qemu.cloudinit]
  triggers = {
    build_number = timestamp()
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i ${resource.proxmox_vm_qemu.cloudinit.ssh_host}, ../ansible/setup-application.yml"
  }
}

