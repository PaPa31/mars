#!/bin/sh

gitcore_is_repository()
{
    git rev-parse --is-inside-work-tree >/dev/null 2>&1
}

gitcore_repo_root()
{
    git rev-parse --show-toplevel
}

gitcore_branch()
{
    git symbolic-ref --short HEAD
}

gitcore_head()
{
    git rev-parse HEAD
}

###############################################################################
# gitcore_head_is_detached
#
# Determine whether HEAD is detached.
#
# Exit status:
#     0  HEAD is detached.
#     1  HEAD is attached to a branch.
###############################################################################

gitcore_head_is_detached()
{
    if git symbolic-ref --quiet HEAD >/dev/null 2>&1
    then
        return 1
    else
        return 0
    fi
}

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
