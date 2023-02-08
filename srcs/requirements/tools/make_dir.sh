#!/bin/bash

if [ ! -d "/home/$USER/data" ]; then
    mkdir ~/data
    mkdir ~/data/wordpress
    mkdir ~/data/mariadb
fi