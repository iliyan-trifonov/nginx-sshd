#!/bin/bash
echo "Showing the container's ip:"
ip addr show | grep 'eth0'
echo "Starting sshd:"
/usr/sbin/sshd
echo "Starting nginx in non daemon mode:"
/usr/sbin/nginx
echo "Ready!"
