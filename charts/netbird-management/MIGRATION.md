# NetBird Management Chart Migration Guide

This document provides a reference migration guide for the refactored `netbird-management` chart. It is intended for local use in this repository.

## Scope

- Legacy architecture (management + signal + relay + dashboard) remains the default.
- Combined architecture (netbird-server) is opt-in.
- Embedded IdP is supported; external IdPs are encouraged via API/UI instead of hard-coded `management.json`.
- Existing PostgreSQL/CNPG integration remains supported.

## Before You Start

1. Record current values and chart/app versions.
2. Confirm database connectivity and backups.
3. Export or record IdP configuration details (client IDs, issuer, redirect URLs, secrets).
4. Verify existing encryption key secret and relay secret stability.

## Modes and Defaults

- `mode.architecture: legacy` (default) preserves the existing multi-deployment stack.
- `mode.architecture: combined` enables `netbird-server` and disables legacy deployments.
- `server.enabled` must be set to `true` when using `mode.architecture: combined`.

## Phase 1: Legacy Upgrade (No Architecture Change)

This phase upgrades the chart while staying on legacy mode.

Required values (no change expected):

```yaml
mode:
  architecture: legacy

server:
  enabled: false
```

Notes:

- The legacy management.json templating remains in place when `auth.externalProviders.managedBy.mode: helm`.
- Embedded IdP flags are now available but do not change behavior unless enabled.

## Phase 2: Prepare Embedded IdP (Optional but Recommended)

If you want to move toward NetBird’s recommended embedded IdP:

```yaml
auth:
  embeddedIdp:
    enabled: true
    dataDir: /var/lib/netbird/idp
```

Important: embedded IdP requires an issuer. If you enable it without setting an issuer, the management container will fail to start with `issuer is required`.

Example embedded IdP values (adjust to your domain):

```yaml
auth:
  embeddedIdp:
    enabled: true
    dataDir: /var/lib/netbird/idp
    issuer: "https://nb.example.com/oauth2"
```

Ensure a stable encryption key:

```yaml
existingEncryptionKeySecret: "netbird-datasrc-encryption"
```

## Phase 3: Transition External IdPs to API/UI (Optional)

If you want to stop templating IdP config in `management.json`:

```yaml
auth:
  externalProviders:
    managedBy:
      mode: api
```

Provide the IdP payload via a Secret and enable the API job:

```yaml
auth:
  externalProviders:
    apiJob:
      enabled: true
      managementUrl: "https://<your-domain>"
      tokenSecretName: "netbird-mgmt-api-token"
      tokenSecretKey: "token"
      payloadSecretName: "netbird-idp-payload"
      payloadSecretKey: "payload.json"
```

Example payload secret (create separately):

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: netbird-idp-payload
  namespace: <namespace>
type: Opaque
stringData:
  payload.json: |
    {"name":"authentik","type":"oidc","issuer":"https://auth.example.com","client_id":"...","client_secret":"..."}
```

If you prefer, configure external IdPs directly via the NetBird UI or API and leave `apiJob.enabled: false`.

## Phase 4: Switch to Combined Architecture

Set:

```yaml
mode:
  architecture: combined
server:
  enabled: true
```

Notes:

- Combined mode uses a single `netbird-server` deployment and `config.yaml`.
- Legacy deployments (management/signal/relay) are not rendered.
- Dashboard remains a separate deployment and continues to work with the configured auth values.

## STUN/TURN Behavior

- Legacy mode: external STUN/TURN remains enabled by default.
- Combined mode: disable external STUN/TURN if you want to use the embedded STUN server.

```yaml
turn:
  enabled: false
```

## Dashboard Auth Modes

Default remains `legacy` (Auth0/Authentik values). To use explicit values:

```yaml
dashboard:
  auth:
    mode: custom
    issuer: "https://your-issuer"
    clientId: "your-client-id"
    existingSecretName: "your-dashboard-secret"
    existingSecretKey: "client-secret"
    tokenSource: "accessToken"
    scopes: "openid profile email"
```

## Postgres / CNPG

No change required. Combined mode still uses the same DSN secret.

## Validation Checks to Expect

- `mode.architecture` must be `legacy` or `combined`.
- If `combined`, `server.enabled` must be `true`.
- If `auth.externalProviders.apiJob.enabled: true`, secret-based payload settings are required.
- If `dashboard.auth.mode: custom`, issuer and clientId must be set.

## Rollback Plan

If issues occur after switching to combined mode:

1. Set `mode.architecture: legacy` and `server.enabled: false`.
2. Restore legacy IdP settings (if needed).
3. Re-deploy chart to restore legacy services.

## Notes on Backward Compatibility

- Defaults preserve legacy deployments.
- PDB behavior changed for single replicas: `minAvailable` is forced to 0 to avoid blocking node drains.

## Note: Dashboard OIDC Configuration

Embedded IdP only configures the **management service**. The dashboard still requires explicit OIDC client settings. NetBird’s official docs list the required `dashboard.env` variables (issuer, client ID/audience, scopes, etc.) and provide the embedded IdP example (`AUTH_AUTHORITY` is `https://<domain>/oauth2` and the dashboard client ID/audience is `netbird-dashboard`).

References:
- https://docs.netbird.io/selfhosted/configuration-files
- https://docs.netbird.io/selfhosted/identity-providers/local
