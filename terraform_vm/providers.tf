terraform {
  required_providers {
    template = {
      version = "2.2.0"
    }
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

#provider "template" {
#  version = "2.2.0"
#}
