#!/bin/sh

external_ip=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com | awk -F'"' '{ print $2}')
[ "$ADDRESS" != "$external_ip" ] && exit 1

echo "External IP has changed, please restart this container"

exit 0
