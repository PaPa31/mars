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

###############################################################################
# gitcore_is_directory
#
# Determine whether a path refers to a directory.
#
# Usage:
#     gitcore_is_directory PATH
#
# Exit status:
#     0  Path is a directory.
#     1  Path is not a directory.
###############################################################################

gitcore_is_directory()
{
    [ -d "$1" ]
}
