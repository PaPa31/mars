#!/bin/sh

###############################################################################
# gitcore_path_basename
#
# Return the final pathname component of a path.
#
# Usage:
#     gitcore_path_basename PATH
###############################################################################

gitcore_path_basename()
{
    basename -- "$1"
}

###############################################################################
# gitcore_path_dirname
#
# Return all but the final pathname component of a path.
#
# Usage:
#     gitcore_path_dirname PATH
###############################################################################

gitcore_path_dirname()
{
    dirname -- "$1"
}

###############################################################################
# gitcore_path_is_hidden
#
# Determine whether the final pathname component is hidden.
#
# Usage:
#     gitcore_path_is_hidden PATH
#
# Exit status:
#     0  Final pathname component is hidden.
#     1  Final pathname component is not hidden.
###############################################################################

gitcore_path_is_hidden()
{
    name=$(gitcore_path_basename "$1")

    case "$name" in
        .|..)
            return 1
            ;;
        .*)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}
