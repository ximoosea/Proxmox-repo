#!/bin/bash

# 1. Define paths
SOURCE_DIR="/etc/pve/lxc"
DEST_DIR="/root/infra-repo/proxmox-configs"
NAS_IP="192.168.10.101"
NAS_PATH="/volume1/NetBackup/ProxmoxConfigs"

# 2. Create local backup folder if missing
mkdir -p $DEST_DIR

# 3. Copy Proxmox LXC configs to our repo folder
cp $SOURCE_DIR/*.conf $DEST_DIR/
cp /etc/network/interfaces $DEST_DIR/interfaces.backup

# 4. Set permissions
chmod 644 $DEST_DIR/*

echo "Local backup complete in /root/infra-repo/proxmox-configs"

# 5. Push to Synology using the symesAdmin account on port 2222
scp -P 2222 -O -r $DEST_DIR/* symesAdmin@$NAS_IP:$NAS_PATH
