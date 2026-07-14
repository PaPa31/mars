#!/bin/sh

. "$script_dir/../lib/environment.sh"

gitcore_report_environment()
{
    gitcore_print_section "Environment" "-----------"
    gitcore_print_heading "Current directory"
    gitcore_print_indented "$(gitcore_pwd)"
}
