#!/bin/sh

echo "Configuring QWFWD"
envsubst < /qwfwd/qwfwd.cfg.template > /qwfwd/qwfwd.cfg

echo "Starting nQuake"
cd /qwfwd
./qwfwd.bin
