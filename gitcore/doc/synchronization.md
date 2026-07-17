## Synchronization

Synchronization defines how collaborators establish and maintain a shared
repository state during human-AI or human-human collaboration.

The protocol is transport-independent. Synchronization artifacts may be
exchanged through chat, files, email, or any other medium.

The protocol is based on the Git model of snapshots and deltas.

---

## Concepts

### Repository

The Git repository being synchronized.

### Baseline

The baseline is the latest complete repository snapshot that has been
successfully synchronized between collaborators.

The baseline serves as the reference state against which subsequent
incremental synchronizations are interpreted.

A baseline is identified by:

* repository identity,
* HEAD commit,
* recent repository history.

### Delta

A delta describes changes relative to the current baseline.

Deltas are typically represented by `git show HEAD` and any additional
working-tree changes.

---

## Synchronization Levels

### Repo Sync

Purpose: establish repository identity and architecture.

Artifacts:

* `README.md`
* `doc/handshake.md`

### Session Sync

Purpose: establish or replace the shared baseline.

Command:

```sh
./tools/gitcore-session-sync
```

A Session Sync contains:

* repository orientation,
* recent repository history,
* complete repository content.

### Message Sync

Purpose: synchronize repository evolution relative to the shared baseline.

Command:

```sh
./tools/gitcore-message-sync
```

A Message Sync contains:

* latest committed change (`git show HEAD`),
* working-tree status,
* unstaged changes,
* staged changes.

---

## Snapshot Model

The synchronization model follows Git semantics.

```text
Shared Repository State = Baseline + Delta + Delta + ...
```

A Session Sync establishes a baseline.

Each Message Sync advances that baseline incrementally.

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

## History Comparison

Baseline ordering is determined by repository history, not by timestamps.

The recent history included in a Session Sync is used to determine whether
the incoming baseline is newer, older, or diverged relative to the current
baseline.

---

## Artifact Identity

Synchronization artifacts should identify the repository state they describe.

A Session Sync should include:

* repository identity,
* HEAD commit,
* recent history.

The filename of the artifact is not part of the protocol.

---

## Design Principles

* Synchronize only what has become invalid.
* Prefer snapshots plus deltas.
* Keep baselines explicit.
* Keep deltas minimal.
* Avoid silent baseline replacement.
* Make synchronization artifacts self-describing.
* Keep the protocol independent of any specific AI or transport.

