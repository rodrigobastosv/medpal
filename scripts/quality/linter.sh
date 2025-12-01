#!/bin/bash

set -o errexit
set -o nounset

GET_DEPENDENCIES="true"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --no-pub)
      GET_DEPENDENCIES="false"
      shift
      ;;
    *)
      echo "Remove all unknown options: $1"
      exit 1
      ;;
  esac
done

if [ "$GET_DEPENDENCIES" = "true" ]; then
    echo -e "\n\n> Downloading Dependencies"
    flutter pub get
fi

echo -e "\n\n> Analyze Code"

dart run dart_code_linter:metrics analyze lib
dart run dart_code_linter:metrics check-unused-code lib
dart run dart_code_linter:metrics check-unused-files lib --exclude="lib/gen/**"

echo -e "\n\n> Linting Dart Files"

dart analyze --fatal-infos
flutter analyze --fatal-infos --no-pub

echo -e "\n\n> Linting Shell Files"

shellcheck ./scripts/**/*.sh
