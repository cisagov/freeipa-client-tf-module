# The IPA client EC2 instance
resource "aws_instance" "ipa" {
  ami                         = data.aws_ami.freeipa.id
  instance_type               = var.aws_instance_type
  availability_zone           = data.aws_subnet.the_subnet.availability_zone
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids = [
    var.client_security_group_id,
  ]

  user_data_base64 = data.template_cloudinit_config.cloud_init_tasks.rendered

  tags        = var.tags
  volume_tags = var.tags
}
