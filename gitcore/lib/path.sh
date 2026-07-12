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
