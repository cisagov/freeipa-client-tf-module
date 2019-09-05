#!/usr/bin/env bash

# Input variables are:
# admin_pw - the password for the IPA server's Kerberos admin role
# domain - the domain for the IPA server (e.g. example.com)
# hostname - the hostname of this IPA client (e.g. client.example.com)
# realm - the realm for the IPA server (e.g. EXAMPLE.COM)

set -o nounset
set -o errexit
set -o pipefail

# There are several items below that look like shell variables but are
# actually replaced by the Terraform templating engine.  Hence we can
# ignore the "undefined variable" warnings from shellcheck.
#
# shellcheck disable=SC2154
ipa-client-install --domain="${domain}" \
                   --realm="${realm}" \
                   --principal=admin \
                   --password="${admin_pw}" \
                   --mkhomedir \
                   --hostname="${hostname}" \
                   --no-ntp \
                   --unattended
