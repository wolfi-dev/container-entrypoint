#!/bin/sh
set -e

# To use this script, set BASE_COMMAND to the name of the base application you want to run e.g.
# "curl".
#
# This script is based on the 
# Run command with base application if the first argument contains a "-" or is not a system command. 
# The last part inside the "{}" is a workaround for the following bug in ash/dash:
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=874264
if [ -z "$BASE_COMMAND" ]; then
    echo "WARNING: Entryscript in use but \$BASE_COMMAND not configured"
elif [ "${1#-}" != "${1}" ] || [ -z "$(command -v "${1}")" ] || { [ -f "${1}" ] && ! [ -x "${1}" ]; }; then
    set -- $BASE_COMMAND "$@"
fi

exec "$@"
