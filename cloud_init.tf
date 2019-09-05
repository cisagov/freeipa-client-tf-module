# cloud-init commands for configuring a freeipa client

data "template_cloudinit_config" "cloud_init_tasks" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/x-shellscript"
    content = templatefile(
      "${path.module}/scripts/setup_freeipa.sh", {
        admin_pw = var.admin_pw
        domain   = var.domain
        hostname = var.hostname
        realm    = var.realm
    })
  }
}
