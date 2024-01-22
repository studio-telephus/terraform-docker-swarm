variable "image" {
  type = string
}

variable "restart" {
  type = string
}

variable "containers" {
  type = list(object({
    name         = string
    network_name = string
    ipv4_address = string
    mount_dirs   = list(string)
    environment  = map(any)
    exec         = string
    privileged   = bool
  }))
}

variable "nicparent" {
  type = string
}

variable "nicname" {
  type    = string
  default = "eth0"
}

variable "nictype" {
  type    = string
  default = "bridged"
}

variable "autostart" {
  type = bool
}

variable "exec_enabled" {
  type    = bool
  default = false
}