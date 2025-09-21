#!/bin/bash

echo "Destroying K3S server nodes"
qm stop 100
qm destroy 100 --purge
qm stop 101
qm destroy 101 --purge
qm stop 102
qm destroy 102 --purge

echo "Destroying K3S worker nodes"
qm stop 200
qm destroy 200 --purge
qm stop 201
qm destroy 201 --purge

echo "Destroying HAProxy load balancer nodes"
qm stop 300
qm destroy 300 --purge
qm stop 301
qm destroy 301 --purge
