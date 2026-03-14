

# coder

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.31.5](https://img.shields.io/badge/AppVersion-v2.31.5-informational?style=flat-square)

A Helm chart for deploying Coder on Kubernetes.

**Homepage:** <https://github.com/CodeAdminDe/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Frederic Roggon | <frederic.roggon@codeadmin.de> | <https://github.com/CodeAdminDe> |

## Requirements

Kubernetes: `>=1.24.0`

| Repository | Name | Version |
|------------|------|---------|
| https://codeadminde.github.io/helm-charts | libchart-cnps(libchart-cnps) | 0.2.1 |

## TL;DR

You don't want to read through the docs? That's the quick and dirty way:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
helm install coder codeadminde/coder
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

To install the chart with the release name `coder`

```bash
helm install coder codeadminde/coder
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `coder`

```bash
helm uninstall coder
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
> helm install coder codeadminde/coder -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install coder --set key=value --set keyTwo=secondValue codeadminde/coder
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
			<td id="additionalEnvSecrets"><a href="./values.yaml#L297">additionalEnvSecrets</a></td>
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
			<td>Additional secret-backed environment variables appended after the chart-managed Coder env vars. @description Supports either map form (`ENV_NAME: secret-name` or `ENV_NAME: {secretName: ..., secretKey: ...}`) or list form (`[{name, secretName, secretKey}]`).</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L358">affinity</a></td>
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
			<td>Workload affinity.</td>
		</tr>
		<tr>
			<td id="applyHealthChecks"><a href="./values.yaml#L196">applyHealthChecks</a></td>
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
			<td>Apply health probes from values.</td>
		</tr>
		<tr>
			<td id="applySecurity"><a href="./values.yaml#L193">applySecurity</a></td>
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
			<td>Apply default pod and container security settings.</td>
		</tr>
		<tr>
			<td id="args"><a href="./values.yaml#L281">args</a></td>
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
			<td>Optional args override for the Coder container.</td>
		</tr>
		<tr>
			<td id="autoscaling"><a href="./values.yaml#L254">autoscaling</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "maxReplicas": 3,
  "minReplicas": 1,
  "targetCPUUtilizationPercentage": 80
}
</pre>
</div>
			</td>
			<td>HorizontalPodAutoscaler configuration.</td>
		</tr>
		<tr>
			<td id="cnps"><a href="./values.yaml#L311">cnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "appTraffic": {
    "egress": {
      "allow": true,
      "extraRules": [],
      "toEndpoints": [],
      "toEntities": [
        "kube-apiserver",
        "world"
      ],
      "toFQDNs": [],
      "toPorts": [
        {
          "port": "443",
          "protocol": "TCP"
        },
        {
          "port": "6443",
          "protocol": "TCP"
        }
      ]
    },
    "ingress": {
      "allow": true,
      "fromEndpoints": [],
      "fromEntities": []
    }
  },
  "cnpgTraffic": {
    "instanceExtraEgress": []
  }
}
</pre>
</div>
			</td>
			<td>App-specific CiliumNetworkPolicies settings.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L326">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow outbound traffic from the Coder webserver pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--extraRules"><a href="./values.yaml#L343">cnps.appTraffic.egress.extraRules</a></td>
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
			<td>Additional raw Cilium egress rules appended as-is.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEndpoints"><a href="./values.yaml#L328">cnps.appTraffic.egress.toEndpoints</a></td>
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
			<td>Additional endpoint selectors for egress.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEntities"><a href="./values.yaml#L333">cnps.appTraffic.egress.toEntities</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "kube-apiserver",
  "world"
]
</pre>
</div>
			</td>
			<td>Cilium entities allowed for general egress. @description The chart defaults to `kube-apiserver` and `world` because Coder needs Kubernetes API access and commonly connects to external identity and Git providers.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toFQDNs"><a href="./values.yaml#L330">cnps.appTraffic.egress.toFQDNs</a></td>
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
			<td>Additional fully-qualified domain names for egress, for example OIDC providers.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toPorts"><a href="./values.yaml#L337">cnps.appTraffic.egress.toPorts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "port": "443",
    "protocol": "TCP"
  },
  {
    "port": "6443",
    "protocol": "TCP"
  }
]
</pre>
</div>
			</td>
			<td>Additional egress ports for the general egress rules. The chart appends the external database port automatically when CNPG is disabled.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L318">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress traffic to the Coder webserver pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEndpoints"><a href="./values.yaml#L321">cnps.appTraffic.ingress.fromEndpoints</a></td>
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
			<td>Explicit endpoint selectors allowed to reach the Coder webserver. @description When `ingress.enabled=true` and this list is empty, the chart assumes an ingress-nginx controller with labels `app.kubernetes.io/name=ingress-nginx` in namespace `ingress-nginx`. Override this list when your ingress controller uses different labels or a different namespace.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEntities"><a href="./values.yaml#L323">cnps.appTraffic.ingress.fromEntities</a></td>
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
			<td>Explicit Cilium entities allowed to reach the Coder webserver.</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic"><a href="./values.yaml#L313">cnps.cnpgTraffic</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "instanceExtraEgress": []
}
</pre>
</div>
			</td>
			<td>Additional CNPG Cilium policy tuning used by libchart-cnps when `includeCnpgPolicies=true`.</td>
		</tr>
		<tr>
			<td id="coder"><a href="./values.yaml#L21">coder</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "accessUrl": "",
  "oauth2": {
    "githubDefaultProviderEnabled": false
  },
  "pprof": {
    "address": "",
    "enabled": false
  },
  "prometheus": {
    "address": "",
    "enabled": false
  },
  "provisionerDaemon": {
    "pskSecret": {
      "key": "CODER_PROVISIONER_DAEMON_PSK",
      "name": ""
    }
  },
  "telemetry": {
    "enabled": false
  },
  "wildcardAccessUrl": ""
}
</pre>
</div>
			</td>
			<td>Coder application settings.</td>
		</tr>
		<tr>
			<td id="coder--accessUrl"><a href="./values.yaml#L23">coder.accessUrl</a></td>
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
			<td>Explicit public access URL (`CODER_ACCESS_URL`). When empty, the chart derives it from Gateway API, Ingress, or falls back to the in-cluster Service URL.</td>
		</tr>
		<tr>
			<td id="coder--oauth2--githubDefaultProviderEnabled"><a href="./values.yaml#L29">coder.oauth2.githubDefaultProviderEnabled</a></td>
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
			<td>Enable the built-in default GitHub OAuth2 provider (`CODER_OAUTH2_GITHUB_DEFAULT_PROVIDER_ENABLE`). @description The chart defaults this to `false`, matching the upstream production recommendation to avoid shipping a public default provider unintentionally.</td>
		</tr>
		<tr>
			<td id="coder--pprof--address"><a href="./values.yaml#L43">coder.pprof.address</a></td>
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
			<td>Override the pprof bind address (`CODER_PPROF_ADDRESS`). Defaults to `0.0.0.0:6060` when profiling is enabled and this is left empty.</td>
		</tr>
		<tr>
			<td id="coder--pprof--enabled"><a href="./values.yaml#L41">coder.pprof.enabled</a></td>
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
			<td>Enable the pprof debug endpoint (`CODER_PPROF_ENABLE`).</td>
		</tr>
		<tr>
			<td id="coder--prometheus--address"><a href="./values.yaml#L38">coder.prometheus.address</a></td>
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
			<td>Override the Prometheus bind address (`CODER_PROMETHEUS_ADDRESS`). Defaults to `0.0.0.0:2112` when metrics are enabled and this is left empty.</td>
		</tr>
		<tr>
			<td id="coder--prometheus--enabled"><a href="./values.yaml#L36">coder.prometheus.enabled</a></td>
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
			<td>Enable the internal Prometheus endpoint (`CODER_PROMETHEUS_ENABLE`).</td>
		</tr>
		<tr>
			<td id="coder--provisionerDaemon--pskSecret--key"><a href="./values.yaml#L49">coder.provisionerDaemon.pskSecret.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"CODER_PROVISIONER_DAEMON_PSK"
</pre>
</div>
			</td>
			<td>Secret key containing `CODER_PROVISIONER_DAEMON_PSK`.</td>
		</tr>
		<tr>
			<td id="coder--provisionerDaemon--pskSecret--name"><a href="./values.yaml#L47">coder.provisionerDaemon.pskSecret.name</a></td>
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
			<td>Existing Secret containing `CODER_PROVISIONER_DAEMON_PSK`.</td>
		</tr>
		<tr>
			<td id="coder--telemetry--enabled"><a href="./values.yaml#L33">coder.telemetry.enabled</a></td>
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
			<td>Enable upstream telemetry (`CODER_TELEMETRY_ENABLE`). @description The chart defaults this to `false` so repo deployments do not emit vendor telemetry unless intentionally enabled.</td>
		</tr>
		<tr>
			<td id="coder--wildcardAccessUrl"><a href="./values.yaml#L25">coder.wildcardAccessUrl</a></td>
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
			<td>Wildcard access host for workspace apps and port forwards (`CODER_WILDCARD_ACCESS_URL`), for example `*.coder.example.com`.</td>
		</tr>
		<tr>
			<td id="command"><a href="./values.yaml#L278">command</a></td>
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
			<td>Optional command override for the Coder container.</td>
		</tr>
		<tr>
			<td id="database"><a href="./values.yaml#L161">database</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "externalSecret": {
    "name": "coder-db-url",
    "urlKey": "url"
  },
  "port": 5432,
  "useCnpgCluster": {
    "appConnectionSecretName": "",
    "clusterName": "",
    "enabled": false,
    "port": 5432,
    "secretKeys": {
      "connectionString": "uri"
    }
  }
}
</pre>
</div>
			</td>
			<td>Preferred database connection mode.</td>
		</tr>
		<tr>
			<td id="database--externalSecret--name"><a href="./values.yaml#L167">database.externalSecret.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"coder-db-url"
</pre>
</div>
			</td>
			<td>Existing Secret containing the PostgreSQL connection URL in vendor-compatible form. @description The official Coder docs use a Secret named `coder-db-url` with a `url` key. This chart follows that pattern when CNPG integration is disabled.</td>
		</tr>
		<tr>
			<td id="database--externalSecret--urlKey"><a href="./values.yaml#L169">database.externalSecret.urlKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"url"
</pre>
</div>
			</td>
			<td>Secret key containing the PostgreSQL connection URL.</td>
		</tr>
		<tr>
			<td id="database--port"><a href="./values.yaml#L163">database.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
5432
</pre>
</div>
			</td>
			<td>PostgreSQL port used for egress policy rendering when `database.useCnpgCluster.enabled=false`.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--appConnectionSecretName"><a href="./values.yaml#L176">database.useCnpgCluster.appConnectionSecretName</a></td>
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
			<td>Optional explicit CNPG app secret name override.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--clusterName"><a href="./values.yaml#L174">database.useCnpgCluster.clusterName</a></td>
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
			<td>CNPG cluster name. The default app secret resolves to `<clusterName>-app`.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--enabled"><a href="./values.yaml#L172">database.useCnpgCluster.enabled</a></td>
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
			<td>Use a CloudNativePG cluster app secret instead of a standalone external connection URL secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--port"><a href="./values.yaml#L178">database.useCnpgCluster.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
5432
</pre>
</div>
			</td>
			<td>PostgreSQL port exposed by the CNPG cluster.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--connectionString"><a href="./values.yaml#L181">database.useCnpgCluster.secretKeys.connectionString</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"uri"
</pre>
</div>
			</td>
			<td>CNPG app secret key containing the PostgreSQL connection string.</td>
		</tr>
		<tr>
			<td id="envFromConfigMaps"><a href="./values.yaml#L290">envFromConfigMaps</a></td>
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
			<td>Additional ConfigMap refs exposed with `envFrom`.</td>
		</tr>
		<tr>
			<td id="envFromSecrets"><a href="./values.yaml#L287">envFromSecrets</a></td>
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
			<td>Additional Secret refs exposed with `envFrom`.</td>
		</tr>
		<tr>
			<td id="extraEnv"><a href="./values.yaml#L293">extraEnv</a></td>
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
			<td>Additional non-secret environment variables appended after the chart-managed Coder env vars.</td>
		</tr>
		<tr>
			<td id="extraVolumeMounts"><a href="./values.yaml#L303">extraVolumeMounts</a></td>
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
			<td>Additional volume mounts for the main Coder container.</td>
		</tr>
		<tr>
			<td id="extraVolumes"><a href="./values.yaml#L300">extraVolumes</a></td>
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
			<td>Additional volumes mounted into the Coder pod.</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L6">fullnameOverride</a></td>
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
			<td id="gatewayApi"><a href="./values.yaml#L96">gatewayApi</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "backendRefs": [],
  "controllerSelector": {
    "app.kubernetes.io/name": "envoy-gateway",
    "io.kubernetes.pod.namespace": "envoy-gateway-system"
  },
  "enabled": false,
  "filters": [],
  "hostnames": [
    "coder.example.com"
  ],
  "labels": {},
  "matches": [
    {
      "path": {
        "type": "PathPrefix",
        "value": "/"
      }
    }
  ],
  "parentRefs": [
    {
      "name": "envoy-gateway",
      "namespace": "envoy-gateway-system",
      "sectionName": "http"
    }
  ],
  "scheme": "https",
  "wildcardHostname": ""
}
</pre>
</div>
			</td>
			<td>Gateway API HTTPRoute configuration.</td>
		</tr>
		<tr>
			<td id="gatewayApi--annotations"><a href="./values.yaml#L107">gatewayApi.annotations</a></td>
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
			<td>HTTPRoute annotations.</td>
		</tr>
		<tr>
			<td id="gatewayApi--backendRefs"><a href="./values.yaml#L128">gatewayApi.backendRefs</a></td>
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
			<td>Optional backend references. Defaults to the main Coder service when empty.</td>
		</tr>
		<tr>
			<td id="gatewayApi--controllerSelector"><a href="./values.yaml#L103">gatewayApi.controllerSelector</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "app.kubernetes.io/name": "envoy-gateway",
  "io.kubernetes.pod.namespace": "envoy-gateway-system"
}
</pre>
</div>
			</td>
			<td>Labels for the Gateway API controller pods, used to generate default CiliumNetworkPolicies ingress rules. If empty, you must provide explicit `cnps.appTraffic.ingress.fromEndpoints` when `gatewayApi.enabled=true`.</td>
		</tr>
		<tr>
			<td id="gatewayApi--enabled"><a href="./values.yaml#L98">gatewayApi.enabled</a></td>
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
			<td>Enable HTTPRoute resource creation.</td>
		</tr>
		<tr>
			<td id="gatewayApi--filters"><a href="./values.yaml#L126">gatewayApi.filters</a></td>
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
			<td>Optional filters for the HTTPRoute rule.</td>
		</tr>
		<tr>
			<td id="gatewayApi--hostnames"><a href="./values.yaml#L116">gatewayApi.hostnames</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "coder.example.com"
]
</pre>
</div>
			</td>
			<td>Hostnames served by this route.</td>
		</tr>
		<tr>
			<td id="gatewayApi--labels"><a href="./values.yaml#L109">gatewayApi.labels</a></td>
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
			<td>HTTPRoute labels.</td>
		</tr>
		<tr>
			<td id="gatewayApi--matches"><a href="./values.yaml#L121">gatewayApi.matches</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "path": {
      "type": "PathPrefix",
      "value": "/"
    }
  }
]
</pre>
</div>
			</td>
			<td>Match rules for the default HTTPRoute rule.</td>
		</tr>
		<tr>
			<td id="gatewayApi--parentRefs"><a href="./values.yaml#L111">gatewayApi.parentRefs</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "name": "envoy-gateway",
    "namespace": "envoy-gateway-system",
    "sectionName": "http"
  }
]
</pre>
</div>
			</td>
			<td>ParentRefs for the HTTPRoute.</td>
		</tr>
		<tr>
			<td id="gatewayApi--scheme"><a href="./values.yaml#L100">gatewayApi.scheme</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https"
</pre>
</div>
			</td>
			<td>Public URL scheme used when deriving `coder.accessUrl` from Gateway API.</td>
		</tr>
		<tr>
			<td id="gatewayApi--wildcardHostname"><a href="./values.yaml#L119">gatewayApi.wildcardHostname</a></td>
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
			<td>Optional wildcard hostname for workspace app subdomains. When empty, the chart falls back to `coder.wildcardAccessUrl` if set.</td>
		</tr>
		<tr>
			<td id="image"><a href="./values.yaml#L9">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "ghcr.io/coder/coder",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>Coder container image configuration.</td>
		</tr>
		<tr>
			<td id="image--pullPolicy"><a href="./values.yaml#L13">image.pullPolicy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"IfNotPresent"
</pre>
</div>
			</td>
			<td>Image pull policy.</td>
		</tr>
		<tr>
			<td id="image--repository"><a href="./values.yaml#L11">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"ghcr.io/coder/coder"
</pre>
</div>
			</td>
			<td>Image repository.</td>
		</tr>
		<tr>
			<td id="image--tag"><a href="./values.yaml#L15">image.tag</a></td>
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
			<td>Image tag override (defaults to `.Chart.AppVersion` when empty).</td>
		</tr>
		<tr>
			<td id="imagePullSecrets"><a href="./values.yaml#L18">imagePullSecrets</a></td>
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
			<td>Image pull secrets for private registries.</td>
		</tr>
		<tr>
			<td id="ingress"><a href="./values.yaml#L67">ingress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "className": "",
  "enabled": false,
  "hosts": [
    {
      "host": "coder.example.com",
      "paths": [
        {
          "path": "/",
          "pathType": "Prefix"
        }
      ]
    }
  ],
  "secureDefaults": {
    "annotations": {
      "nginx.ingress.kubernetes.io/proxy-buffering": "off",
      "nginx.ingress.kubernetes.io/proxy-http-version": "1.1",
      "nginx.ingress.kubernetes.io/proxy-read-timeout": "3600",
      "nginx.ingress.kubernetes.io/proxy-request-buffering": "off",
      "nginx.ingress.kubernetes.io/proxy-send-timeout": "3600"
    },
    "enabled": true
  },
  "tls": [],
  "wildcardHost": ""
}
</pre>
</div>
			</td>
			<td>Ingress configuration (ingress-nginx style).</td>
		</tr>
		<tr>
			<td id="ingress--annotations"><a href="./values.yaml#L73">ingress.annotations</a></td>
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
			<td>Additional ingress annotations.</td>
		</tr>
		<tr>
			<td id="ingress--className"><a href="./values.yaml#L71">ingress.className</a></td>
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
			<td>Ingress class name.</td>
		</tr>
		<tr>
			<td id="ingress--enabled"><a href="./values.yaml#L69">ingress.enabled</a></td>
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
			<td>Enable ingress resource creation.</td>
		</tr>
		<tr>
			<td id="ingress--hosts"><a href="./values.yaml#L85">ingress.hosts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "host": "coder.example.com",
    "paths": [
      {
        "path": "/",
        "pathType": "Prefix"
      }
    ]
  }
]
</pre>
</div>
			</td>
			<td>Host/path rules.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults"><a href="./values.yaml#L75">ingress.secureDefaults</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {
    "nginx.ingress.kubernetes.io/proxy-buffering": "off",
    "nginx.ingress.kubernetes.io/proxy-http-version": "1.1",
    "nginx.ingress.kubernetes.io/proxy-read-timeout": "3600",
    "nginx.ingress.kubernetes.io/proxy-request-buffering": "off",
    "nginx.ingress.kubernetes.io/proxy-send-timeout": "3600"
  },
  "enabled": true
}
</pre>
</div>
			</td>
			<td>Secure default ingress annotations for websocket and long-running session traffic.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--enabled"><a href="./values.yaml#L77">ingress.secureDefaults.enabled</a></td>
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
			<td>Enable secure default ingress annotations.</td>
		</tr>
		<tr>
			<td id="ingress--tls"><a href="./values.yaml#L93">ingress.tls</a></td>
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
			<td>TLS host/secret blocks.</td>
		</tr>
		<tr>
			<td id="ingress--wildcardHost"><a href="./values.yaml#L91">ingress.wildcardHost</a></td>
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
			<td>Optional wildcard host rule for workspace app subdomains. When empty, the chart falls back to `coder.wildcardAccessUrl` if set.</td>
		</tr>
		<tr>
			<td id="initContainers"><a href="./values.yaml#L284">initContainers</a></td>
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
			<td>Optional init containers added to the Coder pod.</td>
		</tr>
		<tr>
			<td id="libchartCnps"><a href="./values.yaml#L306">libchartCnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "includeCnpgPolicies": false
}
</pre>
</div>
			</td>
			<td>CiliumNetworkPolicies dependency toggle.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L226">livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "httpGet": {
    "path": "/healthz",
    "port": "http"
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Liveness probe for the main Coder container.</td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L5">nameOverride</a></td>
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
			<td id="nodeSelector"><a href="./values.yaml#L352">nodeSelector</a></td>
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
			<td>Workload node selector.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L346">podAnnotations</a></td>
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
			<td>Pod annotations.</td>
		</tr>
		<tr>
			<td id="podDisruptionBudget"><a href="./values.yaml#L261">podDisruptionBudget</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "minAvailable": 1
}
</pre>
</div>
			</td>
			<td>PodDisruptionBudget configuration.</td>
		</tr>
		<tr>
			<td id="podDisruptionBudget--enabled"><a href="./values.yaml#L263">podDisruptionBudget.enabled</a></td>
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
			<td>Create a PodDisruptionBudget.</td>
		</tr>
		<tr>
			<td id="podDisruptionBudget--minAvailable"><a href="./values.yaml#L265">podDisruptionBudget.minAvailable</a></td>
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
			<td>Minimum number of available pods during voluntary disruptions.</td>
		</tr>
		<tr>
			<td id="podLabels"><a href="./values.yaml#L349">podLabels</a></td>
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
			<td>Pod labels.</td>
		</tr>
		<tr>
			<td id="podSecurityContext"><a href="./values.yaml#L199">podSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "fsGroup": 1000
}
</pre>
</div>
			</td>
			<td>Pod-level security context for the Coder workload.</td>
		</tr>
		<tr>
			<td id="priorityClassName"><a href="./values.yaml#L275">priorityClassName</a></td>
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
			<td>Optional PriorityClass assigned to Coder pods.</td>
		</tr>
		<tr>
			<td id="rbac"><a href="./values.yaml#L145">rbac</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "create": true,
  "enableDeployments": true,
  "extraRules": [],
  "namespace": "",
  "workspaceNamespaces": [],
  "workspacePerms": true
}
</pre>
</div>
			</td>
			<td>Namespace-scoped RBAC for Kubernetes workspace provisioning.</td>
		</tr>
		<tr>
			<td id="rbac--create"><a href="./values.yaml#L147">rbac.create</a></td>
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
			<td>Create Role and RoleBinding resources for the release namespace and optional extra workspace namespaces.</td>
		</tr>
		<tr>
			<td id="rbac--enableDeployments"><a href="./values.yaml#L153">rbac.enableDeployments</a></td>
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
			<td>Additionally grant Deployment management permissions for templates that create Deployments.</td>
		</tr>
		<tr>
			<td id="rbac--extraRules"><a href="./values.yaml#L155">rbac.extraRules</a></td>
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
			<td>Additional RBAC rules appended to each generated workspace Role.</td>
		</tr>
		<tr>
			<td id="rbac--namespace"><a href="./values.yaml#L149">rbac.namespace</a></td>
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
			<td>Namespace override for the primary workspace Role and RoleBinding. Empty means the release namespace.</td>
		</tr>
		<tr>
			<td id="rbac--workspaceNamespaces"><a href="./values.yaml#L158">rbac.workspaceNamespaces</a></td>
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
			<td>Additional namespaces that should receive the same workspace Role/RoleBinding. @description Each entry can be either a namespace string or an object with `name`, `workspacePerms`, `enableDeployments`, and `extraRules`.</td>
		</tr>
		<tr>
			<td id="rbac--workspacePerms"><a href="./values.yaml#L151">rbac.workspacePerms</a></td>
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
			<td>Grant permissions to manage Pods and PersistentVolumeClaims for workspaces.</td>
		</tr>
		<tr>
			<td id="readinessProbe"><a href="./values.yaml#L236">readinessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "httpGet": {
    "path": "/healthz",
    "port": "http"
  },
  "initialDelaySeconds": 10,
  "periodSeconds": 5,
  "timeoutSeconds": 3
}
</pre>
</div>
			</td>
			<td>Readiness probe for the main Coder container.</td>
		</tr>
		<tr>
			<td id="replicaCount"><a href="./values.yaml#L2">replicaCount</a></td>
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
			<td>Number of Coder application pod replicas.</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L246">resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "memory": "512Mi"
  },
  "requests": {
    "cpu": "100m",
    "memory": "256Mi"
  }
}
</pre>
</div>
			</td>
			<td>Resource requests/limits.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L268">runtimeClass</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pods": "",
  "tests": ""
}
</pre>
</div>
			</td>
			<td>RuntimeClass names.</td>
		</tr>
		<tr>
			<td id="runtimeClass--pods"><a href="./values.yaml#L270">runtimeClass.pods</a></td>
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
			<td>RuntimeClass for workload pods.</td>
		</tr>
		<tr>
			<td id="runtimeClass--tests"><a href="./values.yaml#L272">runtimeClass.tests</a></td>
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
			<td>RuntimeClass for Helm test pods.</td>
		</tr>
		<tr>
			<td id="securityContext"><a href="./values.yaml#L203">securityContext</a></td>
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
  "runAsGroup": 1000,
  "runAsNonRoot": true,
  "runAsUser": 1000,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>Container-level security context for the Coder workload.</td>
		</tr>
		<tr>
			<td id="service"><a href="./values.yaml#L52">service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "labels": {},
  "port": 80,
  "targetPort": 8080,
  "targetProtocol": "TCP",
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>Kubernetes Service for the main Coder UI/API.</td>
		</tr>
		<tr>
			<td id="service--annotations"><a href="./values.yaml#L56">service.annotations</a></td>
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
			<td>Service annotations.</td>
		</tr>
		<tr>
			<td id="service--labels"><a href="./values.yaml#L58">service.labels</a></td>
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
			<td>Service labels.</td>
		</tr>
		<tr>
			<td id="service--port"><a href="./values.yaml#L60">service.port</a></td>
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
			<td>Service port exposed to the cluster.</td>
		</tr>
		<tr>
			<td id="service--targetPort"><a href="./values.yaml#L62">service.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
8080
</pre>
</div>
			</td>
			<td>Container target port used by Coder.</td>
		</tr>
		<tr>
			<td id="service--targetProtocol"><a href="./values.yaml#L64">service.targetProtocol</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"TCP"
</pre>
</div>
			</td>
			<td>Service protocol.</td>
		</tr>
		<tr>
			<td id="service--type"><a href="./values.yaml#L54">service.type</a></td>
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
			<td>Service type. This chart enforces `ClusterIP`.</td>
		</tr>
		<tr>
			<td id="serviceAccount"><a href="./values.yaml#L131">serviceAccount</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "automountServiceAccountToken": true,
  "create": true,
  "labels": {},
  "name": ""
}
</pre>
</div>
			</td>
			<td>ServiceAccount settings.</td>
		</tr>
		<tr>
			<td id="serviceAccount--annotations"><a href="./values.yaml#L135">serviceAccount.annotations</a></td>
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
			<td>ServiceAccount annotations.</td>
		</tr>
		<tr>
			<td id="serviceAccount--automountServiceAccountToken"><a href="./values.yaml#L142">serviceAccount.automountServiceAccountToken</a></td>
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
			<td>Automount the ServiceAccount token. @description Coder needs Kubernetes API access for workspace provisioning unless you supply equivalent credentials out-of-band.</td>
		</tr>
		<tr>
			<td id="serviceAccount--create"><a href="./values.yaml#L133">serviceAccount.create</a></td>
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
			<td>Create a dedicated ServiceAccount.</td>
		</tr>
		<tr>
			<td id="serviceAccount--labels"><a href="./values.yaml#L137">serviceAccount.labels</a></td>
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
			<td>ServiceAccount labels.</td>
		</tr>
		<tr>
			<td id="serviceAccount--name"><a href="./values.yaml#L139">serviceAccount.name</a></td>
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
			<td>ServiceAccount name override.</td>
		</tr>
		<tr>
			<td id="startupProbe"><a href="./values.yaml#L216">startupProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 30,
  "httpGet": {
    "path": "/healthz",
    "port": "http"
  },
  "initialDelaySeconds": 5,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Startup probe for the main Coder container.</td>
		</tr>
		<tr>
			<td id="tmpVolume"><a href="./values.yaml#L184">tmpVolume</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "mountPath": "/tmp",
  "sizeLimit": ""
}
</pre>
</div>
			</td>
			<td>Enable env vars to allow `readOnlyRootFilesystem` with a writable `/tmp`.</td>
		</tr>
		<tr>
			<td id="tmpVolume--enabled"><a href="./values.yaml#L186">tmpVolume.enabled</a></td>
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
			<td>Mount an EmptyDir at `/tmp`.</td>
		</tr>
		<tr>
			<td id="tmpVolume--mountPath"><a href="./values.yaml#L188">tmpVolume.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/tmp"
</pre>
</div>
			</td>
			<td>EmptyDir mount path used by Coder cache files.</td>
		</tr>
		<tr>
			<td id="tmpVolume--sizeLimit"><a href="./values.yaml#L190">tmpVolume.sizeLimit</a></td>
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
			<td>Optional EmptyDir size limit.</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L355">tolerations</a></td>
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
			<td>Workload tolerations.</td>
		</tr>
	</tbody>
</table>

## Value type details

The chart uses some value types for which I would like to add a further explanation / recommendation:

## Chart with experimental support for CiliumNetworkPolicies

Please note that this chart does not provide any production ready network policies itself.
Therefore, I recommend the implementation of network policies before using in prod environments.

> **If you're using Cilium CNI**: I've added experimental support for CNPs.
> Note that these are highly oppinionated and you should review them carefully before using.
> E.g. it's required that each release gets deployed within a separate namespace.

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
