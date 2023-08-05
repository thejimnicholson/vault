#!/usr/bin/env bash
export VAULT_ADDR=http://localhost:8200
VAULT_CMD=/usr/bin/vault

sleep 10
keys=$(jq -r '.keys[]' < /etc/vault.d/keys/keys.json | shuf | head -3)
for key in $keys ; {
    result=$(vault operator unseal $key | grep "^Unseal Progress" )
    echo $result
    status=$(vault status | grep "^Sealed" | tr -s ' ' | cut -d\  -f 2)
    if [ "$status" == "false" ]; then
        echo "Unseal successful"
        break
    fi
}