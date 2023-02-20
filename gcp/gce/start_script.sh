#!/bin/bash
apt update
apt -y install apache2
echo "Hello World from $(hostname) $(hostname -i)" > /var/www/html/index.html