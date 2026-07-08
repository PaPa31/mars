# Git Core

Git Core provides low-level repository inspection tools built
on Git plumbing commands.

Its purpose is to expose durable repository knowledge through
portable POSIX shell utilities.

Higher-level projects should consume Git Core rather than
reimplement Git repository mechanics.

This establishes a clear separation between repository
architecture and repository mechanics.

Principles

- Prefer Git plumbing over porcelain where appropriate.
- Prefer POSIX shell.
- Prefer composable utilities.
- Favor repository introspection over repository mutation.
