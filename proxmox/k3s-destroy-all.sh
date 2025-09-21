#!/bin/bash

echo "Destroying K3S server nodes"
qm destroy 100 --purge
qm destroy 101 --purge
qm destroy 102 --purge

echo "Destroying K3S worker nodes"
qm destroy 200 --purge
qm destroy 201 --purge

echo "Destroying HAProxy load balancer nodes"
qm destroy 300 --purge
qm destroy 301 --purge
