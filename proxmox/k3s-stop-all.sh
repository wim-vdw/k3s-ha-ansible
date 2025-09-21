#!/bin/bash

echo "Stopping K3s server nodes"
qm stop 100
qm stop 101
qm stop 102

echo "Stopping K3s worker nodes"
qm stop 200
qm stop 201

echo "Stopping HAProxy load balancer nodes"
qm stop 300
qm stop 301
