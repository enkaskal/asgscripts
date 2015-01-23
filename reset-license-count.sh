#!/usr/bin/env bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

CC=/usr/local/bin/confd-client.plx

echo -e "RAW\nset([],'licensing','active_ips')"  | ${CC} -batch
${CC} set licensing user_limit_exceeded 0
