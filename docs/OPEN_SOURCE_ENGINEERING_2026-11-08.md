# Open-source engineering record — 8 November 2026

**Operator:** Terry Michael Albertson ([TA8686](https://github.com/TA8686))  
**Scope:** Independently reproduced issues, isolated Python tests, and public code review. This is a record of tested work, not a claim of merged code, ownership of another contributor's pull request, or a production software release.

## 1. watchdog — validated worker restart and code review

- **Upstream issue:** [watchdog #1190 — Real-world example scripts](https://github.com/gorakhargosh/watchdog/issues/1190)
- **Existing third-party contribution:** [PR #1417 — Validated auto-restart example](https://github.com/gorakhargosh/watchdog/pull/1417), submitted by **Aschenbath**
- **My public review:** [Comment on PR #1417, 8 November 2026](https://github.com/gorakhargosh/watchdog/pull/1417#issuecomment-6724199052)
- **Revision independently reviewed:** `14ae3e0`

**Problem tested.** The proposed example syntax-checks the Python sources it finds before restarting a worker. With a command equivalent to `python worker.py`, deleting `worker.py` could still pass validation, terminate the simulated running worker, and attempt a replacement launch—even when a separate valid `helper.py` remained.

**Independent reproduction.** A focused mock-subprocess test produced the same stop-and-relaunch decision when the watched directory was otherwise empty and when another valid Python file remained. This identified a missing-entrypoint precondition in the tested direct-script configuration, **not** a claimed exploit or a measured production outage.

**Proposed correction.** In a separate, unsubmitted candidate worktree, I added a narrow pre-stop check that preserves the current worker when a directly invoked Python script is missing. The regression exercised both deletion cases and verified that restoring the script permits a restart: **four scenario assertions passed across two cases;** `git diff --check` passed. The candidate is a **21-line local patch**, not an upstream commit. The check does not claim to validate arbitrary commands or all Python launch modes.

**Related independent lab.** I separately developed a watchdog `AutoRestartTrick` subclass candidate: initial validation tests passed; a later iteration exposed an absolute-path pattern mismatch (`*.py` versus `**/*.py`); the corrected candidate passed **six mocked lifecycle/atomic-save tests** and a move-away negative test. A disposable, actual Python subprocess smoke test showed that an invalid edit preserved the worker, a valid edit restarted it, and cleanup stopped the final worker. **This real-worker smoke test tested the separate local candidate, not PR #1417 or its proposed 21-line fix.**

**Contribution status as of 8 November 2026:** A reproducible finding and suggested fix were published as a **review comment** on the existing PR. I did **not** author PR #1417; no code patch was submitted by me or merged upstream in this work.

## 2. fsspec — concurrent in-memory file-handle behavior

- **Upstream issue:** [filesystem_spec #2199 — Shared cursor positions for `memory://` handles](https://github.com/fsspec/filesystem_spec/issues/2199)
- **Existing third-party proposal:** [PR #2194 — Read-only memory file handles](https://github.com/fsspec/filesystem_spec/pull/2194), by **hansu650**

**Problem tested.** Two simultaneously opened in-memory file handles could share the same cursor. This causes one handle's reads or writes to affect the apparent position of the other, unlike independent handles on a local filesystem.

**Independent regression comparison.** I created two isolated standard-library tests covering concurrent reads and writes. Both **failed against the checked original source** and **passed against the separately checked third-party PR #2194 candidate**. Distinct source checkouts and preserved test outputs kept the baseline and proposed-fix behavior separate.

**Contribution status:** Independent issue reproduction and candidate evaluation only. I did not author PR #2194, submit a fsspec patch, or claim that a proposed change was merged.

## Testing method and limits

1. Identify the exact repository revision and keep the upstream baseline clean.
2. Reproduce a specific failure with minimal, controlled fixtures.
3. Isolate the proposed fix or third-party candidate from the baseline.
4. Run bounded negative and positive checks; retain logs and source-integrity hashes privately.
5. Report measured outcomes precisely, distinguishing mocks from real subprocesses and local demonstrations from upstream CI.

The work was developed and documented with **AI assistance** under human direction and test review. The observations and public GitHub review are attributable to this operator account; they do not imply unaided authorship of every test or code line.

**Disclosure and privacy:** Detailed local workspace paths, infrastructure identifiers, unrelated project evidence, credentials, personal records, and unpublished source material are deliberately excluded from this public summary. Supporting artifacts may be reviewed selectively with appropriate authorization.

## Relevance

This work demonstrates practical debugging, Python test design, failure-path analysis, regression validation, Git/GitHub collaboration, and careful technical communication. It complements—but does not certify—the in-development [LuxOS/Witness project](../README.md).

*Checkpoint: 8 November 2026. Future developments should be added as dated updates rather than silently reclassifying historical work as merged or production-ready.*
