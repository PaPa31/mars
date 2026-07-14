#!/bin/sh

. "$script_dir/../lib/repository.sh"
. "$script_dir/../lib/report/repository_root.sh"
. "$script_dir/../lib/report/repository_state.sh"
. "$script_dir/../lib/report/references.sh"
. "$script_dir/../lib/report/capabilities.sh"

gitcore_report_repository()
{
    gitcore_print_section "Repository" "----------"

    gitcore_print_heading "Git repository"
    if gitcore_is_repository
    then
        gitcore_report_repository_root
        gitcore_report_repository_state
        gitcore_report_references
        gitcore_report_capabilities
    else
        gitcore_print_indented 'no'
    fi
}
