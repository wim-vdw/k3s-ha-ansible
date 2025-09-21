#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <path_to_id_rsa.pub>"
  exit 1
fi

PUBKEY="$1"

qm clone 9000 100 --name k3s-server-01
qm resize 100 scsi0 32G
qm set 100 --net0 virtio,bridge=vmbr0,macaddr=BC:24:11:66:6F:07
qm set 100 --cpu host
qm set 100 --memory 4096
qm set 100 --cores 2
qm set 100 --ciuser wim
qm set 100 --sshkey "$PUBKEY"
qm set 100 --ciupgrade 1
qm set 100 --ipconfig0 ip=dhcp

qm clone 9000 101 --name k3s-server-02
qm resize 101 scsi0 32G
qm set 101 --net0 virtio,bridge=vmbr0,macaddr=BC:24:11:02:57:C8
qm set 101 --cpu host
qm set 101 --memory 4096
qm set 101 --cores 2
qm set 101 --ciuser wim
qm set 101 --sshkey "$PUBKEY"
qm set 101 --ciupgrade 1
qm set 101 --ipconfig0 ip=dhcp

qm clone 9000 102 --name k3s-server-03
qm resize 102 scsi0 32G
qm set 102 --net0 virtio,bridge=vmbr0,macaddr=BC:24:11:4F:A3:86
qm set 102 --cpu host
qm set 102 --memory 4096
qm set 102 --cores 2
qm set 102 --ciuser wim
qm set 102 --sshkey "$PUBKEY"
qm set 102 --ciupgrade 1
qm set 102 --ipconfig0 ip=dhcp

qm clone 9000 200 --name k3s-worker-01
qm resize 200 scsi0 32G
qm set 200 --net0 virtio,bridge=vmbr0,macaddr=BC:24:11:12:B1:D2
qm set 200 --cpu host
qm set 200 --memory 8192
qm set 200 --cores 4
qm set 200 --ciuser wim
qm set 200 --sshkey "$PUBKEY"
qm set 200 --ciupgrade 1
qm set 200 --ipconfig0 ip=dhcp

qm clone 9000 201 --name k3s-worker-02
qm resize 201 scsi0 32G
qm set 201 --net0 virtio,bridge=vmbr0,macaddr=BC:24:11:07:BA:1A
qm set 201 --cpu host
qm set 201 --memory 8192
qm set 201 --cores 4
qm set 201 --ciuser wim
qm set 201 --sshkey "$PUBKEY"
qm set 201 --ciupgrade 1
qm set 201 --ipconfig0 ip=dhcp

qm clone 9000 300 --name k3s-lb-01
qm resize 300 scsi0 32G
qm set 300 --net0 virtio,bridge=vmbr0,macaddr=BC:24:11:EA:6D:1F
qm set 300 --cpu host
qm set 300 --memory 2048
qm set 300 --cores 1
qm set 300 --ciuser wim
qm set 300 --sshkey "$PUBKEY"
qm set 300 --ciupgrade 1
qm set 300 --ipconfig0 ip=dhcp

qm clone 9000 301 --name k3s-lb-02
qm resize 301 scsi0 32G
qm set 301 --net0 virtio,bridge=vmbr0,macaddr=BC:24:11:6B:DC:F9
qm set 301 --cpu host
qm set 301 --memory 2048
qm set 301 --cores 1
qm set 301 --ciuser wim
qm set 301 --sshkey "$PUBKEY"
qm set 301 --ciupgrade 1
qm set 301 --ipconfig0 ip=dhcp
