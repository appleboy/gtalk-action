#!/bin/sh

set -eu

export GITHUB="true"

[ -n "$*" ] && export MESSAGE="$*"

/bin/drone-gtalk
