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
  type    = list(string)
  default = []
}

variable "environment" {
  type    = map(any)
  default = {}
}

variable "exec" {
  type    = string
  default = null
}

variable "privileged" {
  type    = bool
  default = false
}

variable "entrypoint" {
  type    = list(string)
  default = []
}

variable "exec_enabled" {
  type    = bool
  default = false
}

variable "volumes" {
  type        = list(any)
  description = "Spec for mounting volumes in the container."
  default     = []
}