data vsphere_datacenter dc {
  name = var.vsphere_datacenter
}

data vsphere_datastore vm_datastore {
  name          = var.vsphere_vm_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data vsphere_datastore iso_datastore {
  name          = var.vsphere_iso_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data vsphere_resource_pool pool {}

data vsphere_network vm {
  name          = var.vsphere_vm_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data template_file rancher_cloud_config {
  template = file("${path.module}/templates/cloud_config.yml.tpl")

  vars = {
    rancher_hostname     = var.rancher_hostname
    rancher_domain       = var.rancher_domain
    nfs_server_ipv4      = var.nfs_server_ipv4
    nfs_mount            = var.nfs_mount
    docker_registry      = var.docker_registry
    dns_servers          = join(",", var.dns_servers)
    cloudflare_api_email = var.cloudflare_api_email
    cloudflare_api_key   = var.cloudflare_api_key
  }
}