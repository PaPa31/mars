#!/bin/sh

###############################################################################
# gitcore_is_repository_clean
#
# Determine whether the working tree is clean.
#
# Output:
#     yes
#     no
###############################################################################

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
# gitcore_repository_is_bare
#
# Determine whether the repository is bare.
#
# Output:
#     yes
#     no
###############################################################################

gitcore_repository_is_bare()
{
    case "$(git rev-parse --is-bare-repository)" in
        true)  printf 'yes\n' ;;
        false) printf 'no\n' ;;
    esac
}
