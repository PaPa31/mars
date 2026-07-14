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

###############################################################################
# gitcore_default_remote
#
# Print the default repository remote.
#
# Output:
#     Remote name.
#     none if no default remote exists.
###############################################################################

gitcore_default_remote()
{
    if git remote get-url origin >/dev/null 2>&1
    then
        printf 'origin\n'
    else
        printf 'none\n'
    fi
}
