

# envoy-gateway-instance-policies

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.7.1](https://img.shields.io/badge/AppVersion-v1.7.1-informational?style=flat-square)

A Helm chart for Envoy Gateway Gateway-instance policy resources on Kubernetes.

**Homepage:** <https://github.com/CodeAdminDe/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Frederic Roggon | <frederic.roggon@codeadmin.de> | <https://github.com/CodeAdminDe> |

## Requirements

Kubernetes: `>=1.24.0`

## TL;DR

You don't want to read through the docs? That's the quick and dirty way:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
helm install envoy-gateway-instance-policies codeadminde/envoy-gateway-instance-policies
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

> I'd recommend reading through the docs. Skip them at your own risk. ;-)

## Repository

In order to install / query / etc... the charts, you'll need to add the repository:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
```

## Installation

To install the chart with the release name `envoy-gateway-instance-policies`

```bash
helm install envoy-gateway-instance-policies codeadminde/envoy-gateway-instance-policies
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `envoy-gateway-instance-policies`

```bash
helm uninstall envoy-gateway-instance-policies
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Take a look at the [values.yaml](./values.yaml) file of the chart. It contains the default configuration and additional notes.
So it would be a good idea to take a look at it, even if you already know what you would like to accomplish.

To configure the release (chart values), provide your own values via a *.yaml file and reference it with the `-f` flag.

> #### Sample
>
> ```bash
> helm install envoy-gateway-instance-policies codeadminde/envoy-gateway-instance-policies -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install envoy-gateway-instance-policies --set key=value --set keyTwo=secondValue codeadminde/envoy-gateway-instance-policies
> ```

## Values

<table height="800px" >
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td id="backendTrafficPolicies"><a href="./values.yaml#L111">backendTrafficPolicies</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Envoy Gateway BackendTrafficPolicy resources. @description Rendered as `gateway.envoyproxy.io/v1alpha1` `BackendTrafficPolicy` objects in `.Release.Namespace`. This chart favors Gateway/listener attachment but can also target same-namespace routes where appropriate.
```yaml
backendTrafficPolicies:
  - name: prod-public-backend
    targetRefs:
      - group: gateway.networking.k8s.io
        kind: Gateway
        name: prod-public
    retry:
      numRetries: 3
      retryOn:
        triggers:
          - connect-failure
          - unavailable
    healthCheck:
      active:
        type: HTTP
        http:
          path: /healthz
        interval: 5s
        timeout: 2s
    circuitBreaker:
      maxConnections: 2048
```</td>
		</tr>
		<tr>
			<td id="clientTrafficPolicies"><a href="./values.yaml#L83">clientTrafficPolicies</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Envoy Gateway ClientTrafficPolicy resources. @description Rendered as `gateway.envoyproxy.io/v1alpha1` `ClientTrafficPolicy` objects in `.Release.Namespace`. These policies are same-namespace attachments and, for practical use in this chart, should target Gateway listeners via `targetRefs`.
```yaml
clientTrafficPolicies:
  - name: prod-public-client
    targetRefs:
      - group: gateway.networking.k8s.io
        kind: Gateway
        name: prod-public
        sectionName: https-public
    clientIPDetection:
      xForwardedFor:
        numTrustedHops: 1
    tls:
      alpnProtocols:
        - h2
        - http/1.1
    timeout:
      http:
        requestTimeout: 60s
```</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L3">fullnameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L2">nameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>Override release-based naming.</td>
		</tr>
		<tr>
			<td id="podSecurityContext"><a href="./values.yaml#L118">podSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{}
</pre>
</div>
			</td>
			<td>Pod-level security context for Helm test pods.</td>
		</tr>
		<tr>
			<td id="policyMetadata"><a href="./values.yaml#L6">policyMetadata</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "labels": {}
}
</pre>
</div>
			</td>
			<td>Shared metadata extensions applied to every generated policy resource.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L114">runtimeClass</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "tests": ""
}
</pre>
</div>
			</td>
			<td>RuntimeClass names.</td>
		</tr>
		<tr>
			<td id="securityContext"><a href="./values.yaml#L121">securityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allowPrivilegeEscalation": false,
  "capabilities": {
    "drop": [
      "ALL"
    ]
  },
  "readOnlyRootFilesystem": true,
  "runAsGroup": 65532,
  "runAsNonRoot": true,
  "runAsUser": 65532,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>Container-level security context for Helm test pods.</td>
		</tr>
		<tr>
			<td id="securityPolicies"><a href="./values.yaml#L59">securityPolicies</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[]
</pre>
</div>
			</td>
			<td>Envoy Gateway SecurityPolicy resources. @description Rendered as `gateway.envoyproxy.io/v1alpha1` `SecurityPolicy` objects in `.Release.Namespace`. This chart intentionally uses explicit `targetRefs` only. For `extAuth`, keep `headersToExtAuth` at `extAuth` level, but place `headersToBackend` under `extAuth.http`.
```yaml
securityPolicies:
  - name: app-oidc
    targetRefs:
      - group: gateway.networking.k8s.io
        kind: Gateway
        name: prod-public
        sectionName: https-app
    oidc:
      provider:
        issuer: https://login.example.com/realms/prod
        authorizationEndpoint: https://login.example.com/realms/prod/protocol/openid-connect/auth
        tokenEndpoint: https://login.example.com/realms/prod/protocol/openid-connect/token
      clientIDRef:
        group: ""
        kind: Secret
        name: app-oidc-client
      clientSecret:
        group: ""
        kind: Secret
        name: app-oidc-client
      redirectURL: https://app.prod.example.com/oauth2/callback
      logoutPath: /logout
      scopes:
        - profile
        - email
  - name: app-forward-auth
    targetRefs:
      - group: gateway.networking.k8s.io
        kind: Gateway
        name: prod-public
        sectionName: https-app
    extAuth:
      headersToExtAuth:
        - X-Forwarded-Host
      http:
        backendRefs:
          - name: authentik-outpost
            kind: Service
            port: 9000
        path: /outpost.goauthentik.io/auth/nginx
        headersToBackend:
          - Set-Cookie
          - X-authentik-username
          - X-authentik-groups
```</td>
		</tr>
	</tbody>
</table>

## Value type details

The chart uses some value types for which I would like to add a further explanation / recommendation:

## Chart without NetworkPolicies

Please note that this chart does not provide any network policies itself.
Therefore, I recommend the implementation of network policies before using in prod environments.

## Opinionated & Non-standard

Please note that this chart is highly opinionated and may therefore not be ideal for your environment and/or does not meet the typical standard for helm charts.

Therefore, I'm very happy if you find the chart/s provided here helpful and perhaps even use it in your environment,
but at the same time I strongly advise you to take a close look at it and adapt it to your needs where necessary.

If you would like to return any helpful changes, I would also be happy to receive a pull request or two ;-)

## Feedback & Security

Please reach out to me at frederic.roggon@codeadmin.de for feedback.

If you find security-related issues, please do not use the issue tracker instead, contact me via email.

----------------------------------------------
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)

## Scope

This chart renders Envoy Gateway policy CRs for a single Gateway namespace / instance boundary.
It intentionally does not deploy the Envoy Gateway controller, GatewayClass, Gateway, or EnvoyProxy resources.
It also does not create Services, Deployments, StatefulSets, or PersistentVolumeClaims.

Supported policy kinds:
- `SecurityPolicy`
- `ClientTrafficPolicy`
- `BackendTrafficPolicy`

## Policy Attachment Model

This chart uses explicit `targetRefs` only.
It does not implement `targetSelectors`.

Important constraints:
- policies are rendered into `.Release.Namespace`
- policy attachment is same-namespace
- this chart is designed primarily for Gateway- and listener-level attachment
- same-namespace route targets are supported where Envoy Gateway allows them

## Secret Handling

This chart does not create credentials or embed secrets into policy values.
Reference pre-created Kubernetes Secrets from the target namespace, for example:
- OIDC client credentials
- Basic Auth `.htpasswd` secrets
- API key credential secrets
- external authorization backend credentials

## Notes

- `ClientTrafficPolicy` targets must be `Gateway` resources.
- `BackendTrafficPolicy.mergeType` is intentionally rejected for Gateway targets to avoid ambiguous parent-level merges.
- For `SecurityPolicy.extAuth`, keep `headersToExtAuth` at `extAuth` level, but configure `headersToBackend` under `extAuth.http`.
- If all policy lists are empty or fully disabled, the chart renders no policy CRs by design.
