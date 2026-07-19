## Synchronization

Synchronization defines how collaborators establish and maintain a shared
repository state during human-AI or human-human collaboration.

The protocol is transport-independent. Synchronization artifacts may be
exchanged through chat, files, email, or any other medium.

The protocol is based on the Git model of snapshots and deltas.

---

## Concepts

### Shared State

The shared state is the repository state currently agreed upon by all
collaborators.

A shared state consists of

- one shared baseline
- zero or more accepted Message Sync artifacts

### Repository

The Git repository being synchronized.

### Baseline

The baseline is the shared repository snapshot from which incremental
synchronization proceeds.

The baseline serves as the reference state against which subsequent
incremental synchronizations are interpreted.

A baseline is identified by

- repository identity
- HEAD commit
- recent repository history

### Message Sync

Synchronize repository evolution relative to the shared baseline.

A Message Sync typically consists of

    git show HEAD

together with working-tree status and any staged or unstaged changes.

---

## Synchronization Levels

### Repo Sync

Purpose

Establish repository identity before synchronization.

Artifacts

- README.md
- doc/handshake.md

### Session Sync

Purpose

Establish or replace the shared baseline.

Command

    ./tools/gitcore-session-sync

Contents

- repository orientation
- recent repository history
- complete repository content

### Message Sync

Purpose

Synchronize repository evolution relative to the shared baseline.

Command

    ./tools/gitcore-message-sync

Contents

- latest committed change (git show HEAD)
- working-tree status
- unstaged changes
- staged changes

---

## Snapshot Model

The synchronization model follows Git semantics.

Shared Repository State

    = Baseline
    + Message Sync
    + Message Sync
    + ...

A Session Sync establishes the shared baseline.

Each accepted Message Sync advances the shared state.

The shared state consists of the shared baseline together with all
accepted Message Sync artifacts.

---

## Baseline Acceptance Protocol

When a Session Sync is received, the following algorithm is applied.

### No current baseline

Accept the incoming baseline.

### Different repository

Request confirmation before replacing the current baseline.

### Same HEAD

No action is required.

### Incoming baseline is newer

Replace the current baseline.

### Incoming baseline is older

Request confirmation before replacing the current baseline.

### Histories diverged

Request confirmation before replacing the current baseline.

---

## Message Acceptance Protocol

When a Message Sync is received, the following algorithm is applied.

A Message Sync shall be accepted if and only if it advances the current shared state to a descendant repository state.

If accepted, the shared state advances.

Otherwise, the shared state is unchanged.

### Descendant state

Accept the Message Sync and advance the shared baseline.

In Git, this corresponds to a fast-forward update.

### Already synchronized

If the Message Sync describes the current shared baseline, no action is
required.

### Older Message Sync

Do not modify the shared baseline.

### Diverged history

Do not modify the shared baseline.

A new Session Sync is required to establish a new shared baseline.

### History rewrite

History rewrites, for example

- git reset
- git rebase
- force-pushes

invalidate incremental synchronization.

After repository history is rewritten, a new Session Sync is required to establish a new shared baseline.

---

## History Comparison

Repository history determines whether an incoming Session Sync is

- newer
- older
- identical
- diverged

relative to the current baseline.

---

## Artifact Identity

A Session Sync identifies the synchronized repository state by

- repository identity
- HEAD commit
- recent history

The filename of the artifact is not part of the protocol.

---

## Design Principles

- Synchronize only what has become invalid
- Prefer snapshots plus deltas
- Keep baselines explicit
- Keep deltas minimal
- Avoid silent baseline replacement
- Make synchronization artifacts self-describing
- Keep the protocol independent of any specific AI or transport
- Prefer reproducible synchronization over conversational context

---

## Protocol Invariant

The shared state changes only by

- accepting a Session Sync
- accepting a Message Sync

All other synchronization artifacts leave the shared state unchanged.
