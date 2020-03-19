#!/bin/bash
set -e

def=$(grep -E "design capacity:" /proc/acpi/battery/BAT0/info | grep -o -e "[0-9]\+")
last=$(grep -E 'last full capacity:' /proc/acpi/battery/BAT0/info | grep -o -e "[0-9]\+")

bc -l <<< "$last/$def"
