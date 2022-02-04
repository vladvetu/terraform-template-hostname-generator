variable "prefix" {
  type = string

  description = <<-EOT
    Required.
    Prefix of server name.
  EOT
}

variable "domain" {
  type = string

  default = ""

  description = <<-EOT
    Added to the fqdn when generating.
  EOT
}

variable "servers" {
  type = number

  default = 0

  description = <<-EOT
    Number of names to generate.
  EOT
}

variable "append_unique" {
  type = bool

  default = true

  description = <<-EOT
    Append unique identifier to names.
    If `false`, numbers used as server ID.
  EOT
}

variable "external_random" {
  type = bool

  default = false

  description = <<-EOT
    Use external random for server name.
    If `false`, a new random will be generated as server ID.
  EOT
}


variable "external_random_id" {
  type = string

  description = <<-EOT
    Provide external random to be used.
    Used in conjunction with `external_random true`
  EOT
}

variable random_id_length {
  type        = number
  default     = 3
  description = "description"
}

variable "number_id_format" {
  type = string

  default = "%02d"

  description = <<-EOT
    Format of numbered server's id.
    Server instance will prepend wathever random used.
  EOT
}
