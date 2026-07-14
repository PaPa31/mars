#!/bin/sh

###############################################################################
# gitcore_repository_remotes
#
# Print repository remote names.
#
# Output:
#     Remote names, one per line.
#     none if the repository has no remotes.
###############################################################################

gitcore_repository_remotes()
{
    remotes=$(git remote)

    if [ -n "$remotes" ]
    then
        printf '%s\n' "$remotes"
    else
        printf 'none\n'
    fi
}
