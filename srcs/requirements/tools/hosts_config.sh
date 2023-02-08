#!/bin/bash
TEXT="127.0.0.1 dmoreira.42.fr"
if cat /etc/hosts | grep -q "dmoreira.42.fr";
    then echo "hosts_config.sh: No file changes /etc/hosts";
    else echo $TEXT >> /etc/hosts;
fi