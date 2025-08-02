#!/bin/bash

clear; fastfetch --logo-type builtin --logo "$(fastfetch --list-logos | grep -oP '"[^"]+"' | sed 's/"//g' | awk 'NR % 4 == 1' | shuf -n 1)"
