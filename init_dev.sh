#!/bin/bash
set -e

source scripts/mongo_setup.sh
source scripts/vagrant_setup.sh
source scripts/repo_setup.sh

init_vagrant
clone_repos repositories.txt