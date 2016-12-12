#!/bin/bash
set -e

source scripts/vagrant_setup.sh
source scripts/repo_setup.sh

docker pull mongo:latest

init_vagrant
clone_repos repositories.txt