#!/bin/bash

set -e

vagrant up --provider virtualbox
vagrant destroy -f
