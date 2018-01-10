#!/bin/sh

if [ ! "$#" -ge 1 ]; then
    echo "Usage: $0 {size}"
    echo "(Default path: /var/lib/swap)"
    printf '%s\n' "$@"

	echo "---------------------------------------"
	echo "Available options:"
	printf '%s\n' "$@"
	echo "size - Size of swap ( Example - 1G,2G or 1024M)"
	echo "path - Path to create a swapfile"
    exit 1
fi

SWAP_SIZE=$1

SWAP_FILE="/var/lib/swap"
if [ ! -z "$2" ]; then
    SWAP_PATH=$2
fi


# Checking if swap already exists in ./etc/fstab
grep -q "swap" /etc/fstab
if [ $? -ne 0 ]; then
	sudo fallocate -l $SWAP_SIZE $SWAP_FILE
	sudo chmod 600 $SWAP_FILE
	sudo mkswap $SWAP_FILE
	sudo swapon $SWAP_FILE	
	echo "$SWAP_FILE   none    swap    sw    0   0" | sudo tee /etc/fstab -a
else
	echo 'swapfile found. No changes made.'
fi

echo '----------------------'
echo 'Checking list of swap'
echo '----------------------'
swapon --show

