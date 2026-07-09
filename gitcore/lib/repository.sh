#!/bin/sh

gitcore_is_repository()
{
    git rev-parse --is-inside-work-tree >/dev/null 2>&1
}
