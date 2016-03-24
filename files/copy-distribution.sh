#!/bin/bash

set -eu

indir="${1}"
outdir="${2}"

cd "${outdir}"

find "${indir}" -name '*.war' -exec cp {} webapps \;