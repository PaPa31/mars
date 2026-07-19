# Synchronization Conformance Tests

This directory contains protocol conformance tests for the Git Core
synchronization protocol.

The tests describe observable protocol behavior independently of any
specific implementation.

Each test specifies

- Initial Shared State
- Incoming Synchronization Artifact
- Expected Decision
- Expected Shared State

Any implementation conforming to the synchronization protocol should
produce the expected decision and resulting shared state.

## Coverage

Baseline Acceptance Protocol

    ✓ No baseline
    ✓ Newer baseline
    ✓ Same baseline
    ✓ Older baseline
    ✓ Diverged baseline
    ✓ Different repository

Message Acceptance Protocol

    ✓ Descendant Message Sync
    ✓ Identical Message Sync
    ✓ Older Message Sync
    ✓ Diverged Message Sync

Recovery Procedures

    ✓ History rewrite
    ✓ Resume after Session Sync
