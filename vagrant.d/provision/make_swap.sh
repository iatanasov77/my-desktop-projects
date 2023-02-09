#!/bin/bash

if [ ! -f '/var/swap.1' ]; then
	echo "Setting Swap with size ${SWAP_SIZE}"
    /bin/dd if=/dev/zero of=/var/swap.1 bs=1G count=${SWAP_SIZE}
	/sbin/mkswap /var/swap.1
	/sbin/swapon /var/swap.1
fi
