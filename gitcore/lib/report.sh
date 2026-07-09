#!/bin/sh

. "$script_dir/../lib/environment.sh"
. "$script_dir/../lib/repository.sh"

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

    printf '%s\n' \
    "" \
    "Repository" \
    "----------" \
    ""

    printf '%s' "Git repository:"

    if gitcore_is_repository
    then
        printf '\n    yes\n'

        printf '%s\n' \
            "" \
            "Repository root:"

        printf '    %s\n' "$(gitcore_repo_root)"
    else
        printf '\n    no\n'
    fi
}
