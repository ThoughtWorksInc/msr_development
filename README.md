# Development Environment Scaffold
This repository contains scripts to initialise a new development environment using Vagrant and Docker. This ensures that
all developers have a consistent build and test configuration.

The `repositories.txt` file contains URLs for projects supported by this scaffold. When it’s initialised, the scaffold
will clone each project and add it to the virtual machine.

## Getting started
1. Clone this repository. 
2. Run `./init_dev.sh` to download Vagrant v1.9 (if you don’t already have it) and clone all of the repositories listed
in `repositories.txt`. If Vagrant was downloaded, you will need to install it and re-run the script.
3. Run `vagrant up` to start the virtual machine. This will download the required tools if you do not have them already.
4. Run `vagrant ssh` to start a shell in the virtual machine.

## Developing using the scaffold
Each cloned project will be available within the virtual machine as a subdirectory in `/var`. To keep these synchronised
with your local machine, run `vagrant rsync`. 

To build a project inside the VM:

1. Run `cd /var/<repo_name>`
2. Run `./run.sh`

File synchronisation can be automated using the `vagrant rsync-auto` command. This starts a watcher in the foreground.
However, make sure you start it only when the virtual machine is running, and terminate it before changing the state of
the VM (using `vagrant halt` or `vagrant reload`).

## Installing MySQL
You can use a script to help setup a MySQL installation. However, this requires some manual actions.

1. If you haven’t already, start the virtual machine with `vagrant up --provision` and use `vagrant ssh` to open a new shell.
2. Run `./mysql_setup.sh`.
3. When prompted to select the packages to install, accept the defaults and the use arrow keys to select the OK option and press Enter.
4. A list of packages will be downloaded. When prompted, type `Y` to accept installation of the server.
5. When prompted, leave the password blank and press Enter.
6. If the installation process was successful, you should see a message stating “MySQL Community Server 5.7.16 is running”.
