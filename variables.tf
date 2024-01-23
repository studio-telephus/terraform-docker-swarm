variable "image" {
  type = string
}

variable "restart" {
  type = string
}

variable "containers" {
  type = list(object({
    name         = string
    ipv4_address = string
  }))
}

variable "network_name" {
  type = string
}

variable "mount_dirs" {
  type = list(string)
}

variable "environment" {
  type = map(any)
}

variable "exec" {
  type = string
}

variable "privileged" {
  type    = bool
  default = false
}

variable "entrypoint" {
  type = list(string)
}

variable "exec_enabled" {
  type    = bool
  default = false
}