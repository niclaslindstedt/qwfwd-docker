#!/bin/sh

echo "Configuring QWFWD..."
envsubst < /qwfwd/qwfwd.cfg.template > /qwfwd/qwfwd.cfg

echo "Starting QWFWD"
cd /qwfwd
./qwfwd.bin $LISTEN_PORT $LISTEN_IP
