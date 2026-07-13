#!/bin/sh

. "$script_dir/../lib/environment.sh"
. "$script_dir/../lib/path.sh"
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

        repo_root=$(gitcore_repo_root)

        printf '\n    yes\n'

        printf '%s\n' \
            "" \
            "Repository root:"

        printf '    %s\n' "$repo_root"

        printf '%s\n' \
            "" \
            "Repository root entries:"

        gitcore_directory_entries "$repo_root" |
        while IFS= read -r entry
        do
            printf '    %s (%s)\n' \
                "$entry" \
                "$(gitcore_path_type "$repo_root/$entry")"
        done

        printf '%s\n' \
            "" \
            "Branch:"

        if gitcore_head_is_detached
        then
            printf '    detached\n'
        else
            printf '    %s\n' "$(gitcore_branch)"
        fi

        printf '%s\n' \
            "" \
            "HEAD:"

        printf '    %s\n' "$(gitcore_head)"

        printf '%s\n' \
            "" \
            "Repository clean:"

        printf '    %s\n' "$(gitcore_is_repository_clean)"

        printf '%s\n' \
            "" \
            "Unconsumed capabilities" \
            "------------------------" \
            ""

        tags=$(gitcore_repository_tags 'unconsumed/*')
        if [ -z "$tags" ]
        then
            printf '    none\n'
        else
            printf '%s\n' "$tags" |
            while IFS= read -r tag
            do
                printf '    %s\n' "${tag#unconsumed/}"
            done
        fi
    else
        printf '\n    no\n'
    fi
}
