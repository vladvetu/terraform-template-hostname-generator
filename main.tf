terraform {
  required_version = ">= 0.12.1"

  required_providers {
    random   = ">= 2.1"
    template = ">= 2.1"
  }
}

resource "random_id" "id" {
  byte_length = var.random_id_length
}

data "template_file" "name" {
  count    = var.servers
  template = "$${prefix}-$${id}"

  vars = {
    prefix        = lower(var.prefix)
    id            = lower(var.append_unique ? "${format(var.number_id_format, count.index + 1)}-${var.external_random ? var.external_random_id : random_id.id.hex}" : format(var.number_id_format, count.index + 1))
  }
}

data "template_file" "fqdn" {
  count    = var.servers
  template = "$${name}$${domain}"

  vars = {
    name   = data.template_file.name[count.index].rendered
    domain = var.domain == "" ? "" : ".${var.domain}"
  }
}
