#!/bin/bash
jq -n --arg un "$(id -un)" --arg ip "$(curl ifconfig.me)" '{"name": $un, "ip": $ip}'
