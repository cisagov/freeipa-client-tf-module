# freeipa-client-tf-module #

[![Build Status](https://travis-ci.com/cisagov/freeipa-client-tf-module.svg?branch=develop)](https://travis-ci.com/cisagov/freeipa-client-tf-module)

A Terraform module for deploying a FreeIPA client into a subnet.

## Usage ##

```hcl
module "ipa" {
  source = "github.com/cisagov/freeipa-client-tf-module"

  domain               = "example.com"
  hostname             = "ipa.example.com"
  realm                = "EXAMPLE.COM"
  subnet_id            = aws_subnet.the_subnet.id
  trusted_cidr_blocks = [
    "10.99.49.0/24",
    "10.99.52.0/24"
  ]
  associate_public_ip_address = true
  tags = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}
```

## Examples ##

* [Deploying into the default VPC](https://github.com/cisagov/freeipa-client-tf-module/tree/develop/examples/default_vpc)

## Inputs ##

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| aws_region | The AWS region to deploy into (e.g. us-east-1) | string | | yes |
| aws_availability_zone | The AWS availability zone to deploy into (e.g. a, b, c, etc.) | string | | yes |
| subnet_id | The ID of the AWS subnet to deploy into (e.g. subnet-0123456789abcdef0) | string | | yes |
| tags | Tags to apply to all AWS resources created | map(string) | `{}` | no |

## Outputs ##

| Name | Description |
|------|-------------|
| id | The EC2 instance ID |
| arn | The EC2 instance ARN |
| availability_zone | The AZ where the EC2 instance is deployed |
| private_ip | The private IP of the EC2 instance |
| subnet_id | The ID of the subnet where the EC2 instance is deployed |

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
