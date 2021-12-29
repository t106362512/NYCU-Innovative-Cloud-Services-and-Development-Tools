terraform {
  backend "http" {
    address        = "http://gl-cloud.mylabs.space/api/v4/projects/4/terraform/state/terraform-tfstate"
    lock_address   = "http://gl-cloud.mylabs.space/api/v4/projects/4/terraform/state/terraform-tfstate/lock"
    unlock_address = "http://gl-cloud.mylabs.space/api/v4/projects/4/terraform/state/terraform-tfstate/lock"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_min = 5
  }
}
