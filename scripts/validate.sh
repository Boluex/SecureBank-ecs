#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
validation_dir=$(mktemp -d)
trap 'rm -rf "$validation_dir"' EXIT
terraform fmt -check -recursive
export TF_DATA_DIR="$validation_dir/terraform"
terraform -chdir=terraform init -backend=false -input=false
terraform -chdir=terraform validate
