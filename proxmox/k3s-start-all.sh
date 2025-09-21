#!/bin/bash

echo "Starting K3S server nodes"
qm start 100
qm start 101
qm start 102

echo "Starting K3S worker nodes"
qm start 200
qm start 201

echo "Starting HAProxy load balancer nodes"
qm start 300
qm start 301
