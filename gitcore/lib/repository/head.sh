#!/bin/sh

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

###############################################################################
# gitcore_head_reference
#
# Print the current HEAD reference.
#
# Output:
#     Branch name if HEAD is attached.
#     detached if HEAD is detached.
###############################################################################

gitcore_head_reference()
{
    if gitcore_head_is_detached
    then
        printf 'detached\n'
    else
        gitcore_branch
    fi
}
