#!/bin/sh

gitcore_report_capabilities()
{
    gitcore_print_section "Capabilities" "------------"

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
}
