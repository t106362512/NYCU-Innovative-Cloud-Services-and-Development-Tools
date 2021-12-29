variable "PM_USERNAME" {
  default = "Cloud-class@pve"
}

variable "PM_PASSWORD" {
  default   = ""
  sensitive = true
}

variable "INSTANCE_NAME" {
  default = "terraform"
}

variable "INSTANCE_USERNAME" {
  default = "ansible"
}

variable "INSTANCE_PUBLICK_KEY" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCfzPAUj0icQ2ayiH8BoSHZtkBqptb3QFSxRe3mWM6kkR2zQu84QVi6sM5fv8rHWJnJ5IBhnQJ3fRCHWr4S5fZ4wqmD6RdaemfXHEaCWF48/rVQOQk+/udk4x8eprAmmiUTUWl9Nl9WqSjUIdDd8pBsWtRunJheRyfMqy3UZZdvgR4LBVzwLD24/d+2OBa9yAk6DQU2LjBtB/cWdcppItU0qeFeadD6t4v48fEUBL2oiGXrstglYBx9z5DX01VFrzQUU1l7tfQNjGyzXun+fjP8FLPYopsYigt1CaWkOgfAmTXHssfpKFdHRnO2qELG05wTKc+ezyMETzlTusqmj9ppw7IJmG/GNqxq3iE7hsw2Yfqgf3l9slgh2NSwu7t/8Y605SIGKPXiYlWd8Bg9mkLdiJ5t3ML8B6d8y+ONsZ82PzmXD/YgIwxYWkJ/xq/f7yanpguJgSfO1obdqoMIXuMy/QhX/WuONM5UY3kUdMK/2AjzcPP4xdtyi1GNY3CQW98= ansible@terraform"
}

variable "INSTANCE_PRIVATE_KEY_PATH" {
  default = "../keys/ansible-key"
}

variable "INSTANCE_IP" {
  default = "192.168.114.50"
}


variable "INSTANCE_IP_MASK" {
  default = "24"
}

variable "INSTANCE_GATEWAY" {
  default = "192.168.114.1"
}
