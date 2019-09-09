# freeipa-client-tf-module #

[![Build Status](https://travis-ci.com/cisagov/freeipa-client-tf-module.svg?branch=develop)](https://travis-ci.com/cisagov/freeipa-client-tf-module)

A Terraform module for deploying a FreeIPA client into a subnet.

## Usage ##

```hcl
module "ipa" {
  source = "github.com/cisagov/freeipa-client-tf-module"
  
  providers = {
    aws     = "aws"
    aws.dns = "aws"
  }

  admin_pw                    = "thepassword"
  associate_public_ip_address = true
  client_security_group_id    = aws.aws_security_group.client_sg.id
  domain                      = "example.com"
  hostname                    = "client1.example.com"
  private_reverse_zone_id     = aws_route53_zone.client_private_reverse_zone.zone_id
  private_zone_id             = aws_route53_zone.private_zone.zone_id
  public_zone_id              = data.aws_route53_zone.public_zone.zone_id
  realm                       = "EXAMPLE.COM"
  subnet_id                   = aws_subnet.client_subnet.id
  tags = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
  ttl = 60
}
```

## Examples ##

* [Basic usage](https://github.com/cisagov/freeipa-client-tf-module/tree/develop/examples/basic_usage)

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| ami_owner_account_id | The ID of the AWS account that owns the FreeIPA client AMI | string | `344440683180` | no |
| admin_pw | The admin password for the Kerberos admin role | string | | yes |
| associate_public_ip_address | Whether or not to associate a public IP address with the IPA client | bool | `false` | no |
| aws_instance_type | The AWS instance type to deploy (e.g. t3.medium). | string | `t3.medium` | no |
| client_security_group_id | The ID for the IPA client security group (e.g. sg-0123456789abcdef0) | string | | yes |
| domain | The domain for the IPA client (e.g. example.com) | string | | yes |
| hostname | The hostname of this IPA client (e.g. `client.example.com`) | string | | yes |
| private_reverse_zone_id | The zone ID corresponding to the private Route53 reverse zone where the PTR records related to this IPA client should be created (e.g. `ZKX36JXQ8W82L`) | string | | yes |
| private_zone_id | The zone ID corresponding to the private Route53 zone where the Kerberos-related DNS records should be created (e.g. `ZKX36JXQ8W82L`) | string | | yes |
| public_zone_id | The zone ID corresponding to the public Route53 zone where the Kerberos-related DNS records should be created (e.g. `ZKX36JXQ8W82L`).  Only required if a public IP address is associated with the IPA client (i.e. if associate_public_ip_address is true). | string | Empty string | no |
| subnet_id | The ID of the AWS subnet into which to deploy this IPA client (e.g. `subnet-0123456789abcdef0`) | string | | yes |
| tags | Tags to apply to all AWS resources created | map(string) | `{}` | no |
| ttl | The TTL value to use for Route53 DNS records (e.g. 86400).  A smaller value may be useful when the DNS records are changing often, for example when testing. | string | `86400` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| id | The EC2 instance ID corresponding to the IPA client |

## Contributing ##

We welcome contributions!  Please see [here](CONTRIBUTING.md) for
details.

## License ##

This project is in the worldwide [public domain](LICENSE).

This project is in the public domain within the United States, and
copyright and related rights in the work worldwide are waived through
the [CC0 1.0 Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/).

All contributions to this project will be released under the CC0
dedication. By submitting a pull request, you are agreeing to comply
with this waiver of copyright interest.
