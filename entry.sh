#! /bin/sh

echo "$AUTHORIZED_KEYS" > /authorized_keys

exec "$@"
