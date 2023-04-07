locals {
  date = formatdate("HHmm", timestamp())
}

source "azure-arm" "ubuntu-arm-lts" {
  subscription_id      = var.azure_subscription_id
  use_interactive_auth = true
  os_type              = "Linux"
  image_offer          = "0001-com-ubuntu-server-jammy"
  image_publisher      = "canonical"
  image_sku            = "22_04-lts-arm64"

  vm_size        = "Standard_D4ps_v5"
  ssh_username   = "ubuntu"
  ssh_agent_auth = false

  azure_tags = {
    dept = "JenkinsOSS"
    task = "Image deployment"
  }
}

build {
  source "source.azure-arm.ubuntu-arm-lts" {
    location                          = var.azure_region
    managed_image_name                = "jenkins_test_ARM64_${local.date}"
    managed_image_resource_group_name = "dev-packer-images"
  }
}
