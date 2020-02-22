output "ipa_server_security_group" {
  value       = module.ipa_master.server_security_group
  description = "The IPA server security group."
}

output "master" {
  value       = module.ipa_master
  description = "The IPA master EC2 instance."
}

output "client" {
  value       = module.ipa_client1
  description = "The IPA client EC2 instance."
}
