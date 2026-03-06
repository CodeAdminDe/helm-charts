

# garage

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.2.0](https://img.shields.io/badge/AppVersion-v2.2.0-informational?style=flat-square)

A Helm chart for an easier Garage (https://garagehq.deuxfleurs.fr) deployment on Kubernetes. Please note that this is a private helm chart and not directly or indirectly affiliated with Garage or its authors.

**Homepage:** <https://github.com/CodeAdminDe/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Frederic Roggon | <frederic.roggon@codeadmin.de> | <https://github.com/CodeAdminDe> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://codeadminde.github.io/helm-charts | libchart-cnps(libchart-cnps) | 0.2.1 |

## TL;DR

You don't want to read through the docs? That's the quick and dirty way:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
helm install garage codeadminde/garage
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

> I'd recommend to read through the docs. Skip them at your own risk. ;-)

## Repository

In order to install / query / etc... the charts, you'll need to add the repository:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
```

## Installation

To install the chart with the release name `garage`

```bash
helm install garage codeadminde/garage
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `garage`

```bash
helm uninstall garage
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Take a look at the [values.yaml](./values.yaml) file of the chart. It contains the default configuration and additional notes.
So it would be a good idea to take a look at it, even if you already know what you would like to accomplish.

To configure the release (chart values), provide your own values via a *.yaml file and reference it with the `-f` flag.

> ### Sample - install with values file
>
> ```bash
> helm install garage codeadminde/garage -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you've to provide the values as key=value pair(s), referenced by the `--set` flag.

> ### Sample - install with inline set flags
>
> ```bash
> helm install garage --set key=value --set keyTwo=secondValue codeadminde/garage
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
			<td id="additionalEnvSecrets"><a href="./values.yaml#L418">additionalEnvSecrets</a></td>
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
			<td>Additional env vars from existing secrets. @description Supports either map style (`ENV: secretName`) or list style entries (`[{name, secretName, secretKey}]`).</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L463">affinity</a></td>
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
			<td id="applyHealthChecks"><a href="./values.yaml#L231">applyHealthChecks</a></td>
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
			<td>Enable liveness/readiness probes.</td>
		</tr>
		<tr>
			<td id="applySecurity"><a href="./values.yaml#L207">applySecurity</a></td>
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
			<td>Apply default pod/container security settings.</td>
		</tr>
		<tr>
			<td id="cnps"><a href="./values.yaml#L425">cnps</a></td>
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
      "allowKubernetesApi": true,
      "matchLabels": {},
      "toEntities": [],
      "toPorts": [
        {
          "port": "443",
          "protocol": "TCP"
        }
      ]
    },
    "ingress": {
      "allow": true,
      "includeAdminPort": false,
      "includeS3WebPort": true,
      "matchLabels": {}
    }
  }
}
</pre>
</div>
			</td>
			<td>App-specific CiliumNetworkPolicies settings.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--allowKubernetesApi"><a href="./values.yaml#L437">cnps.appTraffic.egress.allowKubernetesApi</a></td>
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
			<td>Allow egress to kube-apiserver entity (required for kubernetes discovery).</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--includeAdminPort"><a href="./values.yaml#L433">cnps.appTraffic.ingress.includeAdminPort</a></td>
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
			<td>Include admin service port in allowed ingress to pod endpoints.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--includeS3WebPort"><a href="./values.yaml#L431">cnps.appTraffic.ingress.includeS3WebPort</a></td>
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
			<td>Include s3-web service port in allowed ingress to pod endpoints.</td>
		</tr>
		<tr>
			<td id="env"><a href="./values.yaml#L414">env</a></td>
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
			<td>Additional env vars passed to Garage container.</td>
		</tr>
		<tr>
			<td id="extraVolumeMounts"><a href="./values.yaml#L454">extraVolumeMounts</a></td>
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
			<td>Extra volume mounts appended to Garage container.</td>
		</tr>
		<tr>
			<td id="extraVolumes"><a href="./values.yaml#L451">extraVolumes</a></td>
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
			<td>Extra volumes appended to pod spec.</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L12">fullnameOverride</a></td>
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
			<td id="garage"><a href="./values.yaml#L294">garage</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "additionalTopLevelConfig": "",
  "admin": {
    "apiBindAddr": "[::]:3903",
    "enabled": true,
    "metricsRequireToken": true,
    "traceSink": ""
  },
  "blockSize": "1048576",
  "bootstrapPeers": [],
  "compressionLevel": 1,
  "consistencyMode": "consistent",
  "dbEngine": "lmdb",
  "existingConfigMap": {
    "key": "garage.toml",
    "name": ""
  },
  "garageTomlString": "",
  "kubernetesDiscovery": {
    "enabled": true,
    "namespace": "",
    "serviceName": "",
    "skipCrd": true
  },
  "metadataAutoSnapshotInterval": "",
  "replicationFactor": 3,
  "rpcBindAddr": "[::]:3901",
  "rpcPublicAddr": "",
  "rpcPublicAddrSubnet": "",
  "s3Api": {
    "bindAddr": "[::]:3900",
    "region": "garage",
    "rootDomain": ".s3.garage.local"
  },
  "s3Web": {
    "addHostToMetrics": false,
    "bindAddr": "[::]:3902",
    "enabled": true,
    "index": "index.html",
    "rootDomain": ".web.garage.local"
  }
}
</pre>
</div>
			</td>
			<td>Garage daemon configuration rendered into `/etc/garage.toml`.</td>
		</tr>
		<tr>
			<td id="garage--additionalTopLevelConfig"><a href="./values.yaml#L361">garage.additionalTopLevelConfig</a></td>
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
			<td>Additional top-level TOML entries appended before endpoint sections.</td>
		</tr>
		<tr>
			<td id="garage--admin--apiBindAddr"><a href="./values.yaml#L354">garage.admin.apiBindAddr</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"[::]:3903"
</pre>
</div>
			</td>
			<td>Admin API bind address.</td>
		</tr>
		<tr>
			<td id="garage--admin--enabled"><a href="./values.yaml#L352">garage.admin.enabled</a></td>
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
			<td>Enable Garage admin endpoint section.</td>
		</tr>
		<tr>
			<td id="garage--admin--metricsRequireToken"><a href="./values.yaml#L356">garage.admin.metricsRequireToken</a></td>
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
			<td>Require token auth for `/metrics` endpoint.</td>
		</tr>
		<tr>
			<td id="garage--admin--traceSink"><a href="./values.yaml#L358">garage.admin.traceSink</a></td>
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
			<td>Optional OpenTelemetry trace sink endpoint.</td>
		</tr>
		<tr>
			<td id="garage--blockSize"><a href="./values.yaml#L298">garage.blockSize</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"1048576"
</pre>
</div>
			</td>
			<td>Block size in bytes.</td>
		</tr>
		<tr>
			<td id="garage--bootstrapPeers"><a href="./values.yaml#L317">garage.bootstrapPeers</a></td>
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
			<td>Optional bootstrap peer list. @description Used when not relying solely on kubernetes discovery.</td>
		</tr>
		<tr>
			<td id="garage--compressionLevel"><a href="./values.yaml#L304">garage.compressionLevel</a></td>
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
			<td>Compression level for stored blocks.</td>
		</tr>
		<tr>
			<td id="garage--consistencyMode"><a href="./values.yaml#L302">garage.consistencyMode</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"consistent"
</pre>
</div>
			</td>
			<td>Consistency mode (`consistent`, `degraded`, `dangerous`).</td>
		</tr>
		<tr>
			<td id="garage--dbEngine"><a href="./values.yaml#L296">garage.dbEngine</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"lmdb"
</pre>
</div>
			</td>
			<td>Metadata DB engine (`lmdb` or `sqlite`).</td>
		</tr>
		<tr>
			<td id="garage--existingConfigMap--key"><a href="./values.yaml#L368">garage.existingConfigMap.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"garage.toml"
</pre>
</div>
			</td>
			<td>ConfigMap key containing garage.toml.</td>
		</tr>
		<tr>
			<td id="garage--existingConfigMap--name"><a href="./values.yaml#L366">garage.existingConfigMap.name</a></td>
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
			<td>Existing ConfigMap containing garage.toml. @description When set, generated ConfigMap is skipped.</td>
		</tr>
		<tr>
			<td id="garage--garageTomlString"><a href="./values.yaml#L372">garage.garageTomlString</a></td>
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
			<td>Raw garage.toml override. @description When set, this template string replaces generated garage.toml content.</td>
		</tr>
		<tr>
			<td id="garage--kubernetesDiscovery--enabled"><a href="./values.yaml#L321">garage.kubernetesDiscovery.enabled</a></td>
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
			<td>Enable Garage kubernetes discovery mode.</td>
		</tr>
		<tr>
			<td id="garage--kubernetesDiscovery--namespace"><a href="./values.yaml#L323">garage.kubernetesDiscovery.namespace</a></td>
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
			<td>Namespace used by kubernetes discovery. Empty means release namespace.</td>
		</tr>
		<tr>
			<td id="garage--kubernetesDiscovery--serviceName"><a href="./values.yaml#L325">garage.kubernetesDiscovery.serviceName</a></td>
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
			<td>Service label used by kubernetes discovery. Empty means release fullname.</td>
		</tr>
		<tr>
			<td id="garage--kubernetesDiscovery--skipCrd"><a href="./values.yaml#L328">garage.kubernetesDiscovery.skipCrd</a></td>
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
			<td>Skip CRD management by Garage. @description Keep this true when cluster-level CRD handling is managed externally.</td>
		</tr>
		<tr>
			<td id="garage--metadataAutoSnapshotInterval"><a href="./values.yaml#L306">garage.metadataAutoSnapshotInterval</a></td>
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
			<td>Optional metadata snapshot interval (example: `6h`).</td>
		</tr>
		<tr>
			<td id="garage--replicationFactor"><a href="./values.yaml#L300">garage.replicationFactor</a></td>
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
			<td>Replication factor for the cluster.</td>
		</tr>
		<tr>
			<td id="garage--rpcBindAddr"><a href="./values.yaml#L309">garage.rpcBindAddr</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"[::]:3901"
</pre>
</div>
			</td>
			<td>RPC bind address for inter-node communication.</td>
		</tr>
		<tr>
			<td id="garage--rpcPublicAddr"><a href="./values.yaml#L311">garage.rpcPublicAddr</a></td>
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
			<td>Optional explicit RPC public address (`host:port`).</td>
		</tr>
		<tr>
			<td id="garage--rpcPublicAddrSubnet"><a href="./values.yaml#L313">garage.rpcPublicAddrSubnet</a></td>
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
			<td>Optional subnet filter for auto-discovered RPC public addresses.</td>
		</tr>
		<tr>
			<td id="garage--s3Api--bindAddr"><a href="./values.yaml#L332">garage.s3Api.bindAddr</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"[::]:3900"
</pre>
</div>
			</td>
			<td>S3 API bind address.</td>
		</tr>
		<tr>
			<td id="garage--s3Api--region"><a href="./values.yaml#L334">garage.s3Api.region</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"garage"
</pre>
</div>
			</td>
			<td>S3 region name.</td>
		</tr>
		<tr>
			<td id="garage--s3Api--rootDomain"><a href="./values.yaml#L336">garage.s3Api.rootDomain</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
".s3.garage.local"
</pre>
</div>
			</td>
			<td>Root domain suffix for virtual-hosted-style bucket access.</td>
		</tr>
		<tr>
			<td id="garage--s3Web--addHostToMetrics"><a href="./values.yaml#L348">garage.s3Web.addHostToMetrics</a></td>
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
			<td>Include host dimension in S3 web metrics.</td>
		</tr>
		<tr>
			<td id="garage--s3Web--bindAddr"><a href="./values.yaml#L342">garage.s3Web.bindAddr</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"[::]:3902"
</pre>
</div>
			</td>
			<td>S3 website bind address.</td>
		</tr>
		<tr>
			<td id="garage--s3Web--enabled"><a href="./values.yaml#L340">garage.s3Web.enabled</a></td>
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
			<td>Enable S3 website endpoint section in garage.toml.</td>
		</tr>
		<tr>
			<td id="garage--s3Web--index"><a href="./values.yaml#L346">garage.s3Web.index</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"index.html"
</pre>
</div>
			</td>
			<td>Default website index file.</td>
		</tr>
		<tr>
			<td id="garage--s3Web--rootDomain"><a href="./values.yaml#L344">garage.s3Web.rootDomain</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
".web.garage.local"
</pre>
</div>
			</td>
			<td>Website root domain suffix.</td>
		</tr>
		<tr>
			<td id="image"><a href="./values.yaml#L15">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "dxflrs/garage",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>Container image configuration.</td>
		</tr>
		<tr>
			<td id="image--pullPolicy"><a href="./values.yaml#L19">image.pullPolicy</a></td>
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
			<td id="image--repository"><a href="./values.yaml#L17">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"dxflrs/garage"
</pre>
</div>
			</td>
			<td>Image repository.</td>
		</tr>
		<tr>
			<td id="image--tag"><a href="./values.yaml#L21">image.tag</a></td>
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
			<td id="imagePullSecrets"><a href="./values.yaml#L24">imagePullSecrets</a></td>
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
			<td id="ingress"><a href="./values.yaml#L94">ingress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "s3Api": {
    "annotations": {},
    "className": "",
    "enabled": false,
    "hosts": [
      {
        "host": "s3.garage.local",
        "paths": [
          {
            "path": "/",
            "pathType": "Prefix"
          }
        ]
      },
      {
        "host": "*.s3.garage.local",
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
  },
  "s3Web": {
    "annotations": {},
    "className": "",
    "enabled": false,
    "hosts": [
      {
        "host": "*.web.garage.local",
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
}
</pre>
</div>
			</td>
			<td>Ingress resources for Garage endpoints.</td>
		</tr>
		<tr>
			<td id="ingress--s3Api--annotations"><a href="./values.yaml#L101">ingress.s3Api.annotations</a></td>
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
			<td id="ingress--s3Api--className"><a href="./values.yaml#L99">ingress.s3Api.className</a></td>
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
			<td id="ingress--s3Api--enabled"><a href="./values.yaml#L97">ingress.s3Api.enabled</a></td>
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
			<td>Enable ingress for S3 API endpoint.</td>
		</tr>
		<tr>
			<td id="ingress--s3Api--secureDefaults"><a href="./values.yaml#L104">ingress.s3Api.secureDefaults</a></td>
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
			<td>Secure-by-default ingress annotation settings. @description Applied by default and merged with ingress.s3Api.annotations (custom annotations win on key conflicts).</td>
		</tr>
		<tr>
			<td id="ingress--s3Web--annotations"><a href="./values.yaml#L127">ingress.s3Web.annotations</a></td>
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
			<td id="ingress--s3Web--className"><a href="./values.yaml#L125">ingress.s3Web.className</a></td>
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
			<td id="ingress--s3Web--enabled"><a href="./values.yaml#L123">ingress.s3Web.enabled</a></td>
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
			<td>Enable ingress for S3 website endpoint.</td>
		</tr>
		<tr>
			<td id="ingress--s3Web--secureDefaults"><a href="./values.yaml#L130">ingress.s3Web.secureDefaults</a></td>
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
			<td>Secure-by-default ingress annotation settings. @description Applied by default and merged with ingress.s3Web.annotations (custom annotations win on key conflicts).</td>
		</tr>
		<tr>
			<td id="libchartCnps"><a href="./values.yaml#L421">libchartCnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false
}
</pre>
</div>
			</td>
			<td>CiliumNetworkPolicies dependency toggle.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L234">livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "tcpSocket": {
    "port": "s3-api"
  },
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Liveness probe.</td>
		</tr>
		<tr>
			<td id="monitoring"><a href="./values.yaml#L396">monitoring</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "serviceMonitor": {
    "bearerTokenSecret": {
      "key": "",
      "name": ""
    },
    "enabled": false,
    "interval": "30s",
    "labels": {},
    "namespace": "",
    "path": "/metrics",
    "relabelings": [],
    "scheme": "http",
    "scrapeTimeout": "10s",
    "tlsConfig": {}
  }
}
</pre>
</div>
			</td>
			<td>Optional ServiceMonitor integration for Prometheus Operator.</td>
		</tr>
		<tr>
			<td id="monitoring--serviceMonitor--bearerTokenSecret--key"><a href="./values.yaml#L411">monitoring.serviceMonitor.bearerTokenSecret.key</a></td>
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
			<td>Secret key for bearer token value.</td>
		</tr>
		<tr>
			<td id="monitoring--serviceMonitor--bearerTokenSecret--name"><a href="./values.yaml#L409">monitoring.serviceMonitor.bearerTokenSecret.name</a></td>
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
			<td>Name of a secret containing a bearer token for scraping metrics.</td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L11">nameOverride</a></td>
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
			<td id="nodeSelector"><a href="./values.yaml#L457">nodeSelector</a></td>
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
			<td id="persistence"><a href="./values.yaml#L261">persistence</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "data": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "emptyDirSizeLimit": "20Gi",
    "size": "100Gi",
    "storageClass": ""
  },
  "enabled": true,
  "meta": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "emptyDirSizeLimit": "1Gi",
    "size": "10Gi",
    "storageClass": ""
  },
  "pvcRetentionPolicy": {
    "whenDeleted": "Delete",
    "whenScaled": "Retain"
  },
  "tmp": {
    "emptyDirSizeLimit": "512Mi"
  }
}
</pre>
</div>
			</td>
			<td>Persistent storage configuration for Garage metadata/data.</td>
		</tr>
		<tr>
			<td id="persistence--data--accessModes"><a href="./values.yaml#L285">persistence.data.accessModes</a></td>
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
			<td>PVC accessModes for data volume.</td>
		</tr>
		<tr>
			<td id="persistence--data--emptyDirSizeLimit"><a href="./values.yaml#L288">persistence.data.emptyDirSizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"20Gi"
</pre>
</div>
			</td>
			<td>emptyDir sizeLimit when persistence.enabled=false.</td>
		</tr>
		<tr>
			<td id="persistence--data--size"><a href="./values.yaml#L281">persistence.data.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"100Gi"
</pre>
</div>
			</td>
			<td>PVC size for data volume.</td>
		</tr>
		<tr>
			<td id="persistence--data--storageClass"><a href="./values.yaml#L283">persistence.data.storageClass</a></td>
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
			<td>PVC storageClass for data volume.</td>
		</tr>
		<tr>
			<td id="persistence--enabled"><a href="./values.yaml#L263">persistence.enabled</a></td>
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
			<td>Enable PVC-backed storage for metadata/data.</td>
		</tr>
		<tr>
			<td id="persistence--meta--accessModes"><a href="./values.yaml#L275">persistence.meta.accessModes</a></td>
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
			<td>PVC accessModes for metadata volume.</td>
		</tr>
		<tr>
			<td id="persistence--meta--emptyDirSizeLimit"><a href="./values.yaml#L278">persistence.meta.emptyDirSizeLimit</a></td>
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
			<td>emptyDir sizeLimit when persistence.enabled=false.</td>
		</tr>
		<tr>
			<td id="persistence--meta--size"><a href="./values.yaml#L271">persistence.meta.size</a></td>
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
			<td>PVC size for metadata volume.</td>
		</tr>
		<tr>
			<td id="persistence--meta--storageClass"><a href="./values.yaml#L273">persistence.meta.storageClass</a></td>
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
			<td>PVC storageClass for metadata volume.</td>
		</tr>
		<tr>
			<td id="persistence--pvcRetentionPolicy--whenDeleted"><a href="./values.yaml#L266">persistence.pvcRetentionPolicy.whenDeleted</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Delete"
</pre>
</div>
			</td>
			<td>StatefulSet PVC retention when the StatefulSet is deleted (Delete / Retain).</td>
		</tr>
		<tr>
			<td id="persistence--pvcRetentionPolicy--whenScaled"><a href="./values.yaml#L268">persistence.pvcRetentionPolicy.whenScaled</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Retain"
</pre>
</div>
			</td>
			<td>StatefulSet PVC retention when replicas are scaled down (Delete / Retain).</td>
		</tr>
		<tr>
			<td id="persistence--tmp--emptyDirSizeLimit"><a href="./values.yaml#L291">persistence.tmp.emptyDirSizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"512Mi"
</pre>
</div>
			</td>
			<td>emptyDir sizeLimit for /tmp.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L445">podAnnotations</a></td>
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
			<td id="podLabels"><a href="./values.yaml#L448">podLabels</a></td>
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
			<td id="podManagementPolicy"><a href="./values.yaml#L5">podManagementPolicy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"OrderedReady"
</pre>
</div>
			</td>
			<td>StatefulSet pod management policy (`OrderedReady` or `Parallel`).</td>
		</tr>
		<tr>
			<td id="podSecurityContext"><a href="./values.yaml#L210">podSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "fsGroup": 1000,
  "fsGroupChangePolicy": "OnRootMismatch",
  "runAsGroup": 1000,
  "runAsNonRoot": true,
  "runAsUser": 1000
}
</pre>
</div>
			</td>
			<td>Pod-level security context for Garage pods.</td>
		</tr>
		<tr>
			<td id="rbac"><a href="./values.yaml#L156">rbac</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "clusterRole": {
    "create": false,
    "name": "",
    "rules": [
      {
        "apiGroups": [
          "apiextensions.k8s.io"
        ],
        "resources": [
          "customresourcedefinitions"
        ],
        "verbs": [
          "get",
          "list",
          "watch",
          "create",
          "patch"
        ]
      },
      {
        "apiGroups": [
          "deuxfleurs.fr"
        ],
        "resources": [
          "garagenodes"
        ],
        "verbs": [
          "get",
          "list",
          "watch",
          "create",
          "update",
          "patch",
          "delete"
        ]
      }
    ]
  },
  "create": true,
  "namespace": "",
  "rules": [
    {
      "apiGroups": [
        "deuxfleurs.fr"
      ],
      "resources": [
        "garagenodes"
      ],
      "verbs": [
        "get",
        "list",
        "watch",
        "create",
        "update",
        "patch",
        "delete"
      ]
    }
  ]
}
</pre>
</div>
			</td>
			<td>RBAC settings for Kubernetes discovery mode.</td>
		</tr>
		<tr>
			<td id="rbac--clusterRole--create"><a href="./values.yaml#L178">rbac.clusterRole.create</a></td>
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
			<td>Create a cluster-scoped role/binding for CRD management. @description Enable only when garage.kubernetesDiscovery.skipCrd=false.</td>
		</tr>
		<tr>
			<td id="rbac--clusterRole--name"><a href="./values.yaml#L180">rbac.clusterRole.name</a></td>
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
			<td>Optional ClusterRole name override.</td>
		</tr>
		<tr>
			<td id="rbac--clusterRole--rules"><a href="./values.yaml#L182">rbac.clusterRole.rules</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "apiGroups": [
      "apiextensions.k8s.io"
    ],
    "resources": [
      "customresourcedefinitions"
    ],
    "verbs": [
      "get",
      "list",
      "watch",
      "create",
      "patch"
    ]
  },
  {
    "apiGroups": [
      "deuxfleurs.fr"
    ],
    "resources": [
      "garagenodes"
    ],
    "verbs": [
      "get",
      "list",
      "watch",
      "create",
      "update",
      "patch",
      "delete"
    ]
  }
]
</pre>
</div>
			</td>
			<td>RBAC rules for ClusterRole.</td>
		</tr>
		<tr>
			<td id="rbac--create"><a href="./values.yaml#L158">rbac.create</a></td>
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
			<td>Create namespace-scoped role + rolebinding.</td>
		</tr>
		<tr>
			<td id="rbac--namespace"><a href="./values.yaml#L160">rbac.namespace</a></td>
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
			<td>Namespace override for RBAC objects. Empty means release namespace.</td>
		</tr>
		<tr>
			<td id="rbac--rules"><a href="./values.yaml#L162">rbac.rules</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "apiGroups": [
      "deuxfleurs.fr"
    ],
    "resources": [
      "garagenodes"
    ],
    "verbs": [
      "get",
      "list",
      "watch",
      "create",
      "update",
      "patch",
      "delete"
    ]
  }
]
</pre>
</div>
			</td>
			<td>RBAC rules for namespaced Role.</td>
		</tr>
		<tr>
			<td id="readinessProbe"><a href="./values.yaml#L243">readinessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "initialDelaySeconds": 10,
  "periodSeconds": 5,
  "tcpSocket": {
    "port": "s3-api"
  },
  "timeoutSeconds": 3
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
3
</pre>
</div>
			</td>
			<td>Number of Garage pod replicas (StatefulSet).</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L252">resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "cpu": "2000m",
    "memory": "2Gi"
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
			<td id="runtimeClass"><a href="./values.yaml#L27">runtimeClass</a></td>
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
			<td id="runtimeClass--pods"><a href="./values.yaml#L29">runtimeClass.pods</a></td>
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
			<td>RuntimeClass for StatefulSet pods.</td>
		</tr>
		<tr>
			<td id="runtimeClass--tests"><a href="./values.yaml#L31">runtimeClass.tests</a></td>
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
			<td>RuntimeClass for helm test pods.</td>
		</tr>
		<tr>
			<td id="secrets"><a href="./values.yaml#L375">secrets</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "existingSecret": {
    "keys": {
      "adminToken": "adminToken",
      "metricsToken": "metricsToken",
      "rpcSecret": "rpcSecret"
    },
    "name": ""
  },
  "values": {
    "adminToken": "",
    "metricsToken": "",
    "rpcSecret": ""
  }
}
</pre>
</div>
			</td>
			<td>Secret management for Garage runtime secrets.</td>
		</tr>
		<tr>
			<td id="secrets--existingSecret--keys--adminToken"><a href="./values.yaml#L384">secrets.existingSecret.keys.adminToken</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"adminToken"
</pre>
</div>
			</td>
			<td>Secret key containing Garage admin token.</td>
		</tr>
		<tr>
			<td id="secrets--existingSecret--keys--metricsToken"><a href="./values.yaml#L386">secrets.existingSecret.keys.metricsToken</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"metricsToken"
</pre>
</div>
			</td>
			<td>Secret key containing Garage metrics token.</td>
		</tr>
		<tr>
			<td id="secrets--existingSecret--keys--rpcSecret"><a href="./values.yaml#L382">secrets.existingSecret.keys.rpcSecret</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"rpcSecret"
</pre>
</div>
			</td>
			<td>Secret key containing the Garage RPC secret.</td>
		</tr>
		<tr>
			<td id="secrets--existingSecret--name"><a href="./values.yaml#L379">secrets.existingSecret.name</a></td>
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
			<td>Existing secret to source Garage secrets from. @description When set, chart-generated secret is skipped.</td>
		</tr>
		<tr>
			<td id="secrets--values--adminToken"><a href="./values.yaml#L391">secrets.values.adminToken</a></td>
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
			<td>Optional admin token. Leave empty for generated/preserved value.</td>
		</tr>
		<tr>
			<td id="secrets--values--metricsToken"><a href="./values.yaml#L393">secrets.values.metricsToken</a></td>
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
			<td>Optional metrics token. Leave empty for generated/preserved value.</td>
		</tr>
		<tr>
			<td id="secrets--values--rpcSecret"><a href="./values.yaml#L389">secrets.values.rpcSecret</a></td>
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
			<td>Optional RPC secret value (hex string). Leave empty for generated/preserved value.</td>
		</tr>
		<tr>
			<td id="securityContext"><a href="./values.yaml#L218">securityContext</a></td>
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
			<td>Container-level security context for Garage container.</td>
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
  "admin": {
    "enabled": true,
    "port": 3903,
    "targetPort": 3903,
    "targetProtocol": "TCP"
  },
  "annotations": {},
  "headless": {
    "annotations": {}
  },
  "rpc": {
    "port": 3901,
    "targetPort": 3901,
    "targetProtocol": "TCP"
  },
  "s3Api": {
    "port": 3900,
    "targetPort": 3900,
    "targetProtocol": "TCP"
  },
  "s3Web": {
    "enabled": true,
    "port": 3902,
    "targetPort": 3902,
    "targetProtocol": "TCP"
  },
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>Kubernetes Service configuration.</td>
		</tr>
		<tr>
			<td id="service--admin--enabled"><a href="./values.yaml#L75">service.admin.enabled</a></td>
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
			<td>Expose Garage admin/metrics endpoint via the ClusterIP service.</td>
		</tr>
		<tr>
			<td id="service--admin--port"><a href="./values.yaml#L77">service.admin.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3903
</pre>
</div>
			</td>
			<td>Admin API service port.</td>
		</tr>
		<tr>
			<td id="service--admin--targetPort"><a href="./values.yaml#L79">service.admin.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3903
</pre>
</div>
			</td>
			<td>Container target port for admin endpoint.</td>
		</tr>
		<tr>
			<td id="service--admin--targetProtocol"><a href="./values.yaml#L81">service.admin.targetProtocol</a></td>
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
			<td>Service protocol for admin endpoint.</td>
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
			<td>Service annotations for the primary ClusterIP service.</td>
		</tr>
		<tr>
			<td id="service--headless--annotations"><a href="./values.yaml#L91">service.headless.annotations</a></td>
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
			<td>Annotations for the headless StatefulSet service.</td>
		</tr>
		<tr>
			<td id="service--rpc--port"><a href="./values.yaml#L84">service.rpc.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3901
</pre>
</div>
			</td>
			<td>RPC port used for inter-node Garage communication.</td>
		</tr>
		<tr>
			<td id="service--rpc--targetPort"><a href="./values.yaml#L86">service.rpc.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3901
</pre>
</div>
			</td>
			<td>Container target port for Garage RPC.</td>
		</tr>
		<tr>
			<td id="service--rpc--targetProtocol"><a href="./values.yaml#L88">service.rpc.targetProtocol</a></td>
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
			<td>Service protocol for Garage RPC.</td>
		</tr>
		<tr>
			<td id="service--s3Api--port"><a href="./values.yaml#L59">service.s3Api.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3900
</pre>
</div>
			</td>
			<td>Public S3 API service port.</td>
		</tr>
		<tr>
			<td id="service--s3Api--targetPort"><a href="./values.yaml#L61">service.s3Api.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3900
</pre>
</div>
			</td>
			<td>Container target port for S3 API.</td>
		</tr>
		<tr>
			<td id="service--s3Api--targetProtocol"><a href="./values.yaml#L63">service.s3Api.targetProtocol</a></td>
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
			<td>Service protocol for S3 API.</td>
		</tr>
		<tr>
			<td id="service--s3Web--enabled"><a href="./values.yaml#L66">service.s3Web.enabled</a></td>
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
			<td>Expose the S3 website endpoint via the ClusterIP service.</td>
		</tr>
		<tr>
			<td id="service--s3Web--port"><a href="./values.yaml#L68">service.s3Web.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3902
</pre>
</div>
			</td>
			<td>Public S3 website service port.</td>
		</tr>
		<tr>
			<td id="service--s3Web--targetPort"><a href="./values.yaml#L70">service.s3Web.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3902
</pre>
</div>
			</td>
			<td>Container target port for S3 website endpoint.</td>
		</tr>
		<tr>
			<td id="service--s3Web--targetProtocol"><a href="./values.yaml#L72">service.s3Web.targetProtocol</a></td>
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
			<td>Service protocol for S3 website endpoint.</td>
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
			<td>Service type. This chart enforces ClusterIP.</td>
		</tr>
		<tr>
			<td id="serviceAccount"><a href="./values.yaml#L145">serviceAccount</a></td>
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
  "name": ""
}
</pre>
</div>
			</td>
			<td>Create service account.</td>
		</tr>
		<tr>
			<td id="serviceAccount--annotations"><a href="./values.yaml#L148">serviceAccount.annotations</a></td>
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
			<td id="serviceAccount--automountServiceAccountToken"><a href="./values.yaml#L153">serviceAccount.automountServiceAccountToken</a></td>
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
			<td>Automount SA token on pods. @description Required when garage.kubernetesDiscovery.enabled=true.</td>
		</tr>
		<tr>
			<td id="serviceAccount--name"><a href="./values.yaml#L150">serviceAccount.name</a></td>
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
			<td id="terminationGracePeriodSeconds"><a href="./values.yaml#L8">terminationGracePeriodSeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
60
</pre>
</div>
			</td>
			<td>Termination grace period in seconds for Garage pods.</td>
		</tr>
		<tr>
			<td id="tests"><a href="./values.yaml#L34">tests</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "applySecurity": true,
  "podSecurityContext": {
    "runAsNonRoot": true,
    "seccompProfile": {
      "type": "RuntimeDefault"
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
    "runAsUser": 1000
  }
}
</pre>
</div>
			</td>
			<td>Helm test hook runtime and security settings.</td>
		</tr>
		<tr>
			<td id="tests--applySecurity"><a href="./values.yaml#L36">tests.applySecurity</a></td>
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
			<td>Apply pod/container security settings on the helm test pod.</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L460">tolerations</a></td>
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
> Note that these are highly opinionated and you should review them carefully before using.
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

### Important operational notes

* Garage itself does not terminate TLS on S3 endpoints. Use ingress/reverse-proxy for TLS termination.
* This chart defaults to StatefulSet with two PVCs (`meta` and `data`) and `service.type=ClusterIP`.
* `garage.kubernetesDiscovery.enabled=true` is enabled by default and requires service-account token + RBAC.
* Cluster-scoped CRD management is disabled by default (`garage.kubernetesDiscovery.skipCrd=true`, `rbac.clusterRole.create=false`).
* After deployment, cluster layout assignment still has to be performed via Garage admin/CLI workflows.

### Security defaults

* Pod/container security context uses non-root execution, dropped capabilities and RuntimeDefault seccomp.
* Runtime secrets (`rpcSecret`, `adminToken`, `metricsToken`) are sourced from an existing Secret or generated/preserved by the chart.
* Metrics token auth is enabled by default via `garage.admin.metricsRequireToken=true`.
