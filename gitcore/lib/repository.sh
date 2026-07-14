#!/bin/sh

. "$script_dir/../lib/repository/head.sh"
. "$script_dir/../lib/repository/identity.sh"

gitcore_is_repository_clean()
{
    if [ -n "$(git status --porcelain)" ]
    then
        printf 'no\n'
    else
        printf 'yes\n'
    fi
}

###############################################################################
# gitcore_repository_tags
#
# Print repository tags matching a pattern.
#
# Usage:
#     gitcore_repository_tags PATTERN
#
# Output:
#     Matching tag names, one per line.
###############################################################################

gitcore_repository_tags()
{
    git tag -l "$1"
}

###############################################################################
# gitcore_repository_description
#
# Print a human-readable description of the current repository state.
#
# Output:
#     Git describe output.
###############################################################################

gitcore_repository_description()
{
    git describe --tags --always
}
