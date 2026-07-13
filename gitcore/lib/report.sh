#!/bin/sh

. "$script_dir/../lib/environment.sh"
. "$script_dir/../lib/path.sh"
. "$script_dir/../lib/repository.sh"
. "$script_dir/../lib/filesystem.sh"
. "$script_dir/../lib/output.sh"

gitcore_report()
{
    gitcore_print_section \
        "Git Core Orientation Report" \
        "==========================="

    gitcore_print_heading "Format version"

    gitcore_print_indented 1

    gitcore_print_section \
        "Environment" \
        "-----------"

    gitcore_print_heading "Current directory"

    gitcore_print_indented "$(gitcore_pwd)"

    gitcore_print_section \
        "Repository" \
        "----------"

    gitcore_print_heading "Git repository"

    if gitcore_is_repository
    then

        repo_root=$(gitcore_repo_root)

        gitcore_print_indented 'yes'

        gitcore_print_heading "Repository root"

        gitcore_print_indented "$repo_root"

        gitcore_print_heading "Repository root entries"

        gitcore_directory_entries "$repo_root" |
        while IFS= read -r entry
        do
            printf '    %s (%s)\n' \
                "$entry" \
                "$(gitcore_path_type "$repo_root/$entry")"
        done

        gitcore_print_section \
            "Repository state" \
            "----------------"

        gitcore_print_heading "Repository clean"

        gitcore_print_indented "$(gitcore_is_repository_clean)"

        gitcore_print_section \
            "References" \
            "----------"

        gitcore_print_heading "HEAD reference"

        gitcore_print_indented "$(gitcore_head_reference)"

        gitcore_print_heading "HEAD"

        gitcore_print_indented "$(gitcore_head)"

        gitcore_print_heading "Repository description"

        gitcore_print_indented "$(gitcore_repository_description)"

        gitcore_print_section \
            "Capabilities" \
            "------------"

        gitcore_print_heading "Unconsumed capabilities"

        tags=$(gitcore_repository_tags 'unconsumed/*')
        if [ -z "$tags" ]
        then
            gitcore_print_indented 'none'
        else
            printf '%s\n' "$tags" |
            while IFS= read -r tag
            do
                gitcore_print_indented "${tag#unconsumed/}"
            done
        fi
    else
        gitcore_print_indented 'no'
    fi
}
