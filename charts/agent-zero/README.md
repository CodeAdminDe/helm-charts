

# agent-zero

![Version: 0.1.4](https://img.shields.io/badge/Version-0.1.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.9.8.2](https://img.shields.io/badge/AppVersion-v0.9.8.2-informational?style=flat-square)

A Helm chart for deploying Agent Zero (AI Operating System) on Kubernetes.

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
helm install agent-zero codeadminde/agent-zero
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

To install the chart with the release name `agent-zero`

```bash
helm install agent-zero codeadminde/agent-zero
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `agent-zero`

```bash
helm uninstall agent-zero
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
> helm install agent-zero codeadminde/agent-zero -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install agent-zero --set key=value --set keyTwo=secondValue codeadminde/agent-zero
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
			<td id="additionalEnvSecrets"><a href="./values.yaml#L377">additionalEnvSecrets</a></td>
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
			<td>Additional env vars from explicit secret refs. @description Supports either map (ENV_NAME -> secretName) or list objects ({name, secretName, secretKey}).</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L476">affinity</a></td>
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
			<td id="applyHealthChecks"><a href="./values.yaml#L392">applyHealthChecks</a></td>
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
			<td>Enable health probes.</td>
		</tr>
		<tr>
			<td id="args"><a href="./values.yaml#L383">args</a></td>
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
			<td>Extra args override.</td>
		</tr>
		<tr>
			<td id="autoscaling"><a href="./values.yaml#L449">autoscaling</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enableMemoryUtilization": false,
  "enabled": false,
  "maxReplicas": 3,
  "minReplicas": 1,
  "targetCPUUtilizationPercentage": 80,
  "targetMemoryUtilizationPercentage": 80
}
</pre>
</div>
			</td>
			<td>HorizontalPodAutoscaler configuration.</td>
		</tr>
		<tr>
			<td id="autoscaling--enableMemoryUtilization"><a href="./values.yaml#L459">autoscaling.enableMemoryUtilization</a></td>
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
			<td>Enable memory utilization metric.</td>
		</tr>
		<tr>
			<td id="autoscaling--enabled"><a href="./values.yaml#L451">autoscaling.enabled</a></td>
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
			<td>Enable autoscaling.</td>
		</tr>
		<tr>
			<td id="autoscaling--maxReplicas"><a href="./values.yaml#L455">autoscaling.maxReplicas</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3
</pre>
</div>
			</td>
			<td>Maximum replicas.</td>
		</tr>
		<tr>
			<td id="autoscaling--minReplicas"><a href="./values.yaml#L453">autoscaling.minReplicas</a></td>
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
			<td>Minimum replicas.</td>
		</tr>
		<tr>
			<td id="autoscaling--targetCPUUtilizationPercentage"><a href="./values.yaml#L457">autoscaling.targetCPUUtilizationPercentage</a></td>
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
			<td>Target CPU utilization percentage.</td>
		</tr>
		<tr>
			<td id="autoscaling--targetMemoryUtilizationPercentage"><a href="./values.yaml#L461">autoscaling.targetMemoryUtilizationPercentage</a></td>
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
			<td>Target memory utilization percentage.</td>
		</tr>
		<tr>
			<td id="cnps"><a href="./values.yaml#L486">cnps</a></td>
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
      "toEntities": [
        "world"
      ],
      "toPorts": [
        {
          "port": "80",
          "protocol": "TCP"
        },
        {
          "port": "443",
          "protocol": "TCP"
        }
      ]
    },
    "ingress": {
      "allow": true,
      "fromEndpoints": [],
      "fromEntities": []
    }
  }
}
</pre>
</div>
			</td>
			<td>App-specific Cilium policy settings.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L498">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow egress traffic from app pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEntities"><a href="./values.yaml#L500">cnps.appTraffic.egress.toEntities</a></td>
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
			<td>Optional destination entities.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toPorts"><a href="./values.yaml#L503">cnps.appTraffic.egress.toPorts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "port": "80",
    "protocol": "TCP"
  },
  {
    "port": "443",
    "protocol": "TCP"
  }
]
</pre>
</div>
			</td>
			<td>Allowed egress ports.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toPorts[0]"><a href="./values.yaml#L505">cnps.appTraffic.egress.toPorts[0]</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "port": "80",
  "protocol": "TCP"
}
</pre>
</div>
			</td>
			<td>DNS (53/UDP) is already covered by the namespace-wide libchart policy.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L490">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress traffic to app pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEndpoints"><a href="./values.yaml#L493">cnps.appTraffic.ingress.fromEndpoints</a></td>
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
			<td>Allowed ingress endpoint label sets. @description Leave empty to use conditional defaults from template logic: ingress-nginx labels when ingress.enabled=true, envoy-gateway labels when gatewayApi.enabled=true, or both when both are enabled.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEntities"><a href="./values.yaml#L495">cnps.appTraffic.ingress.fromEntities</a></td>
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
			<td>Optional allowed ingress entities.</td>
		</tr>
		<tr>
			<td id="command"><a href="./values.yaml#L380">command</a></td>
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
			<td>Extra command override.</td>
		</tr>
		<tr>
			<td id="env"><a href="./values.yaml#L367">env</a></td>
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
			<td>Additional plain environment variables. @description Do not place secrets in this map.</td>
		</tr>
		<tr>
			<td id="envFromConfigMaps"><a href="./values.yaml#L373">envFromConfigMaps</a></td>
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
			<td>Import all keys from listed configmaps as environment variables.</td>
		</tr>
		<tr>
			<td id="envFromSecrets"><a href="./values.yaml#L370">envFromSecrets</a></td>
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
			<td>Import all keys from listed secrets as environment variables.</td>
		</tr>
		<tr>
			<td id="extraVolumeMounts"><a href="./values.yaml#L386">extraVolumeMounts</a></td>
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
			<td>Mount additional volumeMounts.</td>
		</tr>
		<tr>
			<td id="extraVolumes"><a href="./values.yaml#L389">extraVolumes</a></td>
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
			<td>Add additional pod volumes.</td>
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
			<td id="gatewayApi"><a href="./values.yaml#L97">gatewayApi</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "backendRefs": [],
  "enabled": false,
  "filters": [],
  "hostnames": [
    "agent-zero.example.com"
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
  ]
}
</pre>
</div>
			</td>
			<td>Gateway API HTTPRoute configuration (for example Envoy Gateway).</td>
		</tr>
		<tr>
			<td id="gatewayApi--annotations"><a href="./values.yaml#L101">gatewayApi.annotations</a></td>
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
			<td id="gatewayApi--backendRefs"><a href="./values.yaml#L120">gatewayApi.backendRefs</a></td>
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
			<td>Optional backend references. Defaults to this chart service when empty.</td>
		</tr>
		<tr>
			<td id="gatewayApi--enabled"><a href="./values.yaml#L99">gatewayApi.enabled</a></td>
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
			<td id="gatewayApi--filters"><a href="./values.yaml#L118">gatewayApi.filters</a></td>
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
			<td id="gatewayApi--hostnames"><a href="./values.yaml#L110">gatewayApi.hostnames</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "agent-zero.example.com"
]
</pre>
</div>
			</td>
			<td>Hostnames served by this route.</td>
		</tr>
		<tr>
			<td id="gatewayApi--labels"><a href="./values.yaml#L103">gatewayApi.labels</a></td>
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
			<td id="gatewayApi--matches"><a href="./values.yaml#L113">gatewayApi.matches</a></td>
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
			<td>Match rules for the HTTPRoute rule.</td>
		</tr>
		<tr>
			<td id="gatewayApi--parentRefs"><a href="./values.yaml#L105">gatewayApi.parentRefs</a></td>
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
			<td>ParentRefs for HTTPRoute.</td>
		</tr>
		<tr>
			<td id="hostDockerSocket"><a href="./values.yaml#L163">hostDockerSocket</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "hostPath": "/var/run/docker.sock",
  "mountPath": "/var/run/docker.sock",
  "readOnly": false,
  "type": "Socket"
}
</pre>
</div>
			</td>
			<td>Optional host docker socket mount. @description High-risk option. Enable only when your workload explicitly needs host Docker access.</td>
		</tr>
		<tr>
			<td id="hostDockerSocket--enabled"><a href="./values.yaml#L165">hostDockerSocket.enabled</a></td>
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
			<td>Mount host docker socket into the pod.</td>
		</tr>
		<tr>
			<td id="hostDockerSocket--hostPath"><a href="./values.yaml#L167">hostDockerSocket.hostPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/run/docker.sock"
</pre>
</div>
			</td>
			<td>Host socket path.</td>
		</tr>
		<tr>
			<td id="hostDockerSocket--mountPath"><a href="./values.yaml#L169">hostDockerSocket.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/run/docker.sock"
</pre>
</div>
			</td>
			<td>Container mount path.</td>
		</tr>
		<tr>
			<td id="hostDockerSocket--readOnly"><a href="./values.yaml#L173">hostDockerSocket.readOnly</a></td>
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
			<td>Read-only mount for docker socket.</td>
		</tr>
		<tr>
			<td id="hostDockerSocket--type"><a href="./values.yaml#L171">hostDockerSocket.type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Socket"
</pre>
</div>
			</td>
			<td>HostPath type.</td>
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
  "repository": "agent0ai/agent-zero",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>Container image configuration.</td>
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
"agent0ai/agent-zero"
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
			<td>Image tag override (defaults to .Chart.AppVersion when empty).</td>
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
			<td>Image pull secrets (for private registries).</td>
		</tr>
		<tr>
			<td id="ingress"><a href="./values.yaml#L66">ingress</a></td>
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
      "host": "agent-zero.example.com",
      "paths": [
        {
          "path": "/",
          "pathType": "Prefix"
        }
      ]
    }
  ],
  "secureDefaults": {
    "enabled": true,
    "proxyBuffering": "off",
    "proxyHttpVersion": "1.1",
    "proxyReadTimeoutSeconds": 3600,
    "proxyRequestBuffering": "off",
    "proxySendTimeoutSeconds": 3600
  },
  "tls": []
}
</pre>
</div>
			</td>
			<td>Ingress configuration (ingress-nginx style).</td>
		</tr>
		<tr>
			<td id="ingress--annotations"><a href="./values.yaml#L72">ingress.annotations</a></td>
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
			<td id="ingress--className"><a href="./values.yaml#L70">ingress.className</a></td>
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
			<td id="ingress--enabled"><a href="./values.yaml#L68">ingress.enabled</a></td>
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
			<td id="ingress--hosts"><a href="./values.yaml#L88">ingress.hosts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "host": "agent-zero.example.com",
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
			<td id="ingress--secureDefaults"><a href="./values.yaml#L74">ingress.secureDefaults</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "proxyBuffering": "off",
  "proxyHttpVersion": "1.1",
  "proxyReadTimeoutSeconds": 3600,
  "proxyRequestBuffering": "off",
  "proxySendTimeoutSeconds": 3600
}
</pre>
</div>
			</td>
			<td>Secure defaults for websocket and long-lived sessions.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--enabled"><a href="./values.yaml#L76">ingress.secureDefaults.enabled</a></td>
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
			<td id="ingress--secureDefaults--proxyBuffering"><a href="./values.yaml#L82">ingress.secureDefaults.proxyBuffering</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"off"
</pre>
</div>
			</td>
			<td>Disable proxy buffering.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyHttpVersion"><a href="./values.yaml#L86">ingress.secureDefaults.proxyHttpVersion</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"1.1"
</pre>
</div>
			</td>
			<td>HTTP version for proxy upstream.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyReadTimeoutSeconds"><a href="./values.yaml#L78">ingress.secureDefaults.proxyReadTimeoutSeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3600
</pre>
</div>
			</td>
			<td>Proxy read timeout in seconds.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyRequestBuffering"><a href="./values.yaml#L84">ingress.secureDefaults.proxyRequestBuffering</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"off"
</pre>
</div>
			</td>
			<td>Disable request buffering.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxySendTimeoutSeconds"><a href="./values.yaml#L80">ingress.secureDefaults.proxySendTimeoutSeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3600
</pre>
</div>
			</td>
			<td>Proxy send timeout in seconds.</td>
		</tr>
		<tr>
			<td id="ingress--tls"><a href="./values.yaml#L94">ingress.tls</a></td>
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
			<td id="libchartCnps"><a href="./values.yaml#L479">libchartCnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "includeCnpgPolicies": false
}
</pre>
</div>
			</td>
			<td>Cilium policy library toggle.</td>
		</tr>
		<tr>
			<td id="libchartCnps--enabled"><a href="./values.yaml#L481">libchartCnps.enabled</a></td>
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
			<td>Enable libchart-cnps templates.</td>
		</tr>
		<tr>
			<td id="libchartCnps--includeCnpgPolicies"><a href="./values.yaml#L483">libchartCnps.includeCnpgPolicies</a></td>
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
			<td>Include CNPG policy set from library.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L395">livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 6,
  "httpGet": {
    "path": "/",
    "port": "http"
  },
  "initialDelaySeconds": 60,
  "periodSeconds": 20,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Liveness probe.</td>
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
			<td id="nodeSelector"><a href="./values.yaml#L470">nodeSelector</a></td>
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
			<td id="persistence"><a href="./values.yaml#L130">persistence</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "accessModes": [
    "ReadWriteOnce"
  ],
  "annotations": {},
  "enabled": true,
  "existingClaim": "",
  "mountPath": "/a0/usr",
  "retain": false,
  "size": "10Gi",
  "storageClass": "",
  "volumeName": ""
}
</pre>
</div>
			</td>
			<td>Persistence settings for Agent Zero user data directory (`/a0/usr`).</td>
		</tr>
		<tr>
			<td id="persistence--accessModes"><a href="./values.yaml#L142">persistence.accessModes</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "ReadWriteOnce"
]
</pre>
</div>
			</td>
			<td>PVC access modes.</td>
		</tr>
		<tr>
			<td id="persistence--annotations"><a href="./values.yaml#L145">persistence.annotations</a></td>
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
			<td>PVC annotations.</td>
		</tr>
		<tr>
			<td id="persistence--enabled"><a href="./values.yaml#L132">persistence.enabled</a></td>
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
			<td>Enable persistent storage.</td>
		</tr>
		<tr>
			<td id="persistence--existingClaim"><a href="./values.yaml#L136">persistence.existingClaim</a></td>
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
			<td>Existing PVC to use instead of creating one.</td>
		</tr>
		<tr>
			<td id="persistence--mountPath"><a href="./values.yaml#L150">persistence.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/a0/usr"
</pre>
</div>
			</td>
			<td>Mount path inside container. @description Upstream recommends persisting `/a0/usr` and avoiding full `/a0` mounts.</td>
		</tr>
		<tr>
			<td id="persistence--retain"><a href="./values.yaml#L134">persistence.retain</a></td>
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
			<td>Keep PVC when Helm release is deleted (`true` keeps data on uninstall; scale up/down does not delete PVCs either way).</td>
		</tr>
		<tr>
			<td id="persistence--size"><a href="./values.yaml#L138">persistence.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"10Gi"
</pre>
</div>
			</td>
			<td>PVC storage size.</td>
		</tr>
		<tr>
			<td id="persistence--storageClass"><a href="./values.yaml#L140">persistence.storageClass</a></td>
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
			<td>PVC storageClass.</td>
		</tr>
		<tr>
			<td id="persistence--volumeName"><a href="./values.yaml#L147">persistence.volumeName</a></td>
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
			<td>PVC volumeName binding.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L464">podAnnotations</a></td>
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
			<td id="podLabels"><a href="./values.yaml#L467">podLabels</a></td>
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
			<td id="podSecurityContext"><a href="./values.yaml#L425">podSecurityContext</a></td>
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
			<td>Pod-level security context.</td>
		</tr>
		<tr>
			<td id="rbac"><a href="./values.yaml#L32">rbac</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "create": false,
  "namespace": "",
  "rules": []
}
</pre>
</div>
			</td>
			<td>Optional namespace-scoped RBAC configuration.</td>
		</tr>
		<tr>
			<td id="rbac--create"><a href="./values.yaml#L34">rbac.create</a></td>
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
			<td>Create Role + RoleBinding.</td>
		</tr>
		<tr>
			<td id="rbac--namespace"><a href="./values.yaml#L36">rbac.namespace</a></td>
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
			<td>Namespace override for RBAC resources.</td>
		</tr>
		<tr>
			<td id="rbac--rules"><a href="./values.yaml#L38">rbac.rules</a></td>
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
			<td>Explicit RBAC rules required when rbac.create=true.</td>
		</tr>
		<tr>
			<td id="readinessProbe"><a href="./values.yaml#L405">readinessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 6,
  "httpGet": {
    "path": "/",
    "port": "http"
  },
  "initialDelaySeconds": 20,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Readiness probe.</td>
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
			<td>Number of application pod replicas.</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L440">resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "cpu": "2000m",
    "memory": "4Gi"
  },
  "requests": {
    "cpu": "250m",
    "memory": "512Mi"
  }
}
</pre>
</div>
			</td>
			<td>Resource requests and limits.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L123">runtimeClass</a></td>
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
			<td id="runtimeClass--pods"><a href="./values.yaml#L125">runtimeClass.pods</a></td>
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
			<td>RuntimeClass for deployment pods.</td>
		</tr>
		<tr>
			<td id="runtimeClass--tests"><a href="./values.yaml#L127">runtimeClass.tests</a></td>
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
			<td>RuntimeClass for test pods.</td>
		</tr>
		<tr>
			<td id="securityContext"><a href="./values.yaml#L429">securityContext</a></td>
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
  "readOnlyRootFilesystem": false,
  "runAsNonRoot": true,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>Container-level security context. @description Upstream image is multi-process and expects writable filesystem; avoid aggressive hardening unless validated.</td>
		</tr>
		<tr>
			<td id="service"><a href="./values.yaml#L41">service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "extraPorts": [],
  "labels": {},
  "port": 80,
  "targetPort": 80,
  "targetProtocol": "TCP",
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>Kubernetes Service configuration.</td>
		</tr>
		<tr>
			<td id="service--annotations"><a href="./values.yaml#L45">service.annotations</a></td>
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
			<td id="service--extraPorts"><a href="./values.yaml#L55">service.extraPorts</a></td>
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
			<td>Additional service ports for optional upstream features (for example SSH or tool/tunnel ports).</td>
		</tr>
		<tr>
			<td id="service--labels"><a href="./values.yaml#L47">service.labels</a></td>
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
			<td id="service--port"><a href="./values.yaml#L49">service.port</a></td>
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
			<td>Service port.</td>
		</tr>
		<tr>
			<td id="service--targetPort"><a href="./values.yaml#L51">service.targetPort</a></td>
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
			<td>Container target port.</td>
		</tr>
		<tr>
			<td id="service--targetProtocol"><a href="./values.yaml#L53">service.targetProtocol</a></td>
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
			<td id="service--type"><a href="./values.yaml#L43">service.type</a></td>
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
			<td>Service type. This chart enforces ClusterIP.</td>
		</tr>
		<tr>
			<td id="serviceAccount"><a href="./values.yaml#L21">serviceAccount</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "automountServiceAccountToken": false,
  "create": true,
  "name": ""
}
</pre>
</div>
			</td>
			<td>Service account configuration.</td>
		</tr>
		<tr>
			<td id="serviceAccount--annotations"><a href="./values.yaml#L25">serviceAccount.annotations</a></td>
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
			<td id="serviceAccount--automountServiceAccountToken"><a href="./values.yaml#L29">serviceAccount.automountServiceAccountToken</a></td>
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
			<td>Automount SA token.</td>
		</tr>
		<tr>
			<td id="serviceAccount--create"><a href="./values.yaml#L23">serviceAccount.create</a></td>
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
			<td>Create a service account.</td>
		</tr>
		<tr>
			<td id="serviceAccount--name"><a href="./values.yaml#L27">serviceAccount.name</a></td>
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
			<td id="startupProbe"><a href="./values.yaml#L415">startupProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 30,
  "httpGet": {
    "path": "/",
    "port": "http"
  },
  "initialDelaySeconds": 20,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Startup probe.</td>
		</tr>
		<tr>
			<td id="tmpVolume"><a href="./values.yaml#L153">tmpVolume</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "mountPath": "/tmp",
  "sizeLimit": "1Gi"
}
</pre>
</div>
			</td>
			<td>Optional tmp volume.</td>
		</tr>
		<tr>
			<td id="tmpVolume--enabled"><a href="./values.yaml#L155">tmpVolume.enabled</a></td>
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
			<td>Mount writable emptyDir at /tmp.</td>
		</tr>
		<tr>
			<td id="tmpVolume--mountPath"><a href="./values.yaml#L157">tmpVolume.mountPath</a></td>
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
			<td>Mount path inside container.</td>
		</tr>
		<tr>
			<td id="tmpVolume--sizeLimit"><a href="./values.yaml#L159">tmpVolume.sizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"1Gi"
</pre>
</div>
			</td>
			<td>Optional size limit.</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L473">tolerations</a></td>
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
		<tr>
			<td id="vpn"><a href="./values.yaml#L176">vpn</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "netbird": {
    "adminUrl": "https://app.netbird.io:443",
    "cnps": {
      "enableStunAndP2PPorts": false
    },
    "extraDnsLabels": "",
    "hostAliases": [],
    "image": {
      "pullPolicy": "IfNotPresent",
      "repository": "netbirdio/netbird",
      "tag": "0.66.3-rootless"
    },
    "managementUrl": "https://api.netbird.io:443",
    "persistence": {
      "accessModes": [
        "ReadWriteOnce"
      ],
      "annotations": {},
      "enabled": false,
      "existingClaim": "",
      "retain": false,
      "size": "250Mi",
      "storageClass": "",
      "volumeName": ""
    },
    "proxyEnv": {
      "enabled": true,
      "injectAllProxy": true,
      "injectHttpProxy": true,
      "injectHttpsProxy": true,
      "noProxy": "127.0.0.1,localhost,.svc,.svc.cluster.local",
      "proxyUrl": ""
    },
    "resources": {
      "limits": {
        "cpu": "250m",
        "memory": "256Mi"
      },
      "requests": {
        "cpu": "50m",
        "memory": "128Mi"
      }
    },
    "securityContext": {
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
    },
    "setupKeySecret": {
      "key": "",
      "name": ""
    },
    "socks5": {
      "port": 1080
    }
  },
  "provider": "none",
  "tailscale": {
    "acceptDns": false,
    "authKeySecret": {
      "key": "",
      "name": ""
    },
    "authOnce": true,
    "cnps": {
      "enableDirectUdpPort": false,
      "enableStunPort": false
    },
    "extraArgs": "",
    "hostAliases": [],
    "hostname": "",
    "httpProxy": {
      "bindAddress": "127.0.0.1",
      "enabled": true,
      "port": 1056
    },
    "image": {
      "pullPolicy": "IfNotPresent",
      "repository": "ghcr.io/tailscale/tailscale",
      "tag": "v1.94.2"
    },
    "kubeSecretStateName": "",
    "persistence": {
      "accessModes": [
        "ReadWriteOnce"
      ],
      "annotations": {},
      "enabled": false,
      "existingClaim": "",
      "retain": false,
      "size": "250Mi",
      "storageClass": "",
      "volumeName": ""
    },
    "proxyEnv": {
      "enabled": true,
      "httpProxyUrl": "",
      "injectAllProxy": true,
      "injectHttpProxy": true,
      "injectHttpsProxy": true,
      "noProxy": "127.0.0.1,localhost,.svc,.svc.cluster.local",
      "socksProxyUrl": ""
    },
    "resources": {
      "limits": {
        "cpu": "250m",
        "memory": "256Mi"
      },
      "requests": {
        "cpu": "50m",
        "memory": "128Mi"
      }
    },
    "securityContext": {
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
    },
    "socks5": {
      "bindAddress": "127.0.0.1",
      "enabled": true,
      "port": 1055
    },
    "tailscaledExtraArgs": "",
    "userspace": true
  }
}
</pre>
</div>
			</td>
			<td>Optional VPN sidecar settings.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--adminUrl"><a href="./values.yaml#L196">vpn.netbird.adminUrl</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https://app.netbird.io:443"
</pre>
</div>
			</td>
			<td>NetBird admin URL.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--cnps--enableStunAndP2PPorts"><a href="./values.yaml#L241">vpn.netbird.cnps.enableStunAndP2PPorts</a></td>
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
			<td>Append NetBird STUN/P2P egress defaults (UDP/3478 and UDP/49152-65535) to app CNP egress rules. @description Keep disabled in restricted environments that only allow HTTPS egress.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--extraDnsLabels"><a href="./values.yaml#L198">vpn.netbird.extraDnsLabels</a></td>
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
			<td>Optional extra DNS labels (comma-separated).</td>
		</tr>
		<tr>
			<td id="vpn--netbird--hostAliases"><a href="./values.yaml#L216">vpn.netbird.hostAliases</a></td>
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
			<td>Optional host aliases used by all pod containers (for example mapping `ollama.netbird.local` to a peer IP).</td>
		</tr>
		<tr>
			<td id="vpn--netbird--image--pullPolicy"><a href="./values.yaml#L185">vpn.netbird.image.pullPolicy</a></td>
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
			<td>NetBird sidecar image pull policy.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--image--repository"><a href="./values.yaml#L183">vpn.netbird.image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"netbirdio/netbird"
</pre>
</div>
			</td>
			<td>NetBird sidecar image repository.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--image--tag"><a href="./values.yaml#L187">vpn.netbird.image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"0.66.3-rootless"
</pre>
</div>
			</td>
			<td>NetBird sidecar image tag.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--managementUrl"><a href="./values.yaml#L194">vpn.netbird.managementUrl</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https://api.netbird.io:443"
</pre>
</div>
			</td>
			<td>NetBird management URL.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--persistence--accessModes"><a href="./values.yaml#L232">vpn.netbird.persistence.accessModes</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "ReadWriteOnce"
]
</pre>
</div>
			</td>
			<td>NetBird state PVC access modes.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--persistence--annotations"><a href="./values.yaml#L235">vpn.netbird.persistence.annotations</a></td>
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
			<td>NetBird state PVC annotations.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--persistence--enabled"><a href="./values.yaml#L222">vpn.netbird.persistence.enabled</a></td>
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
			<td>Persist NetBird state (`/var/lib/netbird`).</td>
		</tr>
		<tr>
			<td id="vpn--netbird--persistence--existingClaim"><a href="./values.yaml#L226">vpn.netbird.persistence.existingClaim</a></td>
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
			<td>Existing PVC to use for NetBird state.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--persistence--retain"><a href="./values.yaml#L224">vpn.netbird.persistence.retain</a></td>
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
			<td>Keep NetBird state PVC when Helm release is deleted.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--persistence--size"><a href="./values.yaml#L228">vpn.netbird.persistence.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"250Mi"
</pre>
</div>
			</td>
			<td>NetBird state PVC storage size.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--persistence--storageClass"><a href="./values.yaml#L230">vpn.netbird.persistence.storageClass</a></td>
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
			<td>NetBird state PVC storageClass.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--persistence--volumeName"><a href="./values.yaml#L237">vpn.netbird.persistence.volumeName</a></td>
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
			<td>NetBird state PVC volumeName binding.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--proxyEnv--enabled"><a href="./values.yaml#L204">vpn.netbird.proxyEnv.enabled</a></td>
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
			<td>Inject proxy environment variables into the Agent Zero container.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--proxyEnv--injectAllProxy"><a href="./values.yaml#L208">vpn.netbird.proxyEnv.injectAllProxy</a></td>
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
			<td>Inject `ALL_PROXY`.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--proxyEnv--injectHttpProxy"><a href="./values.yaml#L210">vpn.netbird.proxyEnv.injectHttpProxy</a></td>
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
			<td>Inject `HTTP_PROXY`.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--proxyEnv--injectHttpsProxy"><a href="./values.yaml#L212">vpn.netbird.proxyEnv.injectHttpsProxy</a></td>
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
			<td>Inject `HTTPS_PROXY`.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--proxyEnv--noProxy"><a href="./values.yaml#L214">vpn.netbird.proxyEnv.noProxy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"127.0.0.1,localhost,.svc,.svc.cluster.local"
</pre>
</div>
			</td>
			<td>`NO_PROXY` value injected when `enabled=true`.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--proxyEnv--proxyUrl"><a href="./values.yaml#L206">vpn.netbird.proxyEnv.proxyUrl</a></td>
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
			<td>Optional full proxy URL override. When empty, `socks5://127.0.0.1:<socks5.port>` is used.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--resources"><a href="./values.yaml#L243">vpn.netbird.resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "cpu": "250m",
    "memory": "256Mi"
  },
  "requests": {
    "cpu": "50m",
    "memory": "128Mi"
  }
}
</pre>
</div>
			</td>
			<td>NetBird sidecar resource requests and limits.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--securityContext"><a href="./values.yaml#L251">vpn.netbird.securityContext</a></td>
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
			<td>NetBird sidecar security context.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--setupKeySecret--key"><a href="./values.yaml#L192">vpn.netbird.setupKeySecret.key</a></td>
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
			<td>Secret key name containing NetBird setup key.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--setupKeySecret--name"><a href="./values.yaml#L190">vpn.netbird.setupKeySecret.name</a></td>
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
			<td>Secret name containing NetBird setup key.</td>
		</tr>
		<tr>
			<td id="vpn--netbird--socks5--port"><a href="./values.yaml#L201">vpn.netbird.socks5.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
1080
</pre>
</div>
			</td>
			<td>SOCKS5 listener port for NetBird netstack mode.</td>
		</tr>
		<tr>
			<td id="vpn--provider"><a href="./values.yaml#L179">vpn.provider</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"none"
</pre>
</div>
			</td>
			<td>VPN sidecar provider. @description Supported: `none`, `netbird`, `tailscale`.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--acceptDns"><a href="./values.yaml#L282">vpn.tailscale.acceptDns</a></td>
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
			<td>Accept tailnet DNS settings on the sidecar.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--authKeySecret--key"><a href="./values.yaml#L274">vpn.tailscale.authKeySecret.key</a></td>
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
			<td>Secret key name containing Tailscale auth key.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--authKeySecret--name"><a href="./values.yaml#L272">vpn.tailscale.authKeySecret.name</a></td>
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
			<td>Secret name containing Tailscale auth key.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--authOnce"><a href="./values.yaml#L280">vpn.tailscale.authOnce</a></td>
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
			<td>Only authenticate when the node is not already logged in.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--cnps--enableDirectUdpPort"><a href="./values.yaml#L343">vpn.tailscale.cnps.enableDirectUdpPort</a></td>
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
			<td>Append Tailscale direct-connect egress port (UDP/41641) to app CNP egress rules.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--cnps--enableStunPort"><a href="./values.yaml#L341">vpn.tailscale.cnps.enableStunPort</a></td>
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
			<td>Append Tailscale STUN egress port (UDP/3478) to app CNP egress rules.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--extraArgs"><a href="./values.yaml#L284">vpn.tailscale.extraArgs</a></td>
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
			<td>Additional `tailscale up` args.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--hostAliases"><a href="./values.yaml#L320">vpn.tailscale.hostAliases</a></td>
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
			<td>Optional host aliases used by all pod containers.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--hostname"><a href="./values.yaml#L276">vpn.tailscale.hostname</a></td>
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
			<td>Optional explicit node hostname. Defaults to pod name when empty.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--httpProxy--bindAddress"><a href="./values.yaml#L301">vpn.tailscale.httpProxy.bindAddress</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"127.0.0.1"
</pre>
</div>
			</td>
			<td>HTTP proxy listener bind address.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--httpProxy--enabled"><a href="./values.yaml#L299">vpn.tailscale.httpProxy.enabled</a></td>
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
			<td>Enable outbound HTTP proxy listener for pod-local traffic.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--httpProxy--port"><a href="./values.yaml#L303">vpn.tailscale.httpProxy.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
1056
</pre>
</div>
			</td>
			<td>HTTP proxy listener port.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--image--pullPolicy"><a href="./values.yaml#L267">vpn.tailscale.image.pullPolicy</a></td>
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
			<td>Tailscale sidecar image pull policy.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--image--repository"><a href="./values.yaml#L265">vpn.tailscale.image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"ghcr.io/tailscale/tailscale"
</pre>
</div>
			</td>
			<td>Tailscale sidecar image repository.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--image--tag"><a href="./values.yaml#L269">vpn.tailscale.image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"v1.94.2"
</pre>
</div>
			</td>
			<td>Tailscale sidecar image tag.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--kubeSecretStateName"><a href="./values.yaml#L289">vpn.tailscale.kubeSecretStateName</a></td>
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
			<td>Optional Kubernetes Secret state backend name. @description Empty value disables kube-API state storage (`TS_KUBE_SECRET=""`) and uses filesystem state.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--persistence--accessModes"><a href="./values.yaml#L333">vpn.tailscale.persistence.accessModes</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "ReadWriteOnce"
]
</pre>
</div>
			</td>
			<td>Tailscale state PVC access modes.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--persistence--annotations"><a href="./values.yaml#L336">vpn.tailscale.persistence.annotations</a></td>
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
			<td>Tailscale state PVC annotations.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--persistence--enabled"><a href="./values.yaml#L323">vpn.tailscale.persistence.enabled</a></td>
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
			<td>Persist Tailscale state (`/var/lib/tailscale`).</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--persistence--existingClaim"><a href="./values.yaml#L327">vpn.tailscale.persistence.existingClaim</a></td>
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
			<td>Existing PVC to use for Tailscale state.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--persistence--retain"><a href="./values.yaml#L325">vpn.tailscale.persistence.retain</a></td>
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
			<td>Keep Tailscale state PVC when Helm release is deleted.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--persistence--size"><a href="./values.yaml#L329">vpn.tailscale.persistence.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"250Mi"
</pre>
</div>
			</td>
			<td>Tailscale state PVC storage size.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--persistence--storageClass"><a href="./values.yaml#L331">vpn.tailscale.persistence.storageClass</a></td>
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
			<td>Tailscale state PVC storageClass.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--persistence--volumeName"><a href="./values.yaml#L338">vpn.tailscale.persistence.volumeName</a></td>
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
			<td>Tailscale state PVC volumeName binding.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--proxyEnv--enabled"><a href="./values.yaml#L306">vpn.tailscale.proxyEnv.enabled</a></td>
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
			<td>Inject proxy environment variables into the Agent Zero container.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--proxyEnv--httpProxyUrl"><a href="./values.yaml#L310">vpn.tailscale.proxyEnv.httpProxyUrl</a></td>
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
			<td>Optional explicit HTTP proxy URL override.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--proxyEnv--injectAllProxy"><a href="./values.yaml#L312">vpn.tailscale.proxyEnv.injectAllProxy</a></td>
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
			<td>Inject `ALL_PROXY`.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--proxyEnv--injectHttpProxy"><a href="./values.yaml#L314">vpn.tailscale.proxyEnv.injectHttpProxy</a></td>
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
			<td>Inject `HTTP_PROXY`.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--proxyEnv--injectHttpsProxy"><a href="./values.yaml#L316">vpn.tailscale.proxyEnv.injectHttpsProxy</a></td>
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
			<td>Inject `HTTPS_PROXY`.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--proxyEnv--noProxy"><a href="./values.yaml#L318">vpn.tailscale.proxyEnv.noProxy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"127.0.0.1,localhost,.svc,.svc.cluster.local"
</pre>
</div>
			</td>
			<td>`NO_PROXY` value injected when `enabled=true`.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--proxyEnv--socksProxyUrl"><a href="./values.yaml#L308">vpn.tailscale.proxyEnv.socksProxyUrl</a></td>
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
			<td>Optional explicit SOCKS proxy URL override.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--resources"><a href="./values.yaml#L345">vpn.tailscale.resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "cpu": "250m",
    "memory": "256Mi"
  },
  "requests": {
    "cpu": "50m",
    "memory": "128Mi"
  }
}
</pre>
</div>
			</td>
			<td>Tailscale sidecar resource requests and limits.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--securityContext"><a href="./values.yaml#L353">vpn.tailscale.securityContext</a></td>
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
			<td>Tailscale sidecar security context.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--socks5--bindAddress"><a href="./values.yaml#L294">vpn.tailscale.socks5.bindAddress</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"127.0.0.1"
</pre>
</div>
			</td>
			<td>SOCKS5 listener bind address.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--socks5--enabled"><a href="./values.yaml#L292">vpn.tailscale.socks5.enabled</a></td>
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
			<td>Enable SOCKS5 proxy listener for pod-local traffic.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--socks5--port"><a href="./values.yaml#L296">vpn.tailscale.socks5.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
1055
</pre>
</div>
			</td>
			<td>SOCKS5 listener port.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--tailscaledExtraArgs"><a href="./values.yaml#L286">vpn.tailscale.tailscaledExtraArgs</a></td>
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
			<td>Additional `tailscaled` args.</td>
		</tr>
		<tr>
			<td id="vpn--tailscale--userspace"><a href="./values.yaml#L278">vpn.tailscale.userspace</a></td>
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
			<td>Keep userspace mode enabled (restricted-env baseline).</td>
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
<hr /><hr />

## Appendix - Chart-specifics

### Upstream behavior and chart scope

* Upstream Agent Zero is primarily documented with Docker/Compose workflows; this chart maps that runtime model to Kubernetes with minimal behavioral changes.
* The container is multi-process (supervisord + nginx + app services). Keep security hardening changes incremental and validate in your environment.
* Persistent `/a0/usr` storage is enabled by default because upstream recommends persisting user data there while keeping bundled app files intact.
* PVC lifecycle defaults to Kubernetes behavior: scaling keeps PVC data; uninstall deletes PVC unless `persistence.retain=true`.
* `hostDockerSocket.enabled` is intentionally disabled by default due to hostPath risk.
* `libchartCnps.enabled=true` by default. Disable only if your cluster does not run Cilium.
* External exposure defaults to `ClusterIP` + optional ingress/gateway resources. Ingress/Gateway controller deployments are intentionally out of scope.

### Exposure guidance

* For ingress-nginx clusters, use `ingress.enabled=true` and provide hosts/TLS as required.
* For Gateway API (for example Envoy Gateway), use `gatewayApi.enabled=true` and set `gatewayApi.parentRefs` to your Gateway.
* Optional upstream ports (for example SSH/auxiliary ports) can be exposed with `service.extraPorts`.
* CNP ingress defaults are conditional: ingress-nginx labels are added when `ingress.enabled=true`, envoy-gateway labels are added when `gatewayApi.enabled=true`, and both are added when both are enabled.
* DNS port 53 is not included in app egress defaults because namespace-wide DNS policy already comes from `libchart-cnps`.

### VPN sidecar (NetBird netstack mode)

* Provider-aware values are available under `vpn.*`.
* `vpn.provider=netbird` deploys a rootless NetBird sidecar in netstack mode and can inject proxy env vars into Agent Zero.
* NetBird setup key must come from an existing Kubernetes secret (`vpn.netbird.setupKeySecret.name/key`).
* NetBird DNS is disabled in netstack mode (`NB_DISABLE_DNS=true`), so `.netbird.local` hostnames may require `vpn.netbird.hostAliases` or direct peer IP usage.

### VPN sidecar (Tailscale userspace mode)

* `vpn.provider=tailscale` deploys a userspace Tailscale sidecar with restricted security defaults (non-root, dropped capabilities, read-only root filesystem).
* The sidecar supports both proxy types:
  * SOCKS5 via `TS_SOCKS5_SERVER` (`vpn.tailscale.socks5.*`)
  * HTTP proxy via `TS_OUTBOUND_HTTP_PROXY_LISTEN` (`vpn.tailscale.httpProxy.*`)
* Proxy env injection into Agent Zero is available via `vpn.tailscale.proxyEnv.*` (`ALL_PROXY`, `HTTP_PROXY`, `HTTPS_PROXY`, `NO_PROXY`).
* By default, Kubernetes Secret state backend is disabled (`TS_KUBE_SECRET=""`) to avoid extra RBAC requirements. Use filesystem state (`emptyDir`/PVC via `vpn.tailscale.persistence.*`) or explicitly configure `vpn.tailscale.kubeSecretStateName`.

### Secrets handling

* Put API keys and credentials into Kubernetes secrets and consume them using `envFromSecrets` or `additionalEnvSecrets`.
* Keep `env` for non-sensitive values only.
