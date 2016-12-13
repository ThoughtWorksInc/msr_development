#!/bin/bash
set -e

source scripts/vagrant_setup.sh
source scripts/repo_setup.sh

init_vagrant
clone_repos repositories.txt
