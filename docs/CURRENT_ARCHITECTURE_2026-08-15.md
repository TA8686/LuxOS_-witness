# LuxOS / SERA Witness System
## Current Architecture Source of Truth

**Record date:** August 15, 2026  
**Version:** v01  
**Status:** CURRENT OPERATOR-APPROVED REFERENCE / TOPOLOGY CORRECTION / PRESERVE HISTORICAL SOURCES  
**Primary architect/operator:** Terry Michael Albertson  
**Audience:** Terry, LuxOS operators, ChatGPT, Gemini, Codex, and any future AI or human system reviewing LuxOS records.

## 1. Purpose of this record

LuxOS has changed materially over time. Older documents correctly describe earlier stages of the system, but several of those historical node assignments are no longer current. AI systems that search the archive can therefore retrieve a true historical statement and incorrectly present it as the present architecture.

This record fixes that problem without deleting or rewriting history.

**Conflict rule:** For current LuxOS topology and node roles, use this August 15, 2026 record unless Terry later approves a newer dated source-of-truth record. Older architecture documents remain valid as historical snapshots, not as automatic descriptions of the current system.

**Preservation rule:** Do not delete, overwrite, or silently revise earlier SERA/LuxOS architecture files. Preserve them as provenance showing how the design evolved.

## 2. Canonical current topology

```text
TERRY / OPERATOR
      |
     PX9
Mobile Commander / field interface
      |
  secure remote path
      |
     PX5
Security Gateway / Jump Host
Tailscale edge / controlled ingress
      |
 SSH / trusted internal path
      |
     NX1
Primary Brain / Compute / Witness host environment
      |
      +-- /mnt/LXM_ROOT       controlled SSD corpus / legacy working storage
      +-- /mnt/LXM_EXPANSION  large expansion/archive storage
      +-- /mnt/T7_SSD         archive / historical storage
      +-- other approved local storage as mounted and verified
```

The shortest correct current model is:

**PX9 = Commander**  
**PX5 = Gateway / Jump Host**  
**NX1 = Brain / Primary Compute**  
**LXM_ROOT and LXM_EXPANSION = storage attached to NX1, not independent compute nodes**

## 3. Current node roles

| Component | Current canonical role | What it is not |
|---|---|---|
| PX9 | Android mobile Commander/operator endpoint; field capture, intake, control, and remote access surface | Not the primary evidence-processing brain |
| PX5 | Security gateway and SSH jump host used to reach NX1; Tailscale/network edge; controlled ingress/egress | Not the main compute brain and not interchangeable with NX1 |
| NX1 | Primary compute/brain node; processing, hashing, indexing, search, evidence review, OCR/transcription, association work, and local Witness/Guardian services | Not merely a storage layer |
| LXM_ROOT | SSD/storage corpus mounted inside the NX1 environment; controlled files and historical/working data | Not a separate computer; not the current primary node |
| LXM_EXPANSION | Large expansion/archive storage attached to NX1 | Not a separate reasoning node |
| T7 SSD | Secondary archive/historical storage medium | Not the system brain |
| LXM2 / HP laptop | Display/work surface when used | Not a core authority or compute node |
| Google Drive | Optional transport, reference, sharing, and backup/archive copy | Not the sovereign source of truth |
| GitHub | Public code/document anchor and versioned publication surface | Not the live evidence store |

## 4. Security path and trust boundary

The intentional security path is:

```text
PX9 -> PX5 -> NX1
```

PX5 is the network boundary and jump point. NX1 is intentionally treated as the protected internal brain rather than a directly exposed remote endpoint. Exact IP addresses, interface names, firewall state, and Tailscale state are operational facts that must be checked live before use; they should not be copied from an old document and assumed current.

This distinction is architectural, not cosmetic. Describing PX5 as the brain collapses the security boundary and misrepresents how Terry reaches NX1.

## 5. Linux and the Witness are separate layers

Linux remains the underlying operating system and execution substrate.

The LuxOS Witness/Guardian is a reasoning, continuity, provenance, and verification layer above Linux. Its purpose is to observe and correlate system state, preserve provenance, track files/devices/events, help maintain user intent across work, and produce verifiable records.

The Witness should guide, verify, associate, and report. It should not silently rewrite source evidence or pretend that its interpretation is the source itself.

Canonical separation:

```text
SOURCE ARTIFACT
    -> inventory / observation
    -> hash + metadata
    -> provenance record
    -> association / correlation
    -> Witness ledger / index
    -> human-readable report or query
```

**SOURCE EVIDENCE != WITNESS INTERPRETATION**

## 6. SERA status

SERA is part of LuxOS lineage and provenance. Legacy SERA code and evidence paths are preserved under the historical tree, including references to `~/LuxOS/legacy/SERA_OS_FULL_20260705`.

Current rule: Do not describe SERA as a replacement for Linux, and do not assume that every older SERA component is the currently active implementation. SERA is a predecessor/legacy Witness lineage whose code, concepts, and evidence history remain important. Current LuxOS Witness/Guardian work builds on that lineage while the active architecture continues to evolve.

Planned or partially implemented capabilities must be labeled as such. Do not convert a design intention into a claim that a service is already deployed.

## 7. Evidence integrity rules

The current architecture retains the strongest principles found throughout the historical record:

1. Preserve originals. Never silently modify source evidence.
2. Hash and inventory evidence so later changes can be detected.
3. Keep metadata and provenance tied to the artifact they describe.
4. Distinguish verified source facts from operator context, inference, technical theory, and unanswered questions.
5. Use cloud services as optional transport/backup, not as the only copy or ultimate authority.
6. Maintain recoverable local indexes, ledgers, manifests, and receipts.
7. When an AI produces a summary, treat the summary as an interpretation until it is reconciled against source records.
8. Historical architecture documents are evidence of evolution; they are not errors to erase.

## 8. Why older records conflict

The archive contains multiple genuine architecture generations:

### 2025 generation
A November 10, 2025 Gmail record titled **"Everything we discussed"** contains an initialization block declaring `P5="Brainstem_RPi5"` and `LXM="Workhorse_Laptop"`. This is a real historical record and explains why an AI may retrieve "P5 brainstem" language. It is superseded for current topology.

### April 30, 2026 generation
The Drive document **"Witness_System_LuxOS_Architecture_Log_2026-04-30_REFINED_AUTHORITATIVE"** called LXM the primary working node and PX5/NX1 redundant nodes. It was authoritative for that revision and should remain preserved. Its topology section is superseded by later records and the current operator lock.

### May 15, 2026 generation
The Drive document **"LuxOS mesh"** described a dual-node witness core with LXM + PX5 and PX9 as mobile relay/field commander. This was another real design stage. It is not the current topology.

### July 28, 2026 correction
The Drive record **"TERRY_DRIVE_TO_NX1_RELEVANCE_REVIEW_2026-07-28_v02_CORRECTED"** explicitly states that LXM/LXM_ROOT is an SSD mounted inside NX1, not a separate processing node, and that NX1 performs processing, hashing, indexing, and evidence review. This is a key correction leading into the current architecture.

### August 15, 2026 current lock
Current operator-confirmed topology is PX9 -> PX5 -> NX1, with PX5 as the security jump/gateway and NX1 as the brain. LXM_ROOT and LXM_EXPANSION are storage layers within/attached to NX1.

## 9. AI handoff rule

Any AI system ingesting LuxOS material should apply this order of authority when answering questions about the **current** architecture:

1. Latest operator-approved dated source-of-truth record.
2. Current live machine state and verified command output.
3. Newer correction/verification records.
4. Older architecture documents, labeled with their dates as historical snapshots.
5. AI-generated summaries only after reconciliation against the sources above.

If an older record conflicts with this record, do not call the older record "false." Say that it describes an earlier architecture generation and has been superseded for current topology.

## 10. Canonical AI-ready summary

LuxOS is an offline-first, Linux-based Witness/Guardian and evidence architecture designed around local control, provenance, hashing, indexing, association, and recoverability. The current trusted node path is PX9 -> PX5 -> NX1. PX9 is the mobile Commander and intake surface. PX5 is the security gateway and SSH jump host, including the Tailscale-facing edge used to reach the protected environment. NX1 is the primary brain/compute node, performing the heavy processing, hashing, indexing, evidence review, OCR/transcription, association, and Witness services. LXM_ROOT is an SSD/storage corpus mounted inside NX1, and LXM_EXPANSION is large archive/expansion storage attached to NX1; neither should be described as an independent compute brain. T7 is an archive medium. Linux remains the execution layer, while the Witness/Guardian sits above Linux to preserve provenance, correlate records, maintain continuity, and verify work without silently altering source evidence. SERA is preserved as important legacy lineage and historical code/evidence, not as a claim that every earlier SERA implementation remains the active architecture. Google Drive is optional transport/backup/reference, and GitHub is a public code/document anchor; neither replaces the local sovereign evidence store.

## 11. Do-not-repeat errors

Do not describe:

- `P5` as the current canonical node name. Use **PX5**.
- PX5 as the main brain.
- NX1 as merely storage.
- LXM_ROOT as a separate computer.
- the April 30 or May 15 topology as current without its historical date.
- SERA as the operating system beneath Linux.
- Google Drive as the source of truth.
- planned Witness features as deployed unless verified on the live system.

## 12. Operational state versus architecture

Some facts change frequently and must not be frozen into architecture:

- current IP addresses and Tailscale addresses
- which mounts are presently online
- drive free-space percentage
- whether LXM_EXPANSION is currently full
- active SSH sessions
- current service/process state
- exact model loaded for local AI
- current network routes

Those are runtime facts. Check them live and record the timestamp of the check.

## 13. Source record reviewed for this correction

The following records were used to separate current architecture from historical architecture:

1. **Current operator confirmation, August 15, 2026** - current lock: PX9 Commander; PX5 security jump/gateway; NX1 brain; LXM_ROOT storage inside NX1.
2. **Google Drive:** `TERRY_DRIVE_TO_NX1_RELEVANCE_REVIEW_2026-07-28_v02_CORRECTED` - explicitly states LXM/LXM_ROOT is an SSD mounted inside NX1 and NX1 performs processing, hashing, indexing, and evidence review.
3. **Google Drive:** `LUXOS_UPDATED_HASH_AND_MESH_SYNC_METHOD_2026` - records NX1 expansion mirroring and the rule that Google Drive is an outbound/archive copy rather than the source of truth.
4. **Google Drive:** `LuxOS mesh` - preserves the May 15 dual-node LXM/PX5 witness-core generation; historical/superseded for current topology.
5. **Google Drive:** `Witness_System_LuxOS_Architecture_Log_2026-04-30_REFINED_AUTHORITATIVE` - preserves the April 30 architecture generation and its source-review discipline; historical/superseded for current topology.
6. **Google Drive / indexed paths:** references to `~/LuxOS/legacy/SERA_OS_FULL_20260705` - supports classification of the older SERA tree as preserved legacy material.
7. **Gmail, November 10, 2025:** `Everything we discussed` - contains the legacy `P5="Brainstem_RPi5"` and `LXM="Workhorse_Laptop"` declarations that explain older AI summaries.
8. **Gmail, March-April 2026:** Netdata messages separately identify monitored nodes PX5 and NX1, and a Google security alert records an NX1 app-password event, corroborating their existence as distinct operational nodes.
9. **GitHub:** `TA8686/LuxOS_-witness` README - preserves the public high-level principles: offline operation, user sovereignty, SHA-256 verification, local-first workflows, and Witness logging.

## 14. Supersession statement

This document supersedes **node-role and topology descriptions only** in earlier LuxOS/SERA architecture summaries when the question is "What is the current architecture?"

It does not invalidate the historical records, their dates, their hashes, their authorship, their evidentiary value, or the fact that those designs existed.

Future correction method: create a new dated version. Do not overwrite this version.
