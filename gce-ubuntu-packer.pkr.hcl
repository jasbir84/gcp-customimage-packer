variable "project_id" {
  type = string
}

variable "zone" {
  type = string
}

variable "version" {
  type = string
}

variable "source_image" {
  type = string
}

source "googlecompute" "ubuntu-custom-image" {
  instance_name               = "packer-build-vm-001"
  image_name                  = "ubuntu-20-${var.version}"
  project_id                  = var.project_id
  source_image                = var.source_image
  zone                        = var.zone
  image_description           = "Created with Packer"
  image_storage_locations     = ["asia-southeast1"]
  ssh_username                = "root"
  tags                        = ["packer"]
  network                     = "default"
  subnetwork                  = "default"
  use_internal_ip             = true
  #omit_external_ip            = true
  use_iap                     = true
}

build {
  sources = ["sources.googlecompute.ubuntu-custom-image"]

  provisioner "shell" {
    script = "scripts/setup.bash"
  }  
}
