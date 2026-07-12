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
