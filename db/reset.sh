#!/usr/bin/env bash

run() {
  local this_dir="$(dirname "$BASH_SOURCE")"

  local sql_file
  declare -a init_sql_files=( "$this_dir/drop.sql" "$this_dir/create.sql")

  for sql_file in "${init_sql_files[@]}"; do
    sudo mysql < "$sql_file"
  done

  for sql_file in "$this_dir/tables"/*.sql; do
    sudo mysql < "$sql_file"
  done

  for sql_file in "$this_dir/data"/*.sql; do
    sudo mysql < "$sql_file"
  done
}

set -o errexit
set -o pipefail
set -o nounset
run "$@"
