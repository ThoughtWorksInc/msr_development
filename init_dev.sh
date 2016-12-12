#!/bin/bash
set -e

source scripts/vagrant_setup.sh
source scripts/repo_setup.sh

docker run --name mongo -p 27017:27017 -d mongo:latest

init_vagrant
clone_repos repositories.txt
