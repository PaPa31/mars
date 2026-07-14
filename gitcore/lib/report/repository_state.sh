#!/bin/sh

gitcore_report_repository_state()
{
    gitcore_print_section "Repository state" "----------------"

    gitcore_print_heading "Repository clean"
    gitcore_print_indented "$(gitcore_is_repository_clean)"

    gitcore_print_heading "Bare repository"
    gitcore_print_indented "$(gitcore_repository_is_bare)"
}
