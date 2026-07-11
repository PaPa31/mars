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

###############################################################################
# gitcore_path_exists
#
# Determine whether a path exists.
#
# Usage:
#     gitcore_path_exists PATH
#
# Exit status:
#     0  Path exists.
#     1  Path does not exist.
###############################################################################

gitcore_path_exists()
{
    [ -e "$1" ]
}

###############################################################################
# gitcore_is_regular_file
#
# Determine whether a path refers to a regular file.
#
# Usage:
#     gitcore_is_regular_file PATH
#
# Exit status:
#     0  Path is a regular file.
#     1  Path is not a regular file.
###############################################################################

gitcore_is_regular_file()
{
    [ -f "$1" ]
}

###############################################################################
# gitcore_is_symbolic_link
#
# Determine whether a path refers to a symbolic link.
#
# Usage:
#     gitcore_is_symbolic_link PATH
#
# Exit status:
#     0  Path is a symbolic link.
#     1  Path is not a symbolic link.
###############################################################################

gitcore_is_symbolic_link()
{
    [ -L "$1" ]
}
