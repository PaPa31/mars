## Handshake

A handshake is the repository's canonical self-introduction.

It provides the minimum durable information required for another
engineer or AI to synchronize with the repository and begin productive
work.

The handshake should remain stable across normal repository evolution.

## Goal

A repository implementing the Handshake Protocol should be able to
introduce itself to a new engineer or AI with minimal or no manual
explanation.

The handshake should provide sufficient durable context for
collaborative work to begin immediately.

## Primary Requirement

The handshake is the repository bootstrap protocol.

A successful handshake establishes sufficient shared context for
collaborative development without requiring manual repository
exploration.

## Repository Responsibility

A repository implementing the Handshake Protocol is responsible for
keeping its handshake accurate.

Whenever repository evolution changes collaborative understanding, the
handshake should evolve accordingly.

An outdated handshake is considered a defect.

## Success Criteria

A collaborator starting a new conversation should be able to:

* identify the repository,
* understand its purpose,
* understand its architecture,
* discover its public interfaces,
* determine its current state,
* identify ongoing work,

without manually browsing the repository tree or reading arbitrary
source files.

## Scope

The handshake complements repository documentation.

The handshake complements repository history.

The handshake is not intended to describe implementation details or
development history.

Its sole purpose is to establish sufficient shared context for
collaborative work.

## Synchronization Principle

Every element of the handshake should reduce the effort required for
future synchronization.

Information that does not improve synchronization should not be part of
the handshake.

## Stability

The handshake should evolve much more slowly than the implementation.

Implementation changes should not require handshake updates unless they
affect repository identity, architecture, public interfaces,
collaboration, or synchronization.

## Handshake Structure

A handshake consists of a stable sequence of sections.

The exact contents of each section are defined by the protocol.

At minimum, a handshake should communicate:

* repository identity,
* repository purpose,
* repository architecture,
* public interfaces,
* current repository state,
* ongoing work,
* collaboration guidance.

## Validation

A successful handshake allows a collaborator to begin productive work
without requiring manual exploration of the repository.

If collaborators consistently require additional manual orientation,
the handshake is incomplete.

---

An outdated handshake is considered a defect.
