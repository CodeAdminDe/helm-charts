

# envoy-gateway-dataplane-policies

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.7.0](https://img.shields.io/badge/AppVersion-v1.7.0-informational?style=flat-square)

A Helm chart for Envoy Gateway dataplane CiliumNetworkPolicies on Kubernetes.

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
helm install envoy-gateway-dataplane-policies codeadminde/envoy-gateway-dataplane-policies
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

To install the chart with the release name `envoy-gateway-dataplane-policies`

```bash
helm install envoy-gateway-dataplane-policies codeadminde/envoy-gateway-dataplane-policies
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `envoy-gateway-dataplane-policies`

```bash
helm uninstall envoy-gateway-dataplane-policies
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
> helm install envoy-gateway-dataplane-policies codeadminde/envoy-gateway-dataplane-policies -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install envoy-gateway-dataplane-policies --set key=value --set keyTwo=secondValue codeadminde/envoy-gateway-dataplane-policies
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
			<td id="egress"><a href="./values.yaml#L66">egress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "backends": [],
  "controlPlane": {
    "enabled": true,
    "ports": [
      18000,
      18001,
      18002
    ],
    "toEndpoints": [
      {
        "matchLabels": {
          "app.kubernetes.io/name": "envoy-gateway",
          "control-plane": "envoy-gateway",
          "io.kubernetes.pod.namespace": "envoy-gateway-system"
        }
      }
    ]
  },
  "dns": {
    "enabled": true
  },
  "external": [],
  "extraRules": []
}
</pre>
</div>
			</td>
			<td>Dataplane egress policy controls.</td>
		</tr>
		<tr>
			<td id="egress--backends"><a href="./values.yaml#L99">egress.backends</a></td>
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
			<td>Explicit backend allowlist entries for routed services.
```yaml
backends:
  - name: app-a
    toEndpoints:
      - matchLabels:
          io.kubernetes.pod.namespace: app-a
          app.kubernetes.io/name: app-a
    ports:
      - 8080
```</td>
		</tr>
		<tr>
			<td id="egress--controlPlane--enabled"><a href="./values.yaml#L69">egress.controlPlane.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
true
</pre>
</div>
			</td>
			<td>Allow dataplane egress back to the Envoy Gateway control plane.</td>
		</tr>
		<tr>
			<td id="egress--controlPlane--ports"><a href="./values.yaml#L78">egress.controlPlane.ports</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  18000,
  18001,
  18002
]
</pre>
</div>
			</td>
			<td>Control-plane ports required by Envoy Gateway dataplane workloads.</td>
		</tr>
		<tr>
			<td id="egress--controlPlane--toEndpoints"><a href="./values.yaml#L72">egress.controlPlane.toEndpoints</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "matchLabels": {
      "app.kubernetes.io/name": "envoy-gateway",
      "control-plane": "envoy-gateway",
      "io.kubernetes.pod.namespace": "envoy-gateway-system"
    }
  }
]
</pre>
</div>
			</td>
			<td>Endpoint selectors for the Envoy Gateway control plane. @description Defaults assume the controller runs in the `envoy-gateway-system` namespace. Override these selectors when the controller namespace or labels differ.</td>
		</tr>
		<tr>
			<td id="egress--dns--enabled"><a href="./values.yaml#L85">egress.dns.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
true
</pre>
</div>
			</td>
			<td>Allow DNS egress to kube-dns.</td>
		</tr>
		<tr>
			<td id="egress--external"><a href="./values.yaml#L111">egress.external</a></td>
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
			<td>Explicit external allowlist entries.
```yaml
external:
  - name: oidc
    toFQDNs:
      - matchName: login.example.com
    ports:
      - 443
```</td>
		</tr>
		<tr>
			<td id="egress--extraRules"><a href="./values.yaml#L114">egress.extraRules</a></td>
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
			<td>Additional raw egress rules appended to the dataplane egress CNP.</td>
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
			<td id="ingress"><a href="./values.yaml#L25">ingress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "extraRules": [],
  "private": {
    "enabled": false,
    "fromEndpoints": [],
    "fromEntities": [
      "cluster"
    ],
    "ports": []
  },
  "public": {
    "enabled": true,
    "fromEndpoints": [],
    "fromEntities": [
      "world"
    ],
    "ports": [
      80,
      443
    ]
  }
}
</pre>
</div>
			</td>
			<td>Dataplane ingress policy controls.</td>
		</tr>
		<tr>
			<td id="ingress--extraRules"><a href="./values.yaml#L63">ingress.extraRules</a></td>
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
			<td>Additional raw ingress rules appended to the dataplane ingress CNP.
```yaml
extraRules:
  - fromEndpoints:
      - matchLabels:
          io.kubernetes.pod.namespace: monitoring
          app.kubernetes.io/name: synthetic-checker
    toPorts:
      - ports:
          - port: "8443"
            protocol: TCP
```</td>
		</tr>
		<tr>
			<td id="ingress--private--enabled"><a href="./values.yaml#L41">ingress.private.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Allow private cluster-internal traffic to dedicated listener ports.</td>
		</tr>
		<tr>
			<td id="ingress--private--fromEndpoints"><a href="./values.yaml#L46">ingress.private.fromEndpoints</a></td>
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
			<td>Optional endpoint selectors for private listener traffic.</td>
		</tr>
		<tr>
			<td id="ingress--private--fromEntities"><a href="./values.yaml#L43">ingress.private.fromEntities</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "cluster"
]
</pre>
</div>
			</td>
			<td>Allowed Cilium entities for private listener traffic.</td>
		</tr>
		<tr>
			<td id="ingress--private--ports"><a href="./values.yaml#L48">ingress.private.ports</a></td>
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
			<td>Private listener ports.</td>
		</tr>
		<tr>
			<td id="ingress--public--enabled"><a href="./values.yaml#L28">ingress.public.enabled</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
true
</pre>
</div>
			</td>
			<td>Allow public north-south traffic to the dataplane listener ports.</td>
		</tr>
		<tr>
			<td id="ingress--public--fromEndpoints"><a href="./values.yaml#L33">ingress.public.fromEndpoints</a></td>
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
			<td>Optional endpoint selectors for public listener traffic.</td>
		</tr>
		<tr>
			<td id="ingress--public--fromEntities"><a href="./values.yaml#L30">ingress.public.fromEntities</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "world"
]
</pre>
</div>
			</td>
			<td>Allowed Cilium entities for public listener traffic.</td>
		</tr>
		<tr>
			<td id="ingress--public--ports"><a href="./values.yaml#L35">ingress.public.ports</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  80,
  443
]
</pre>
</div>
			</td>
			<td>Listener ports exposed publicly.</td>
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
			<td id="namespaceBaseline"><a href="./values.yaml#L19">namespaceBaseline</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "confirmDedicatedNamespace": false,
  "enabled": false
}
</pre>
</div>
			</td>
			<td>Optional namespace-wide baseline for dedicated dataplane namespaces. @description Advanced feature. Only enable when the release namespace is dedicated to the targeted dataplane workloads. This intentionally applies to all endpoints in the namespace.</td>
		</tr>
		<tr>
			<td id="namespaceBaseline--confirmDedicatedNamespace"><a href="./values.yaml#L22">namespaceBaseline.confirmDedicatedNamespace</a></td>
			<td>
bool
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
false
</pre>
</div>
			</td>
			<td>Explicit acknowledgement that the namespace is dedicated to dataplane workloads.</td>
		</tr>
		<tr>
			<td id="podSecurityContext"><a href="./values.yaml#L121">podSecurityContext</a></td>
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
			<td id="policyMetadata"><a href="./values.yaml#L13">policyMetadata</a></td>
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
			<td>Shared policy metadata extensions.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L117">runtimeClass</a></td>
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
			<td id="securityContext"><a href="./values.yaml#L124">securityContext</a></td>
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
			<td id="selector"><a href="./values.yaml#L7">selector</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "matchLabels": {
    "app.kubernetes.io/name": "envoy-proxy",
    "gateway.envoyproxy.io/owning-gateway-name": "example"
  }
}
</pre>
</div>
			</td>
			<td>Selector for the EnvoyProxy dataplane pods this release should govern. @description Must be narrow and explicit. Override the default example labels before production use. The chart never uses a broad empty selector for dataplane policies.</td>
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
<hr /><hr />

## Appendix - Chart-specifics

### Scope

* This chart renders `CiliumNetworkPolicy` resources for Envoy Gateway dataplane workloads only.
* It is intended to be deployed once per Gateway namespace or per dataplane security domain.
* The default control-plane ports/selectors in this chart are aligned to Envoy Gateway `v1.7.0`.
* It does not deploy:
  * `GatewayClass`
  * `Gateway`
  * `EnvoyProxy`
  * controller resources
  * backend namespace policies

### Ownership model

* Use this chart together with the main `envoy-gateway` chart, not instead of it.
* Recommended layering:
  * `envoy-gateway` chart: controller + optional bootstrap resources + controller CNPs
  * `envoy-gateway-dataplane-policies` chart: dataplane ingress/egress isolation
  * backend namespace policies: explicit trust from application namespaces back to the dataplane pods

### Selector model

* `selector.matchLabels` must target the EnvoyProxy dataplane pods this release should govern.
* The default selector values are illustrative placeholders and should be overridden before production use.
* Keep the selector narrow and environment-specific.
* Do not use broad selectors that unintentionally combine multiple security domains.

### Namespace baseline

* `namespaceBaseline.enabled` is intentionally disabled by default.
* Enabling it applies a namespace-wide deny baseline to **all** endpoints in the release namespace.
* Only use it when the namespace is dedicated to dataplane workloads and you explicitly confirm that via `namespaceBaseline.confirmDedicatedNamespace=true`.

### Backend and external egress

* Backend access is intentionally explicit through `egress.backends`.
* External dependencies such as OIDC or telemetry should be modeled explicitly through `egress.external`.
* This chart does not infer backends from `HTTPRoute` resources.
* The default control-plane selector assumes the Envoy Gateway controller runs in the `envoy-gateway-system` namespace. Override `egress.controlPlane.toEndpoints` when your controller namespace or labels differ.
