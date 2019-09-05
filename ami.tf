# ------------------------------------------------------------------------------
# Automatically look up the latest pre-built FreeIPA AMI from
# cisagov/freeipa-client-packer.
#
# NOTE: This Terraform data source must return at least one AMI result
# or the apply will fail.
# ------------------------------------------------------------------------------

# The AMI from cisagov/freeipa-client-packer
data "aws_ami" "freeipa" {
  filter {
    name = "name"
    values = [
      "freeipa-client-hvm-*-x86_64-ebs",
    ]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  # This is the CyHy production (Raytheon) account
  owners      = [var.ami_owner_account_id]
  most_recent = true
}
