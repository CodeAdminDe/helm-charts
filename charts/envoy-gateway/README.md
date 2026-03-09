

# envoy-gateway

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.7.0](https://img.shields.io/badge/AppVersion-v1.7.0-informational?style=flat-square)

A Helm chart for deploying Envoy Gateway (Gateway API implementation) on Kubernetes.

**Homepage:** <https://github.com/CodeAdminDe/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Frederic Roggon | <frederic.roggon@codeadmin.de> | <https://github.com/CodeAdminDe> |

## Requirements

Kubernetes: `>=1.24.0`

| Repository | Name | Version |
|------------|------|---------|
| oci://docker.io/envoyproxy | envoy-gateway(gateway-helm) | v1.7.0 |

## TL;DR

You don't want to read through the docs? That's the quick and dirty way:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
helm install envoy-gateway codeadminde/envoy-gateway
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

To install the chart with the release name `envoy-gateway`

```bash
helm install envoy-gateway codeadminde/envoy-gateway
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `envoy-gateway`

```bash
helm uninstall envoy-gateway
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
> helm install envoy-gateway codeadminde/envoy-gateway -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install envoy-gateway --set key=value --set keyTwo=secondValue codeadminde/envoy-gateway
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
			<td id="bootstrap"><a href="./values.yaml#L44">bootstrap</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "envoyProxy": {
    "annotations": {},
    "enabled": true,
    "labels": {},
    "name": "envoy-gateway-default",
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
  },
  "gateway": {
    "annotations": {},
    "enabled": true,
    "gatewayClassName": "envoy-gateway",
    "infrastructure": {
      "parametersRef": {
        "enabled": true,
        "group": "gateway.envoyproxy.io",
        "kind": "EnvoyProxy",
        "name": "envoy-gateway-default"
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
    "name": "envoy-gateway",
    "namespace": ""
  },
  "gatewayClass": {
    "annotations": {},
    "controllerName": "gateway.envoyproxy.io/gatewayclass-controller",
    "enabled": true,
    "labels": {},
    "name": "envoy-gateway",
    "parametersRef": {
      "enabled": true,
      "group": "gateway.envoyproxy.io",
      "kind": "EnvoyProxy",
      "name": "envoy-gateway-default",
      "namespace": ""
    }
  }
}
</pre>
</div>
			</td>
			<td>Optional bootstrap resources managed by this chart. @description These resources help provide a minimal Gateway API baseline (`GatewayClass`, `EnvoyProxy`, `Gateway`) without deploying any ingress/gateway controller infrastructure outside Envoy Gateway itself.</td>
		</tr>
		<tr>
			<td id="bootstrap--envoyProxy--annotations"><a href="./values.yaml#L79">bootstrap.envoyProxy.annotations</a></td>
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
			<td id="bootstrap--envoyProxy--enabled"><a href="./values.yaml#L72">bootstrap.envoyProxy.enabled</a></td>
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
			<td>Create a default EnvoyProxy resource.</td>
		</tr>
		<tr>
			<td id="bootstrap--envoyProxy--labels"><a href="./values.yaml#L81">bootstrap.envoyProxy.labels</a></td>
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
			<td id="bootstrap--envoyProxy--name"><a href="./values.yaml#L74">bootstrap.envoyProxy.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"envoy-gateway-default"
</pre>
</div>
			</td>
			<td>EnvoyProxy resource name.</td>
		</tr>
		<tr>
			<td id="bootstrap--envoyProxy--namespace"><a href="./values.yaml#L77">bootstrap.envoyProxy.namespace</a></td>
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
			<td id="bootstrap--envoyProxy--spec"><a href="./values.yaml#L85">bootstrap.envoyProxy.spec</a></td>
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
			<td>EnvoyProxy spec. @description Defaults to Kubernetes provider and ClusterIP envoy data-plane service type.</td>
		</tr>
		<tr>
			<td id="bootstrap--gateway--annotations"><a href="./values.yaml#L101">bootstrap.gateway.annotations</a></td>
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
			<td id="bootstrap--gateway--enabled"><a href="./values.yaml#L94">bootstrap.gateway.enabled</a></td>
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
			<td>Create a default Gateway resource.</td>
		</tr>
		<tr>
			<td id="bootstrap--gateway--gatewayClassName"><a href="./values.yaml#L105">bootstrap.gateway.gatewayClassName</a></td>
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
			<td>Referenced GatewayClass name.</td>
		</tr>
		<tr>
			<td id="bootstrap--gateway--infrastructure--parametersRef--enabled"><a href="./values.yaml#L110">bootstrap.gateway.infrastructure.parametersRef.enabled</a></td>
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
			<td>Attach infrastructure.parametersRef to Gateway.</td>
		</tr>
		<tr>
			<td id="bootstrap--gateway--infrastructure--parametersRef--group"><a href="./values.yaml#L112">bootstrap.gateway.infrastructure.parametersRef.group</a></td>
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
			<td id="bootstrap--gateway--infrastructure--parametersRef--kind"><a href="./values.yaml#L114">bootstrap.gateway.infrastructure.parametersRef.kind</a></td>
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
			<td id="bootstrap--gateway--infrastructure--parametersRef--name"><a href="./values.yaml#L116">bootstrap.gateway.infrastructure.parametersRef.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"envoy-gateway-default"
</pre>
</div>
			</td>
			<td>ParametersRef object name.</td>
		</tr>
		<tr>
			<td id="bootstrap--gateway--labels"><a href="./values.yaml#L103">bootstrap.gateway.labels</a></td>
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
			<td id="bootstrap--gateway--listeners"><a href="./values.yaml#L138">bootstrap.gateway.listeners</a></td>
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
			<td>Gateway listeners. @description Default allows routes from all namespaces. For multi-tenant clusters, override with `from: Same` or `from: Selector` and apply RBAC isolation on the Gateway namespace.
```yaml
listeners:
  - name: http
    protocol: HTTP
    port: 80
    allowedRoutes:
      namespaces:
        from: All
  - name: https
    protocol: HTTPS
    port: 443
    tls:
      mode: Terminate
      certificateRefs:
        - kind: Secret
          name: envoy-gateway-tls
```</td>
		</tr>
		<tr>
			<td id="bootstrap--gateway--name"><a href="./values.yaml#L96">bootstrap.gateway.name</a></td>
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
			<td>Gateway name.</td>
		</tr>
		<tr>
			<td id="bootstrap--gateway--namespace"><a href="./values.yaml#L99">bootstrap.gateway.namespace</a></td>
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
			<td id="bootstrap--gatewayClass--annotations"><a href="./values.yaml#L51">bootstrap.gatewayClass.annotations</a></td>
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
			<td>GatewayClass annotations.</td>
		</tr>
		<tr>
			<td id="bootstrap--gatewayClass--controllerName"><a href="./values.yaml#L55">bootstrap.gatewayClass.controllerName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"gateway.envoyproxy.io/gatewayclass-controller"
</pre>
</div>
			</td>
			<td>GatewayClass controllerName.</td>
		</tr>
		<tr>
			<td id="bootstrap--gatewayClass--enabled"><a href="./values.yaml#L47">bootstrap.gatewayClass.enabled</a></td>
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
			<td>Create a default GatewayClass.</td>
		</tr>
		<tr>
			<td id="bootstrap--gatewayClass--labels"><a href="./values.yaml#L53">bootstrap.gatewayClass.labels</a></td>
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
			<td>GatewayClass labels.</td>
		</tr>
		<tr>
			<td id="bootstrap--gatewayClass--name"><a href="./values.yaml#L49">bootstrap.gatewayClass.name</a></td>
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
			<td>GatewayClass name.</td>
		</tr>
		<tr>
			<td id="bootstrap--gatewayClass--parametersRef--enabled"><a href="./values.yaml#L60">bootstrap.gatewayClass.parametersRef.enabled</a></td>
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
			<td>Attach a parametersRef to GatewayClass. @description Enables binding the default EnvoyProxy resource to the GatewayClass.</td>
		</tr>
		<tr>
			<td id="bootstrap--gatewayClass--parametersRef--group"><a href="./values.yaml#L62">bootstrap.gatewayClass.parametersRef.group</a></td>
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
			<td id="bootstrap--gatewayClass--parametersRef--kind"><a href="./values.yaml#L64">bootstrap.gatewayClass.parametersRef.kind</a></td>
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
			<td id="bootstrap--gatewayClass--parametersRef--name"><a href="./values.yaml#L66">bootstrap.gatewayClass.parametersRef.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"envoy-gateway-default"
</pre>
</div>
			</td>
			<td>ParametersRef object name.</td>
		</tr>
		<tr>
			<td id="bootstrap--gatewayClass--parametersRef--namespace"><a href="./values.yaml#L68">bootstrap.gatewayClass.parametersRef.namespace</a></td>
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
			<td>ParametersRef namespace (ignored for cluster-scoped objects that do not require it).</td>
		</tr>
		<tr>
			<td id="envoy-gateway"><a href="./values.yaml#L7">envoy-gateway</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "config": {
    "envoyGateway": {
      "gateway": {
        "controllerName": "gateway.envoyproxy.io/gatewayclass-controller"
      }
    }
  },
  "createNamespace": false,
  "deployment": {
    "envoyGateway": {
      "resources": {
        "limits": {
          "memory": "1024Mi"
        },
        "requests": {
          "cpu": "100m",
          "memory": "256Mi"
        }
      }
    },
    "replicas": 1
  },
  "enabled": true,
  "service": {
    "annotations": {},
    "type": "ClusterIP"
  }
}
</pre>
</div>
			</td>
			<td>Official Envoy Gateway chart values. @description This chart wraps upstream `gateway-helm` (`envoy-gateway` dependency). Any additional upstream values can be set under this key.</td>
		</tr>
		<tr>
			<td id="envoy-gateway--config--envoyGateway"><a href="./values.yaml#L38">envoy-gateway.config.envoyGateway</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "gateway": {
    "controllerName": "gateway.envoyproxy.io/gatewayclass-controller"
  }
}
</pre>
</div>
			</td>
			<td>Envoy Gateway controller configuration. @description See upstream extension types docs for full schema.</td>
		</tr>
		<tr>
			<td id="envoy-gateway--createNamespace"><a href="./values.yaml#L13">envoy-gateway.createNamespace</a></td>
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
			<td>Create namespace from the upstream dependency chart. @description Keep `false` when namespace management is handled externally.</td>
		</tr>
		<tr>
			<td id="envoy-gateway--deployment--envoyGateway--resources"><a href="./values.yaml#L21">envoy-gateway.deployment.envoyGateway.resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "memory": "1024Mi"
  },
  "requests": {
    "cpu": "100m",
    "memory": "256Mi"
  }
}
</pre>
</div>
			</td>
			<td>Envoy Gateway control-plane resource requests and limits.</td>
		</tr>
		<tr>
			<td id="envoy-gateway--deployment--replicas"><a href="./values.yaml#L17">envoy-gateway.deployment.replicas</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
1
</pre>
</div>
			</td>
			<td>Number of Envoy Gateway control-plane replicas.</td>
		</tr>
		<tr>
			<td id="envoy-gateway--enabled"><a href="./values.yaml#L9">envoy-gateway.enabled</a></td>
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
			<td>Enable upstream Envoy Gateway dependency chart.</td>
		</tr>
		<tr>
			<td id="envoy-gateway--service--annotations"><a href="./values.yaml#L33">envoy-gateway.service.annotations</a></td>
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
			<td>Service annotations for upstream control-plane service.</td>
		</tr>
		<tr>
			<td id="envoy-gateway--service--type"><a href="./values.yaml#L31">envoy-gateway.service.type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"ClusterIP"
</pre>
</div>
			</td>
			<td>Envoy Gateway control-plane service type. @description Defaults to ClusterIP for repo-aligned secure baseline.</td>
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

### Upstream behavior and chart scope

* This chart wraps the official Envoy Gateway Helm chart (`gateway-helm`) and keeps upstream compatibility as first priority.
* The chart does not deploy ingress controllers or external Gateway implementations beyond Envoy Gateway itself.
* Gateway API CRDs and Envoy Gateway CRDs come from the upstream dependency chart by default.
* Service defaults remain `ClusterIP` to keep exposure explicit and environment-controlled.
* The upstream dependency key is `envoy-gateway` in this wrapper chart. The previous camelCase key `envoyGateway` is intentionally not supported because it produced invalid mixed-case Kubernetes resource names in the upstream certgen hooks.

### Bootstrap resources

* The chart can optionally bootstrap:
  * `GatewayClass` (`bootstrap.gatewayClass.*`)
  * `EnvoyProxy` (`bootstrap.envoyProxy.*`)
  * `Gateway` (`bootstrap.gateway.*`)
* Defaults are wired for a minimal internal baseline:
  * `GatewayClass` controller: `gateway.envoyproxy.io/gatewayclass-controller`
  * `EnvoyProxy` provider: Kubernetes
  * Envoy data-plane service type: `ClusterIP`
  * `Gateway` listener: HTTP on port `80`

### Migration notes (Ingress NGINX -> Gateway API)

* Keep ingress-nginx and Envoy Gateway in parallel during migration.
* Create `HTTPRoute` resources per workload and attach them to the new `Gateway`.
* After route parity is verified, decommission ingress resources and ingress-nginx incrementally.

### Security and operations baseline

* Avoid `LoadBalancer` defaults; expose north-south traffic through platform-specific edge components.
* Keep CRD upgrades explicit and coordinated with Envoy Gateway upgrades.
* Prefer environment-specific overrides through values files instead of editing chart templates.
