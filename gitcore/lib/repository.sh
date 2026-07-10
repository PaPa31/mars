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

gitcore_is_repository_clean()
{
    if [ -n "$(git status --porcelain)" ]
    then
        printf 'no\n'
    else
        printf 'yes\n'
    fi
}
