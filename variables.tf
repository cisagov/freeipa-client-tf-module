# ------------------------------------------------------------------------------
# Required parameters
#
# You must provide a value for each of these parameters.
# ------------------------------------------------------------------------------

variable "admin_pw" {
  description = "The password for the Kerberos admin role."
}

variable "client_security_group_id" {
  description = "The ID for the IPA client security group (e.g. sg-0123456789abcdef0)."
}

variable "hostname" {
  description = "The hostname of this IPA client (e.g. client.example.com)."
}

variable "private_reverse_zone_id" {
  description = "The zone ID corresponding to the private Route53 reverse zone where the PTR records related to this IPA client should be created (e.g. ZKX36JXQ8W82L)."
}

variable "private_zone_id" {
  description = "The zone ID corresponding to the private Route53 zone where the Kerberos-related DNS records should be created (e.g. ZKX36JXQ8W82L)."
}

variable "realm" {
  description = "The realm for the IPA client (e.g. EXAMPLE.COM)."
}

variable "subnet_id" {
  description = "The ID of the AWS subnet into which to deploy this IPA client (e.g. subnet-0123456789abcdef0)."
}

# ------------------------------------------------------------------------------
# Optional parameters
#
# These parameters have reasonable defaults, or their requirement is
# dependent on the values of the other parameters.
# ------------------------------------------------------------------------------

variable "ami_owner_account_id" {
  description = "The ID of the AWS account that owns the FreeIPA client AMI, or \"self\" if the AMI is owned by the same account as the provisioner."
  default     = "self"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "Whether or not to associate a public IP address with the IPA client."
  default     = false
}

variable "aws_instance_type" {
  description = "The AWS instance type to deploy (e.g. t3.medium)."
  default     = "t3.medium"
}

variable "public_zone_id" {
  description = "The zone ID corresponding to the public Route53 zone where the Kerberos-related DNS records should be created (e.g. ZKX36JXQ8W82L).  Only required if a public IP address is associated with the IPA client (i.e. if associate_public_ip_address is true)."
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AWS resources created."
  default     = {}
}

variable "ttl" {
  description = "The TTL value to use for Route53 DNS records (e.g. 86400).  A smaller value may be useful when the DNS records are changing often, for example when testing."
  default     = 86400
}
