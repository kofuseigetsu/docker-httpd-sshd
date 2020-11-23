#!/bin/sh
set -e

echo $0 start.

# configure
if [ -n "${ROOT_PASSWORD}" ]; then
  echo "root:${ROOT_PASSWORD}" | chpasswd
fi

# start sshd
sed -i "s/SSH_PORT/$SSH_PORT/g" /etc/ssh/sshd_config
ssh_setup.sh
/usr/sbin/sshd

echo $0 end.

# exec cmd
exec "$@"
