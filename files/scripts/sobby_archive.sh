#!/bin/bash

[ -d /var/sobby/backup ] || mkdir -p /var/sobby/backup
chmod og-rwx /var/sobby/backup -R

for sobby_instance in `ls -1 /etc/sobby/*.conf`; do
    instance_file=`basename $sobby_instance`
    instance_name=`echo $instance_file | sed s/\.conf$//`
    [ -d /var/sobby/backup/${instance_name} ] || mkdir -p /var/sobby/backup/${instance_name}
    cp /var/sobby/servers/${instance_name}/session /var/sobby/backup/${instance_name}/session-`date +%Y-%m-%d-%H-%M` 
    /usr/sbin/tmpwatch 72 /var/sobby/backup/${instance_name}/
done
