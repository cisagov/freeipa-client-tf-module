output "ipa_server_security_group_id" {
  value       = module.ipa_master.server_security_group_id
  description = "The ID corresponding to the IPA server security group"
}

output "master_id" {
  value       = module.ipa_master.id
  description = "The EC2 instance ID corresponding to the IPA master"
}

output "client_id" {
  value       = module.ipa_client1.id
  description = "The EC2 instance ID corresponding to the IPA client"
}
