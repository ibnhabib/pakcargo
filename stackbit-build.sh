#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5f8d56872a96500015d790e3/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5f8d56872a96500015d790e3
curl -s -X POST https://api.stackbit.com/project/5f8d56872a96500015d790e3/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5f8d56872a96500015d790e3/webhook/build/publish > /dev/null
