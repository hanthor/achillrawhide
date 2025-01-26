#!/bin/bash

set -xeuo pipefail

# This is a bucket list. We want to not have anything in this file at all.

# See https://github.com/centos-workstation/achillobator/issues/3
mkdir -p /var/roothome
chmod 0700 /var/roothome

# Fast track https://gitlab.com/fedora/bootc/base-images/-/merge_requests/71
ln -sf /run /var/run

# Necessary so that the alternatives command works and some ld.(whatever) variants work
mkdir -p /var/lib/alternatives

# Enable the same compose repos during our build that the centos-bootc image
# uses during its build.  This avoids downgrading packages in the image that
# have strict NVR requirements.
# dnf config-manager --set-enabled baseos-compose,appstream-compose
