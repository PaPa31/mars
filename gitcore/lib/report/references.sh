#!/bin/sh

gitcore_report_references()
{
    gitcore_print_section "References" "----------"

    gitcore_print_heading "HEAD reference"
    gitcore_print_indented "$(gitcore_head_reference)"

    gitcore_print_heading "HEAD"
    gitcore_print_indented "$(gitcore_head)"

    gitcore_print_heading "Repository description"
    gitcore_print_indented "$(gitcore_repository_description)"

    gitcore_print_heading "Upstream branch"
    gitcore_print_indented "$(gitcore_upstream_branch)"
}
