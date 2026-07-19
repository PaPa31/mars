# Recover History Rewrite

## Initial Shared State

A → B → C

## Incoming Artifact

Message Sync

Repository History rewritten to

A → X → Y

## Expected Decision

Incremental synchronization invalid.

## Expected Action

Establish a new Session Sync.
