#!/bin/sh

. "$script_dir/../lib/filesystem.sh"

gitcore_report_repository_root()
{
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
}
