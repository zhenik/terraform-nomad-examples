locals {
  datacenters = join(",", var.nomad_datacenters)
}

data "template_file" "nomad-job-template-countdash" {

  template = file("${path.module}/conf/nomad/countdash.hcl")

  vars = {
    datacenters  = local.datacenters
    namespace    = var.nomad_namespace
    image        = var.container_image
    service_name = var.service_name
  }
}

resource "nomad_job" "nomad-job-minio" {
  jobspec = data.template_file.nomad-job-template-countdash.rendered
  detach  = false
}
