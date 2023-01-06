#!/bin/bash

packer build -var-file=variables.hcl gce-ubuntu-packer.pkr.hcl
