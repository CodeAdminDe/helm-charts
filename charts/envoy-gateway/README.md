

# envoy-gateway

![Version: 0.4.3](https://img.shields.io/badge/Version-0.4.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.7.0](https://img.shields.io/badge/AppVersion-v1.7.0-informational?style=flat-square)

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
    "mode": "raw",
    "name": "envoy-gateway",
    "namespace": "",
    "tls": {
      "certificates": [],
      "enabled": false,
      "listeners": [],
      "redirectHttpToHttps": {
        "annotations": {},
        "enabled": true,
        "labels": {},
        "name": "http-to-https",
        "statusCode": 301
      }
    }
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
			<td id="bootstrap--gateway--httpListener--allowedRoutes"><a href="./values.yaml#L150">bootstrap.gateway.httpListener.allowedRoutes</a></td>
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
			<td id="bootstrap--gateway--httpListener--enabled"><a href="./values.yaml#L144">bootstrap.gateway.httpListener.enabled</a></td>
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
			<td id="bootstrap--gateway--httpListener--name"><a href="./values.yaml#L146">bootstrap.gateway.httpListener.name</a></td>
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
			<td id="bootstrap--gateway--httpListener--port"><a href="./values.yaml#L148">bootstrap.gateway.httpListener.port</a></td>
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
			<td id="bootstrap--gateway--infrastructure--parametersRef--enabled"><a href="./values.yaml#L113">bootstrap.gateway.infrastructure.parametersRef.enabled</a></td>
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
			<td id="bootstrap--gateway--infrastructure--parametersRef--group"><a href="./values.yaml#L115">bootstrap.gateway.infrastructure.parametersRef.group</a></td>
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
			<td id="bootstrap--gateway--infrastructure--parametersRef--kind"><a href="./values.yaml#L117">bootstrap.gateway.infrastructure.parametersRef.kind</a></td>
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
			<td id="bootstrap--gateway--infrastructure--parametersRef--name"><a href="./values.yaml#L119">bootstrap.gateway.infrastructure.parametersRef.name</a></td>
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
			<td id="bootstrap--gateway--listeners"><a href="./values.yaml#L133">bootstrap.gateway.listeners</a></td>
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
			<td>Raw Gateway listeners. @description Used only when `bootstrap.gateway.mode=raw`. Keep this path for advanced/manual listener definitions.
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
			<td id="bootstrap--gateway--mode"><a href="./values.yaml#L108">bootstrap.gateway.mode</a></td>
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
			<td>Gateway rendering mode. @description Use `raw` to manage `bootstrap.gateway.listeners` directly. Use `managed` to let this chart build opinionated HTTP/HTTPS listeners, redirect handling, and optional cert-manager Certificates.</td>
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
			<td id="bootstrap--gateway--tls--certificates"><a href="./values.yaml#L208">bootstrap.gateway.tls.certificates</a></td>
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
			<td id="bootstrap--gateway--tls--enabled"><a href="./values.yaml#L157">bootstrap.gateway.tls.enabled</a></td>
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
			<td>Enable opinionated managed TLS handling. @description Requires `bootstrap.gateway.mode=managed`. When enabled, the chart renders HTTPS listeners, optional cert-manager Certificates, and by default a central HTTP->HTTPS redirect route.</td>
		</tr>
		<tr>
			<td id="bootstrap--gateway--tls--listeners"><a href="./values.yaml#L192">bootstrap.gateway.tls.listeners</a></td>
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
			<td>Managed HTTPS listeners. @description Each listener terminates TLS with the referenced secret and should normally cover either an exact hostname or a wildcard domain. App-owner HTTPRoutes should bind to these HTTPS listeners, not the managed HTTP redirect listener.
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
			<td id="bootstrap--gateway--tls--redirectHttpToHttps--annotations"><a href="./values.yaml#L168">bootstrap.gateway.tls.redirectHttpToHttps.annotations</a></td>
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
			<td id="bootstrap--gateway--tls--redirectHttpToHttps--enabled"><a href="./values.yaml#L161">bootstrap.gateway.tls.redirectHttpToHttps.enabled</a></td>
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
			<td id="bootstrap--gateway--tls--redirectHttpToHttps--labels"><a href="./values.yaml#L170">bootstrap.gateway.tls.redirectHttpToHttps.labels</a></td>
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
			<td id="bootstrap--gateway--tls--redirectHttpToHttps--name"><a href="./values.yaml#L163">bootstrap.gateway.tls.redirectHttpToHttps.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"http-to-https"
</pre>
</div>
			</td>
			<td>Redirect route name.</td>
		</tr>
		<tr>
			<td id="bootstrap--gateway--tls--redirectHttpToHttps--statusCode"><a href="./values.yaml#L166">bootstrap.gateway.tls.redirectHttpToHttps.statusCode</a></td>
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
			<td id="cnps"><a href="./values.yaml#L212">cnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "certgen": {
    "egress": {
      "dns": {
        "enabled": true
      },
      "extraRules": [],
      "kubeApiServer": {
        "enabled": true,
        "port": 6443
      }
    }
  },
  "controlPlane": {
    "egress": {
      "dns": {
        "enabled": true
      },
      "extraRules": [],
      "kubeApiServer": {
        "enabled": true,
        "port": 6443
      }
    },
    "ingress": {
      "extraRules": [],
      "metrics": {
        "enabled": false,
        "fromEndpoints": [],
        "fromEntities": [],
        "port": 19001
      },
      "proxy": {
        "enabled": true,
        "fromEndpoints": [],
        "fromEntities": [
          "cluster"
        ],
        "ports": [
          18000,
          18001,
          18002
        ]
      },
      "webhook": {
        "enabled": true,
        "fromEndpoints": [],
        "fromEntities": [
          "cluster"
        ],
        "port": 9443
      }
    }
  },
  "enabled": false
}
</pre>
</div>
			</td>
			<td>Optional chart-local CiliumNetworkPolicies for Envoy Gateway controller resources. @description These policies intentionally protect only the known static controller resources managed by this chart integration: the Envoy Gateway control plane and the upstream `certgen` hook job. They do not attempt to govern generic EnvoyProxy dataplane namespaces or backend application traffic.</td>
		</tr>
		<tr>
			<td id="cnps--certgen--egress--dns--enabled"><a href="./values.yaml#L305">cnps.certgen.egress.dns.enabled</a></td>
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
			<td>Allow DNS egress from the upstream `certgen` hook job to kube-dns.</td>
		</tr>
		<tr>
			<td id="cnps--certgen--egress--extraRules"><a href="./values.yaml#L318">cnps.certgen.egress.extraRules</a></td>
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
			<td>Additional raw egress rules appended to the `certgen` CNP.
```yaml
extraRules:
  - toEntities:
      - world
    toPorts:
      - ports:
          - port: "443"
            protocol: TCP
```</td>
		</tr>
		<tr>
			<td id="cnps--certgen--egress--kubeApiServer--enabled"><a href="./values.yaml#L298">cnps.certgen.egress.kubeApiServer.enabled</a></td>
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
			<td>Allow egress from the upstream `certgen` hook job to the Kubernetes API server.</td>
		</tr>
		<tr>
			<td id="cnps--certgen--egress--kubeApiServer--port"><a href="./values.yaml#L301">cnps.certgen.egress.kubeApiServer.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
6443
</pre>
</div>
			</td>
			<td>Kubernetes API server port used by the upstream `certgen` hook job. @description Defaults to `6443`, which is the common kube-apiserver port. Override if your cluster exposes the API server to pods on a different port.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--egress--dns--enabled"><a href="./values.yaml#L279">cnps.controlPlane.egress.dns.enabled</a></td>
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
			<td>Allow DNS egress from the control plane to kube-dns.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--egress--extraRules"><a href="./values.yaml#L292">cnps.controlPlane.egress.extraRules</a></td>
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
			<td>Additional raw egress rules appended to the control-plane CNP.
```yaml
extraRules:
  - toCIDRSet:
      - cidr: 10.0.0.0/24
    toPorts:
      - ports:
          - port: "443"
            protocol: TCP
```</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--egress--kubeApiServer--enabled"><a href="./values.yaml#L272">cnps.controlPlane.egress.kubeApiServer.enabled</a></td>
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
			<td>Allow egress from the control plane to the Kubernetes API server.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--egress--kubeApiServer--port"><a href="./values.yaml#L275">cnps.controlPlane.egress.kubeApiServer.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
6443
</pre>
</div>
			</td>
			<td>Kubernetes API server port used by the Envoy Gateway control plane. @description Defaults to `6443`, which is the common kube-apiserver port. Override if your cluster exposes the API server to pods on a different port.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--extraRules"><a href="./values.yaml#L267">cnps.controlPlane.ingress.extraRules</a></td>
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
			<td>Additional raw ingress rules appended to the control-plane CNP.
```yaml
extraRules:
  - fromEndpoints:
      - matchLabels:
          app.kubernetes.io/name: prometheus
          io.kubernetes.pod.namespace: monitoring
    toPorts:
      - ports:
          - port: "19001"
            protocol: TCP
```</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--metrics--enabled"><a href="./values.yaml#L246">cnps.controlPlane.ingress.metrics.enabled</a></td>
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
			<td>Allow ingress to the control-plane metrics endpoint. @description Disabled by default. When enabled, at least one explicit source must be set via `fromEntities` and/or `fromEndpoints`.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--metrics--fromEndpoints"><a href="./values.yaml#L250">cnps.controlPlane.ingress.metrics.fromEndpoints</a></td>
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
			<td>Optional endpoint selectors for metrics scraping.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--metrics--fromEntities"><a href="./values.yaml#L248">cnps.controlPlane.ingress.metrics.fromEntities</a></td>
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
			<td>Allowed Cilium entities for metrics scraping.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--metrics--port"><a href="./values.yaml#L252">cnps.controlPlane.ingress.metrics.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
19001
</pre>
</div>
			</td>
			<td>Metrics port.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--proxy--enabled"><a href="./values.yaml#L220">cnps.controlPlane.ingress.proxy.enabled</a></td>
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
			<td>Allow cluster-internal dataplane/control-plane traffic to xDS, ratelimit, and wasm ports.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--proxy--fromEndpoints"><a href="./values.yaml#L225">cnps.controlPlane.ingress.proxy.fromEndpoints</a></td>
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
			<td>Optional endpoint selectors for control-plane traffic.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--proxy--fromEntities"><a href="./values.yaml#L222">cnps.controlPlane.ingress.proxy.fromEntities</a></td>
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
			<td>Allowed Cilium entities for control-plane traffic.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--proxy--ports"><a href="./values.yaml#L227">cnps.controlPlane.ingress.proxy.ports</a></td>
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
			<td>Allowed control-plane ports for xDS, ratelimit, and wasm.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--webhook--enabled"><a href="./values.yaml#L234">cnps.controlPlane.ingress.webhook.enabled</a></td>
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
			<td>Allow cluster-internal traffic to the topology-injector webhook.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--webhook--fromEndpoints"><a href="./values.yaml#L239">cnps.controlPlane.ingress.webhook.fromEndpoints</a></td>
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
			<td>Optional endpoint selectors for webhook traffic.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--webhook--fromEntities"><a href="./values.yaml#L236">cnps.controlPlane.ingress.webhook.fromEntities</a></td>
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
			<td>Allowed Cilium entities for webhook traffic.</td>
		</tr>
		<tr>
			<td id="cnps--controlPlane--ingress--webhook--port"><a href="./values.yaml#L241">cnps.controlPlane.ingress.webhook.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
9443
</pre>
</div>
			</td>
			<td>Webhook port.</td>
		</tr>
		<tr>
			<td id="cnps--enabled"><a href="./values.yaml#L214">cnps.enabled</a></td>
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
			<td>Enable chart-local CiliumNetworkPolicies.</td>
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
* `bootstrap.gateway.mode=managed` enables the opinionated TLS path:
  * chart-managed HTTPS listeners
  * optional cert-manager `Certificate` resources in the Gateway namespace
  * central HTTP to HTTPS redirect handling via `HTTPRoute`
* `bootstrap.gateway.mode=raw` remains the escape hatch for advanced/manual listener definitions.

### Managed TLS model

* TLS terminates on Gateway listeners, not on app-owner `HTTPRoute`s.
* App-owner routes should bind to the HTTPS listener `sectionName` values from `bootstrap.gateway.tls.listeners[*].name`.
* The managed HTTP listener is reserved for the central redirect route and defaults to `allowedRoutes.namespaces.from=Same` so app namespaces cannot bypass HTTPS accidentally.
* Wildcard listeners such as `*.prod.example.com` reduce hostname sprawl, but apex hostnames like `prod.example.com` still need their own listener coverage.
* cert-manager integration is implemented via explicit `Certificate` resources instead of Gateway annotations so multiple wildcard/exact certificates and different issuers can be handled deterministically.
* Managed certificates are created in the Gateway namespace. Reusing a wildcard Secret from another namespace is intentionally out of scope for now; replicate it into the Gateway namespace or let cert-manager issue it there with the same `ClusterIssuer`.

### Migration notes (Ingress NGINX -> Gateway API)

* Keep ingress-nginx and Envoy Gateway in parallel during migration.
* Create `HTTPRoute` resources per workload and attach them to the new `Gateway`.
* After route parity is verified, decommission ingress resources and ingress-nginx incrementally.

### Security and operations baseline

* Avoid `LoadBalancer` defaults; expose north-south traffic through platform-specific edge components.
* Keep CRD upgrades explicit and coordinated with Envoy Gateway upgrades.
* Prefer environment-specific overrides through values files instead of editing chart templates.
* Optional chart-local `CiliumNetworkPolicy` resources protect only the Envoy Gateway control plane and the upstream `certgen` hook job.
* The chart intentionally does not generate generic dataplane policies for arbitrary `Gateway` namespaces or backend applications. Keep dataplane isolation as a separate operator concern.
* Metrics ingress via the chart-local CNPs stays disabled by default and must be opened explicitly with allowed scrape sources.
