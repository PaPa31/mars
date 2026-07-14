#!/bin/sh

. "$script_dir/../lib/output.sh"
. "$script_dir/../lib/report/repository.sh"
. "$script_dir/../lib/report/header.sh"
. "$script_dir/../lib/report/environment.sh"

gitcore_report()
{
    gitcore_report_header
    gitcore_report_environment
    gitcore_report_repository
}
