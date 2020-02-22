#!/bin/sh

error() {
  echo
  echo "ERROR: $1"
  exit 1
}

echo "============== nQuake QWFWD =============="
echo "Using settings:"
[ -z "$HOSTNAME" ] && export HOSTNAME="nQuake QWFWD"; echo " * HOSTNAME=$HOSTNAME"
echo

echo -n "Generating configuration files..."
envsubst < /qwfwd/qwfwd.cfg.template > /qwfwd/qwfwd.cfg || error "Could not generate configuration files"
touch /qwfwd/qwfwd_listip.cfg
echo "OK"

echo
echo "Initialization complete!"
echo

echo -n "============= Starting QWFWD ============="
cd /qwfwd
./qwfwd.bin 30000 || error "Could not start QWFWD"
