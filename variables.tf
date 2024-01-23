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

variable "volumes" {
  type = list(object({
    container_path = string
    host_path      = string
    read_only      = bool
  }))
  description = "Spec for mounting volumes in the container."
  default     = []
}