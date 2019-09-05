# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "admin_pw" {
  description = "The password for the Kerberos admin role"
}

variable "client_security_group_id" {
  description = "The ID for the IPA client security group (e.g. sg-0123456789abcdef0)"
}

variable "domain" {
  description = "The domain for the IPA client (e.g. example.com)"
}

variable "hostname" {
  description = "The hostname of this IPA client (e.g. client.example.com)"
}

variable "realm" {
  description = "The realm for the IPA client (e.g. EXAMPLE.COM)"
}

variable "subnet_id" {
  description = "The ID of the AWS subnet into which to deploy this IPA client (e.g. subnet-0123456789abcdef0)"
}

# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults, or their requirement is
# dependent on the values of the other parameters.
# ------------------------------------------------------------------------------

variable "ami_owner_account_id" {
  description = "The ID of the AWS account that owns the FreeIPA client AMI"
  default     = "344440683180" # CISA NCATS CyHy production (Raytheon) account
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether or not to associate a public IP address with the IPA client"
  default     = false
}

variable "aws_instance_type" {
  description = "The AWS instance type to deploy (e.g. t3.medium)"
  default     = "t3.medium"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created"
  default     = {}
}
