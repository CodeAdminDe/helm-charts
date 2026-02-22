# kasm-ws Chart Implementation Plan

## Goal

Add a new chart `kasm-ws` to this monorepo that can be published in this helm-repo and reused across different environments (dev/stage/prod) through values overrides, while aligning with the implementation style used in this repository.

## Style Baseline Captured From This Repo

Reference charts reviewed:

- `charts/ollama`
- `charts/netbird-management`
- `charts/netbird-agent`
- `charts/outline`

Observed implementation conventions to carry over:

1. Strong values-driven behavior with explicit feature toggles (`enabled`, `existing*Secret`, `persistence.enabled`, `ingress.enabled`, etc.).
2. Secret lifecycle handling that favors:
- consuming pre-existing secrets when configured
- otherwise generating secrets in-chart
- preserving generated credentials across upgrades via `lookup`.
3. Security-first defaults where possible:
- non-root execution
- optional runtime hardening
- optional runtime class controls.
4. Multi-env readiness by default:
- avoid hardcoded deployment specifics
- keep hostnames, classes, storage, image tags, and exposure settings configurable.
5. README generation through repo-local helm-docs templates (`README.md.gotmpl` pattern used in this monorepo).

## Upstream Kasm Chart Findings

Source reviewed: `kasmtech/kasm-helm` (release `1.18.1`).

Important findings:

1. Upstream already ships a broad, environment-flexible values model.
2. Upstream includes complex but required proxy/configmap wiring that should not be reimplemented ad hoc.
3. Upstream already supports existing-secret patterns and generated secret behavior for core Kasm credentials.
4. Kasm agent is intentionally out of scope upstream and must be deployed separately.

## Scope Decision For v1 In This Repo

Implement `charts/kasm-ws` as a repo-owned chart based on upstream Kasm templates, then apply monorepo style alignment where it adds clear operational value.

In-scope:

1. Add `kasm-ws` chart files and templates as deployable baseline.
2. Align chart metadata/ownership to this repo (name, description, maintainers, homepage, keywords).
3. Add repo-style `README.md.gotmpl` integration for helm-docs generation.
4. Add runtime-class controls in values and wire them into workloads:
- `runtimeClass.pods`
- `runtimeClass.jobs`
- `runtimeClass.tests`
5. Keep upstream feature and secret handling model intact for Kasm-specific behavior.
6. Add `.helmignore` consistent with this repository.
7. Add at least one helm test manifest.

Out-of-scope for this change:

1. Rebuilding Kasm templates from scratch.
2. Replacing upstream proxy config logic.
3. Introducing new opinionated Cilium policy abstraction for Kasm in this first iteration.
4. Deploying/packaging/pushing releases remotely (local branch + local commit only).

## Implementation Checklist

1. Create chart structure under `charts/kasm-ws`.
2. Import baseline chart files and templates from upstream release `1.18.1`.
3. Apply repo-style metadata and docs template.
4. Add `runtimeClass` values and template wiring.
5. Ensure chart renders/lints locally.
6. Generate `README.md` using repo helm-docs workflow.
7. Commit locally on feature branch.
