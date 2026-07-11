#!/bin/sh

. "$script_dir/../lib/environment.sh"
. "$script_dir/../lib/repository.sh"
. "$script_dir/../lib/filesystem.sh"

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

        printf '%s\n' \
            "" \
            "Repository root entries:"

        gitcore_directory_entries "$(gitcore_repo_root)" |
        while IFS= read -r entry
        do
            printf '    %s\n' "$entry"
        done

        printf '%s\n' \
            "" \
            "Branch:"

        printf '    %s\n' "$(gitcore_branch)"

        printf '%s\n' \
            "" \
            "HEAD:"

        printf '    %s\n' "$(gitcore_head)"

        printf '%s\n' \
            "" \
            "Repository clean:"

        printf '    %s\n' "$(gitcore_is_repository_clean)"
    else
        printf '\n    no\n'
    fi
}
