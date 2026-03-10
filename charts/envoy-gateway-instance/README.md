

# envoy-gateway-instance

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.7.0](https://img.shields.io/badge/AppVersion-v1.7.0-informational?style=flat-square)

A Helm chart for deploying Envoy Gateway Gateway and EnvoyProxy instances on Kubernetes.

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
helm install envoy-gateway-instance codeadminde/envoy-gateway-instance
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

To install the chart with the release name `envoy-gateway-instance`

```bash
helm install envoy-gateway-instance codeadminde/envoy-gateway-instance
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `envoy-gateway-instance`

```bash
helm uninstall envoy-gateway-instance
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
> helm install envoy-gateway-instance codeadminde/envoy-gateway-instance -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install envoy-gateway-instance --set key=value --set keyTwo=secondValue codeadminde/envoy-gateway-instance
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
			<td id="envoyProxy"><a href="./values.yaml#L6">envoyProxy</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "enabled": true,
  "labels": {},
  "name": "",
  "namespace": "",
  "spec": {
    "provider": {
      "kubernetes": {
        "envoyService": {
          "type": "ClusterIP"
        }
      },
      "type": "Kubernetes"
    }
  }
}
</pre>
</div>
			</td>
			<td>EnvoyProxy resource configuration.</td>
		</tr>
		<tr>
			<td id="envoyProxy--annotations"><a href="./values.yaml#L16">envoyProxy.annotations</a></td>
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
			<td>EnvoyProxy annotations.</td>
		</tr>
		<tr>
			<td id="envoyProxy--enabled"><a href="./values.yaml#L8">envoyProxy.enabled</a></td>
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
			<td>Create an EnvoyProxy resource for this Gateway instance.</td>
		</tr>
		<tr>
			<td id="envoyProxy--labels"><a href="./values.yaml#L18">envoyProxy.labels</a></td>
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
			<td>EnvoyProxy labels.</td>
		</tr>
		<tr>
			<td id="envoyProxy--name"><a href="./values.yaml#L11">envoyProxy.name</a></td>
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
			<td>EnvoyProxy resource name override. @description Empty value defaults to a release-derived name.</td>
		</tr>
		<tr>
			<td id="envoyProxy--namespace"><a href="./values.yaml#L14">envoyProxy.namespace</a></td>
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
			<td>EnvoyProxy namespace override. @description Empty value defaults to `.Release.Namespace`.</td>
		</tr>
		<tr>
			<td id="envoyProxy--spec"><a href="./values.yaml#L22">envoyProxy.spec</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "provider": {
    "kubernetes": {
      "envoyService": {
        "type": "ClusterIP"
      }
    },
    "type": "Kubernetes"
  }
}
</pre>
</div>
			</td>
			<td>EnvoyProxy spec. @description Defaults to Kubernetes provider and ClusterIP Envoy data-plane service type.</td>
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
			<td id="gateway"><a href="./values.yaml#L30">gateway</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "enabled": true,
  "gatewayClassName": "envoy-gateway",
  "httpListener": {
    "allowedRoutes": {
      "namespaces": {
        "from": "Same"
      }
    },
    "enabled": true,
    "name": "http",
    "port": 80
  },
  "infrastructure": {
    "parametersRef": {
      "enabled": true,
      "group": "gateway.envoyproxy.io",
      "kind": "EnvoyProxy",
      "name": ""
    }
  },
  "labels": {},
  "listeners": [
    {
      "allowedRoutes": {
        "namespaces": {
          "from": "All"
        }
      },
      "name": "http",
      "port": 80,
      "protocol": "HTTP"
    }
  ],
  "mode": "raw",
  "name": "",
  "namespace": "",
  "tls": {
    "certificates": [],
    "enabled": false,
    "listeners": [],
    "redirectHttpToHttps": {
      "annotations": {},
      "enabled": true,
      "labels": {},
      "name": "",
      "statusCode": 301
    }
  }
}
</pre>
</div>
			</td>
			<td>Gateway resource configuration.</td>
		</tr>
		<tr>
			<td id="gateway--annotations"><a href="./values.yaml#L40">gateway.annotations</a></td>
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
			<td>Gateway annotations.</td>
		</tr>
		<tr>
			<td id="gateway--enabled"><a href="./values.yaml#L32">gateway.enabled</a></td>
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
			<td>Create a Gateway resource for this instance.</td>
		</tr>
		<tr>
			<td id="gateway--gatewayClassName"><a href="./values.yaml#L45">gateway.gatewayClassName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"envoy-gateway"
</pre>
</div>
			</td>
			<td>Referenced GatewayClass name. @description This chart does not create a GatewayClass. Point this value at an existing class, typically managed by the `envoy-gateway` controller chart.</td>
		</tr>
		<tr>
			<td id="gateway--httpListener--allowedRoutes"><a href="./values.yaml#L91">gateway.httpListener.allowedRoutes</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "namespaces": {
    "from": "Same"
  }
}
</pre>
</div>
			</td>
			<td>Managed HTTP listener allowedRoutes block.</td>
		</tr>
		<tr>
			<td id="gateway--httpListener--enabled"><a href="./values.yaml#L85">gateway.httpListener.enabled</a></td>
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
			<td>Create an HTTP listener in managed mode. @description In managed TLS mode this listener is intended only for the central HTTP->HTTPS redirect route and therefore defaults to same-namespace route attachment.</td>
		</tr>
		<tr>
			<td id="gateway--httpListener--name"><a href="./values.yaml#L87">gateway.httpListener.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"http"
</pre>
</div>
			</td>
			<td>Managed HTTP listener name.</td>
		</tr>
		<tr>
			<td id="gateway--httpListener--port"><a href="./values.yaml#L89">gateway.httpListener.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
80
</pre>
</div>
			</td>
			<td>Managed HTTP listener port.</td>
		</tr>
		<tr>
			<td id="gateway--infrastructure--parametersRef--enabled"><a href="./values.yaml#L53">gateway.infrastructure.parametersRef.enabled</a></td>
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
			<td>Attach infrastructure.parametersRef to the Gateway.</td>
		</tr>
		<tr>
			<td id="gateway--infrastructure--parametersRef--group"><a href="./values.yaml#L55">gateway.infrastructure.parametersRef.group</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"gateway.envoyproxy.io"
</pre>
</div>
			</td>
			<td>ParametersRef API group.</td>
		</tr>
		<tr>
			<td id="gateway--infrastructure--parametersRef--kind"><a href="./values.yaml#L57">gateway.infrastructure.parametersRef.kind</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"EnvoyProxy"
</pre>
</div>
			</td>
			<td>ParametersRef kind.</td>
		</tr>
		<tr>
			<td id="gateway--infrastructure--parametersRef--name"><a href="./values.yaml#L60">gateway.infrastructure.parametersRef.name</a></td>
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
			<td>ParametersRef object name override. @description Empty value defaults to the effective `envoyProxy` resource name when `envoyProxy.enabled=true`.</td>
		</tr>
		<tr>
			<td id="gateway--labels"><a href="./values.yaml#L42">gateway.labels</a></td>
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
			<td>Gateway labels.</td>
		</tr>
		<tr>
			<td id="gateway--listeners"><a href="./values.yaml#L74">gateway.listeners</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "allowedRoutes": {
      "namespaces": {
        "from": "All"
      }
    },
    "name": "http",
    "port": 80,
    "protocol": "HTTP"
  }
]
</pre>
</div>
			</td>
			<td>Raw Gateway listeners. @description Used only when `gateway.mode=raw`. Keep this path for advanced/manual listener definitions.
```yaml
listeners:
  - name: http
    protocol: HTTP
    port: 80
    allowedRoutes:
      namespaces:
        from: All
```</td>
		</tr>
		<tr>
			<td id="gateway--mode"><a href="./values.yaml#L48">gateway.mode</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"raw"
</pre>
</div>
			</td>
			<td>Gateway rendering mode. @description Use `raw` to manage `gateway.listeners` directly. Use `managed` to let this chart build opinionated HTTP/HTTPS listeners, redirect handling, and optional cert-manager Certificates.</td>
		</tr>
		<tr>
			<td id="gateway--name"><a href="./values.yaml#L35">gateway.name</a></td>
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
			<td>Gateway resource name override. @description Empty value defaults to a release-derived name.</td>
		</tr>
		<tr>
			<td id="gateway--namespace"><a href="./values.yaml#L38">gateway.namespace</a></td>
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
			<td>Gateway namespace override. @description Empty value defaults to `.Release.Namespace`.</td>
		</tr>
		<tr>
			<td id="gateway--tls--certificates"><a href="./values.yaml#L150">gateway.tls.certificates</a></td>
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
			<td>Optional cert-manager Certificates to create in the Gateway namespace. @description If a listener references a `certificateRefName` that is not declared here, the chart assumes the Secret already exists in the Gateway namespace. This keeps existing Secret handling and cert-manager handling compatible.
```yaml
certificates:
  - secretName: prod-example-com-tls
    dnsNames:
      - "prod.example.com"
      - "*.prod.example.com"
    issuerRef:
      name: letsencrypt-prod
      kind: ClusterIssuer
      group: cert-manager.io
```</td>
		</tr>
		<tr>
			<td id="gateway--tls--enabled"><a href="./values.yaml#L98">gateway.tls.enabled</a></td>
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
			<td>Enable opinionated managed TLS handling. @description Requires `gateway.mode=managed`. When enabled, the chart renders HTTPS listeners, optional cert-manager Certificates, and by default a central HTTP->HTTPS redirect route.</td>
		</tr>
		<tr>
			<td id="gateway--tls--listeners"><a href="./values.yaml#L134">gateway.tls.listeners</a></td>
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
			<td>Managed HTTPS listeners. @description Each listener terminates TLS with the referenced Secret and should normally cover either an exact hostname or a wildcard domain. App-owner HTTPRoutes should bind to these HTTPS listeners, not the managed HTTP redirect listener.
```yaml
listeners:
  - name: https-prod-wildcard
    hostname: "*.prod.example.com"
    port: 443
    certificateRefName: prod-example-com-tls
    allowedRoutes:
      namespaces:
        from: All
  - name: https-prod-apex
    hostname: "prod.example.com"
    port: 443
    certificateRefName: prod-example-com-tls
    allowedRoutes:
      namespaces:
        from: All
```</td>
		</tr>
		<tr>
			<td id="gateway--tls--redirectHttpToHttps--annotations"><a href="./values.yaml#L110">gateway.tls.redirectHttpToHttps.annotations</a></td>
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
			<td>Redirect route annotations.</td>
		</tr>
		<tr>
			<td id="gateway--tls--redirectHttpToHttps--enabled"><a href="./values.yaml#L102">gateway.tls.redirectHttpToHttps.enabled</a></td>
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
			<td>Create a central HTTPRoute that redirects HTTP traffic to HTTPS.</td>
		</tr>
		<tr>
			<td id="gateway--tls--redirectHttpToHttps--labels"><a href="./values.yaml#L112">gateway.tls.redirectHttpToHttps.labels</a></td>
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
			<td>Redirect route labels.</td>
		</tr>
		<tr>
			<td id="gateway--tls--redirectHttpToHttps--name"><a href="./values.yaml#L105">gateway.tls.redirectHttpToHttps.name</a></td>
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
			<td>Redirect route name override. @description Empty value defaults to a release-derived name.</td>
		</tr>
		<tr>
			<td id="gateway--tls--redirectHttpToHttps--statusCode"><a href="./values.yaml#L108">gateway.tls.redirectHttpToHttps.statusCode</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
301
</pre>
</div>
			</td>
			<td>HTTP redirect status code. @description Valid values are `301`, `302`, `303`, `307`, or `308`.</td>
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
			<td id="podSecurityContext"><a href="./values.yaml#L157">podSecurityContext</a></td>
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
			<td id="runtimeClass"><a href="./values.yaml#L153">runtimeClass</a></td>
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
			<td id="securityContext"><a href="./values.yaml#L160">securityContext</a></td>
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

* This chart renders one Envoy Gateway instance stack: `Gateway`, optional `EnvoyProxy`, optional cert-manager `Certificate` resources, and optional HTTP to HTTPS redirect `HTTPRoute`.
* It does **not** deploy the Envoy Gateway controller itself.
* It also does **not** create a `GatewayClass`; `gateway.gatewayClassName` must point to an existing class, typically managed by the `envoy-gateway` chart.

### Composition model

* Recommended composition:
  * `envoy-gateway`: controller lifecycle and controller hardening
  * `envoy-gateway-instance`: one Gateway/security-domain instance
  * `envoy-gateway-dataplane-policies`: dataplane ingress/egress isolation for the Gateway namespace
  * app charts: `HTTPRoute` ownership close to the applications
* This chart intentionally does not render dataplane Cilium policies or business `HTTPRoute` resources.

### Listener model

* `gateway.mode=raw` keeps the listener definition fully manual.
* `gateway.mode=managed` reuses the opinionated HTTP/HTTPS/TLS behavior from the controller chart's bootstrap path:
  * optional HTTP listener
  * managed HTTPS listeners
  * optional central HTTP to HTTPS redirect route
  * optional cert-manager `Certificate` resources for listener Secrets

### Namespace model

* `gateway.namespace` and `envoyProxy.namespace` default to `.Release.Namespace`.
* If `gateway.infrastructure.parametersRef.enabled=true` and this chart also creates the `EnvoyProxy`, both resources must live in the same namespace because the Gateway references the EnvoyProxy as a local object.
