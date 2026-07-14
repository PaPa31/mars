#!/bin/sh

gitcore_upstream_branch()
{
    if upstream=$(git rev-parse --abbrev-ref '@{upstream}' 2>/dev/null)
    then
        printf '%s\n' "$upstream"
    else
        printf 'none\n'
    fi
}
