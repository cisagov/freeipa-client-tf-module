# Launch an IPA master and an IPA replica into a VPC #

## Usage ##

To run this example you need to execute the `terraform init` command
followed by the `terraform apply` command.

Note that this example may create resources which cost money. Run
`terraform destroy` when you no longer need these resources.

## Outputs ##

| Name | Description |
|------|-------------|
| ipa_server_security_group | The IPA server security group. |
| master | The IPA master EC2 instance. |
| replica | The IPA replica EC2 instance. |
