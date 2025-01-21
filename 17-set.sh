#!/bin/bash

set -e

failure(){
    echo "Failed at: $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR

echo "Hellow World Success"
echooo "Hellow World failure"
echo "Hello World after failure"