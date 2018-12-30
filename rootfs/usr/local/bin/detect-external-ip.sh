#!/bin/sh

exec echo "$(curl -4 https://icanhazip.com 2>/dev/null)"
