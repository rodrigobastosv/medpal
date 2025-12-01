#!/bin/bash

set -o errexit
set -o nounset

echo -e "\n\n> Checking Spelling"

cspell --no-progress --show-suggestions --show-context "**/*.{dart,md,txt,yaml}"
