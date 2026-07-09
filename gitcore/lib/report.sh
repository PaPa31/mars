#!/bin/sh

. "$script_dir/../lib/environment.sh"

gitcore_report()
{
    printf '%s\n' \
        "Git Core Orientation Report" \
        "===========================" \
        "" \
        "Format version:" \
        "    1" \
        "" \
        "Environment" \
        "-----------" \
        "" \
        "Current directory:"

    printf '    %s\n' "$(gitcore_pwd)"
}
