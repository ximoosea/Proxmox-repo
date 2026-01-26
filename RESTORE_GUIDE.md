# Proxmox LXC Restore Guide

### Step 1: Locate the Backup
Backups are stored locally at: `/root/infra-repo/proxmox-configs/`
And remotely on Synology: `192.168.10.101:/volume1/NetBackup/ProxmoxConfigs/`

### Step 2: Restore a Config
To restore a specific LXC (e.g., ID 101), run:
`cp /root/infra-repo/proxmox-configs/101.conf /etc/pve/lxc/101.conf`

### Step 3: Network Interface Recovery
If you mess up your network bridge, the backup is here:
`cp /root/infra-repo/proxmox-configs/interfaces.backup /etc/network/interfaces`
*Note: Requires a reboot or `systemctl restart networking` to apply.*