#!/bin/bash
jq -n --arg un "$(id -un)" '{"name": $un}'
