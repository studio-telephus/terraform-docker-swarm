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
    entrypoint   = list(string)
  }))
}

variable "exec_enabled" {
  type    = bool
  default = false
}