#!/bin/bash

set -o errexit
set -o nounset

echo -e "\n\n> Validating Code Format"


DART_FILES=()
while IFS= read -r DART_FILE; do
  DART_FILES+=("$DART_FILE")
done < <(find lib -type f -name "*.dart" ! -name "*.g.dart" ! -name "*.gen.dart" ! -name "*.generated.dart" ! -name "*app_localizations*.dart")

TEST_FILES=()
while IFS= read -r TEST_FILE; do
  TEST_FILES+=("$TEST_FILE")
done < <(find test -type f -name "*.dart" ! -name "*.g.dart" ! -name "*.gen.dart" ! -name "*.generated.dart" ! -name "*app_localizations*.dart")


dart format --set-exit-if-changed "${DART_FILES[@]}" "${TEST_FILES[@]}"
