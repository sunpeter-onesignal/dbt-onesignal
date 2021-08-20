#!/usr/bin/env bash

# script/deploy is used to deploy the project to a remote environment

set -e

cd "$(dirname "$0")/.."

GIT_COMMIT="$(git rev-parse @)"
export GIT_COMMIT

helmfile --file kubernetes/helmfile.yml apply