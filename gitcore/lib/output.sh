gitcore_print_indented()
{
    printf '    %s\n' "$1"
}

gitcore_print_heading()
{
    printf '%s\n' \
        "" \
        "$1:"
}

gitcore_print_section()
{
    printf '%s\n' \
        "" \
        "$1" \
        "$2"
}
