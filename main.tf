locals {
  env_ipv4_addresses = [for i, item in var.containers : {
    key : replace("${upper(item.name)}_IP", "-", "_"),
    value : item.ipv4_address
  }]
}

resource "null_resource" "container_environment" {
  triggers = {
    for item in local.env_ipv4_addresses :
    item.key => item.value
  }
}

module "swarm_container" {
  count      = length(var.containers)
  source     = "github.com/studio-telephus/terraform-docker-container.git?ref=main"
  name       = var.containers[count.index].name
  image      = var.image
  restart    = var.restart
  privileged = var.privileged
  entrypoint = var.entrypoint
  networks = [
    {
      name         = var.network_name
      ipv4_address = var.containers[count.index].ipv4_address
    }
  ]
  mount_dirs   = var.mount_dirs
  exec_enabled = var.exec_enabled
  exec         = var.exec
  environment = merge(
    null_resource.container_environment.triggers,
    var.environment
  )
}
