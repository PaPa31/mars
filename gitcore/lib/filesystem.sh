#!/bin/sh

###############################################################################
# gitcore_directory_entries
#
# Print the entries contained in a directory.
#
# Usage:
#     gitcore_directory_entries DIRECTORY
###############################################################################

gitcore_directory_entries()
{
    ls -A -- "$1"
}
