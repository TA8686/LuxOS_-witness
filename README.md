# LuxOS — Witness System

LuxOS is an **in-development, Linux-based Witness / continuity architecture and collection of local-first tooling** intended to preserve records, provenance, continuity, and user control across devices and services.

It is **not currently a finished operating system, finished commercial product, or fully automated end-to-end system**.

## Purpose

LuxOS is being developed around:

- evidence and source preservation;
- integrity verification and provenance;
- long-term continuity across devices and services;
- local-first / offline-first workflows where practical;
- operator-controlled authority boundaries;
- reducing manual reconstruction and synchronization work.

## Core Principles

- User sovereignty
- Preserve originals
- Cryptographic verification where implemented
- Provenance tied to artifacts
- Historical records are preserved rather than silently rewritten
- AI interpretation is not source evidence
- Cloud convenience is not sovereign authority
- Planned capability must not be presented as deployed capability

## Current Architecture

Current canonical topology:

```text
PX9 -> PX5 -> NX1
```

- **PX9** — mobile Commander / field interface
- **PX5** — security gateway / SSH jump host
- **NX1** — primary Brain / compute / local Witness host
- **Google Drive** — cloud bridge / transport / search / relay surface
- **GitHub** — public design / documentation / version-history surface

See:

- [Current architecture source of truth — 2026-08-15](docs/CURRENT_ARCHITECTURE_2026-08-15.md)
- [Current implementation status — 2026-09-12](docs/CURRENT_STATUS_2026-09-12.md)

## Current Status

Active development.

Some narrow components and continuity paths are working and have been verified, including a revision-aware Google Drive -> NX1 intake path and an automatic revision-drift watcher for specifically configured continuity records.

The larger LuxOS vision remains incomplete. Generalized synchronization, full unattended automation, calendar integration, finished Android integration, reliable cloud-independent operation, and a finished commercial deployment are **not yet established**.

This repository is a **public provenance / design / publication surface**. It does not contain the complete live implementation, private source records, or the full NX1 evidence corpus.

## Historical Note

Earlier README versions and architecture descriptions remain preserved in Git history. They document real stages of the project and should not be silently rewritten as though those stages never existed.

## Author

Terry Michael Albertson  
Founder — Albertsons Mobile Mechanic LLC
