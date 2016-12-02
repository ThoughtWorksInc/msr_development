#!/bin/bash

vagrant_version=$(vagrant -v | grep -Eo "\d+\.\d+")                                                                                     
if [[ "$vagrant_version" != "1.9" ]]; then                                                                                                                                       
    echo "current Vagrant version is: $vagrant_version. Upgrade vagrant to 1.9"                                                                                                                               
    exit -1
fi         

#TODO clone to repos