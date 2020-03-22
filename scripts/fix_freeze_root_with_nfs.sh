#!/usr/bin/env bash
set -e

for MNT_PATH in $(findmnt --types nfs4 --output "target" --noheadings --raw); do
    if [ -z "$MNT_PATH" ]; then
        continue;
    fi

    ADDR=$(findmnt --target "$MNT_PATH" --noheadings --output "options" --raw \
        | grep -Eo ',addr=[0-9]+(.[0-9]+)*' \
        | grep -Eo '[0-9]+(.[0-9]+)*') || true

    if [ -z "$ADDR" ]; then
        # If mount point isn't NFS share
        continue;
    fi
    # Check if the server is reachable
    timeout 1 bash -c ": < /dev/tcp/${ADDR}/2049" || {
        echo "UnReachible $MNT_PATH"
        umount -f -l "$MNT_PATH"
    }
done
