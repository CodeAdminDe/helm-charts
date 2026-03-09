

# paperless-ngx

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.20.4](https://img.shields.io/badge/AppVersion-2.20.4-informational?style=flat-square)

A Helm chart for deploying Paperless-ngx on Kubernetes.

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
| https://codeadminde.github.io/helm-charts | redis(redis) | 0.4.1 |

## TL;DR

You don't want to read through the docs? That's the quick and dirty way:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
helm install paperless-ngx codeadminde/paperless-ngx
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

To install the chart with the release name `paperless-ngx`

```bash
helm install paperless-ngx codeadminde/paperless-ngx
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `paperless-ngx`

```bash
helm uninstall paperless-ngx
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
> helm install paperless-ngx codeadminde/paperless-ngx -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install paperless-ngx --set key=value --set keyTwo=secondValue codeadminde/paperless-ngx
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
			<td id="additionalEnvSecrets"><a href="./values.yaml#L420">additionalEnvSecrets</a></td>
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
			<td>Additional environment variables from existing secrets. @description Supports both map and list forms.
```yaml
additionalEnvSecrets:
  EMAIL_PASSWORD: mail-secret
  SMTP_PASSWORD:
    secretName: smtp-secret
    secretKey: password

additionalEnvSecrets:
  - name: EMAIL_PASSWORD
    secretName: mail-secret
    secretKey: password
```</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L523">affinity</a></td>
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
			<td id="allowMultipleReplicas"><a href="./values.yaml#L5">allowMultipleReplicas</a></td>
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
			<td>Allow more than one Paperless pod. Disabled by default because the upstream container bundles web, consumer, and scheduler processes together.</td>
		</tr>
		<tr>
			<td id="applyHealthChecks"><a href="./values.yaml#L435">applyHealthChecks</a></td>
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
			<td>Enable startup, liveness, and readiness probes.</td>
		</tr>
		<tr>
			<td id="applySecurity"><a href="./values.yaml#L133">applySecurity</a></td>
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
			<td id="cnps"><a href="./values.yaml#L485">cnps</a></td>
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
      "toEndpoints": [],
      "toEntities": [
        "world"
      ],
      "toPorts": [
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
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L499">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow egress traffic from the Paperless pod.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEndpoints"><a href="./values.yaml#L501">cnps.appTraffic.egress.toEndpoints</a></td>
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
			<td>Additional egress endpoint selectors.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEntities"><a href="./values.yaml#L503">cnps.appTraffic.egress.toEntities</a></td>
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
			<td>Additional egress entities.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toPorts"><a href="./values.yaml#L506">cnps.appTraffic.egress.toPorts</a></td>
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
  }
]
</pre>
</div>
			</td>
			<td>Additional egress ports.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L492">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress traffic to the Paperless pod.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEndpoints"><a href="./values.yaml#L494">cnps.appTraffic.ingress.fromEndpoints</a></td>
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
			<td>Additional ingress endpoint selectors.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEntities"><a href="./values.yaml#L496">cnps.appTraffic.ingress.fromEntities</a></td>
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
			<td>Additional ingress entities.</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic--instanceExtraEgress"><a href="./values.yaml#L488">cnps.cnpgTraffic.instanceExtraEgress</a></td>
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
			<td>Extra egress rules for CNPG policy rendering.</td>
		</tr>
		<tr>
			<td id="database"><a href="./values.yaml#L264">database</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "postgres": {
    "database": "paperless",
    "host": "",
    "passwordSecret": {
      "key": "password",
      "name": ""
    },
    "port": 5432,
    "sslMode": "require",
    "user": "paperless"
  },
  "type": "sqlite",
  "useCnpgCluster": {
    "appConnectionSecretName": "",
    "clusterName": "cnpg-cluster",
    "enabled": false,
    "port": 5432,
    "secretKeys": {
      "database": "dbname",
      "password": "password",
      "username": "user"
    },
    "sslMode": "require"
  }
}
</pre>
</div>
			</td>
			<td>Database configuration. SQLite is the default simple fallback; production deployments should prefer PostgreSQL or CNPG.</td>
		</tr>
		<tr>
			<td id="database--postgres--database"><a href="./values.yaml#L273">database.postgres.database</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"paperless"
</pre>
</div>
			</td>
			<td>PostgreSQL database name.</td>
		</tr>
		<tr>
			<td id="database--postgres--host"><a href="./values.yaml#L269">database.postgres.host</a></td>
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
			<td>PostgreSQL host when `database.type=postgresql` and CNPG is disabled.</td>
		</tr>
		<tr>
			<td id="database--postgres--passwordSecret--key"><a href="./values.yaml#L282">database.postgres.passwordSecret.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"password"
</pre>
</div>
			</td>
			<td>Secret key containing the PostgreSQL password.</td>
		</tr>
		<tr>
			<td id="database--postgres--passwordSecret--name"><a href="./values.yaml#L280">database.postgres.passwordSecret.name</a></td>
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
			<td>Existing secret containing the PostgreSQL password.</td>
		</tr>
		<tr>
			<td id="database--postgres--port"><a href="./values.yaml#L271">database.postgres.port</a></td>
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
			<td>PostgreSQL port.</td>
		</tr>
		<tr>
			<td id="database--postgres--sslMode"><a href="./values.yaml#L277">database.postgres.sslMode</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"require"
</pre>
</div>
			</td>
			<td>PostgreSQL SSL mode (`PAPERLESS_DBSSLMODE`).</td>
		</tr>
		<tr>
			<td id="database--postgres--user"><a href="./values.yaml#L275">database.postgres.user</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"paperless"
</pre>
</div>
			</td>
			<td>PostgreSQL username.</td>
		</tr>
		<tr>
			<td id="database--type"><a href="./values.yaml#L266">database.type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"sqlite"
</pre>
</div>
			</td>
			<td>Database type. Supported values: `sqlite`, `postgresql`.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--appConnectionSecretName"><a href="./values.yaml#L291">database.useCnpgCluster.appConnectionSecretName</a></td>
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
			<td>Explicit CNPG app secret name. Defaults to `<clusterName>-app`.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--clusterName"><a href="./values.yaml#L287">database.useCnpgCluster.clusterName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cnpg-cluster"
</pre>
</div>
			</td>
			<td>CNPG cluster name. The RW service is derived as `<clusterName>-rw`.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--enabled"><a href="./values.yaml#L285">database.useCnpgCluster.enabled</a></td>
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
			<td>Resolve PostgreSQL credentials from an existing CNPG app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--port"><a href="./values.yaml#L289">database.useCnpgCluster.port</a></td>
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
			<td>CNPG RW service port.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--database"><a href="./values.yaml#L296">database.useCnpgCluster.secretKeys.database</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"dbname"
</pre>
</div>
			</td>
			<td>Key containing the PostgreSQL database name in the CNPG app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--password"><a href="./values.yaml#L300">database.useCnpgCluster.secretKeys.password</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"password"
</pre>
</div>
			</td>
			<td>Key containing the PostgreSQL password in the CNPG app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--username"><a href="./values.yaml#L298">database.useCnpgCluster.secretKeys.username</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"user"
</pre>
</div>
			</td>
			<td>Key containing the PostgreSQL username in the CNPG app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--sslMode"><a href="./values.yaml#L293">database.useCnpgCluster.sslMode</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"require"
</pre>
</div>
			</td>
			<td>PostgreSQL SSL mode (`PAPERLESS_DBSSLMODE`) used with CNPG.</td>
		</tr>
		<tr>
			<td id="documentConversion"><a href="./values.yaml#L303">documentConversion</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "gotenbergEndpoint": "",
  "tikaEndpoint": ""
}
</pre>
</div>
			</td>
			<td>Optional document conversion support for Office documents and `.eml` conversion.</td>
		</tr>
		<tr>
			<td id="documentConversion--enabled"><a href="./values.yaml#L305">documentConversion.enabled</a></td>
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
			<td>Enable Paperless Tika/Gotenberg integration.</td>
		</tr>
		<tr>
			<td id="documentConversion--gotenbergEndpoint"><a href="./values.yaml#L307">documentConversion.gotenbergEndpoint</a></td>
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
			<td>External Gotenberg endpoint. Leave empty to use the in-chart Gotenberg deployment when `gotenberg.enabled=true`.</td>
		</tr>
		<tr>
			<td id="documentConversion--tikaEndpoint"><a href="./values.yaml#L309">documentConversion.tikaEndpoint</a></td>
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
			<td>External Tika endpoint. Leave empty to use the in-chart Tika deployment when `tika.enabled=true`.</td>
		</tr>
		<tr>
			<td id="envFromConfigMaps"><a href="./values.yaml#L426">envFromConfigMaps</a></td>
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
			<td>Import all keys from listed existing configmaps.</td>
		</tr>
		<tr>
			<td id="envFromSecrets"><a href="./values.yaml#L423">envFromSecrets</a></td>
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
			<td>Import all keys from listed existing secrets.</td>
		</tr>
		<tr>
			<td id="extraEnv"><a href="./values.yaml#L403">extraEnv</a></td>
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
			<td>Additional non-sensitive environment variables passed to Paperless.</td>
		</tr>
		<tr>
			<td id="extraVolumeMounts"><a href="./values.yaml#L432">extraVolumeMounts</a></td>
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
			<td>Additional volume mounts for the main Paperless container.</td>
		</tr>
		<tr>
			<td id="extraVolumes"><a href="./values.yaml#L429">extraVolumes</a></td>
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
			<td>Additional pod volumes.</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L9">fullnameOverride</a></td>
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
			<td id="gatewayApi"><a href="./values.yaml#L85">gatewayApi</a></td>
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
    "paperless.example.com"
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
  "scheme": "https"
}
</pre>
</div>
			</td>
			<td>Gateway API HTTPRoute configuration.</td>
		</tr>
		<tr>
			<td id="gatewayApi--annotations"><a href="./values.yaml#L91">gatewayApi.annotations</a></td>
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
			<td id="gatewayApi--backendRefs"><a href="./values.yaml#L110">gatewayApi.backendRefs</a></td>
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
			<td>Optional backend references. Defaults to the main Paperless service when empty.</td>
		</tr>
		<tr>
			<td id="gatewayApi--enabled"><a href="./values.yaml#L87">gatewayApi.enabled</a></td>
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
			<td id="gatewayApi--filters"><a href="./values.yaml#L108">gatewayApi.filters</a></td>
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
			<td id="gatewayApi--hostnames"><a href="./values.yaml#L100">gatewayApi.hostnames</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "paperless.example.com"
]
</pre>
</div>
			</td>
			<td>Hostnames served by this route.</td>
		</tr>
		<tr>
			<td id="gatewayApi--labels"><a href="./values.yaml#L93">gatewayApi.labels</a></td>
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
			<td id="gatewayApi--matches"><a href="./values.yaml#L103">gatewayApi.matches</a></td>
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
			<td id="gatewayApi--parentRefs"><a href="./values.yaml#L95">gatewayApi.parentRefs</a></td>
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
			<td id="gatewayApi--scheme"><a href="./values.yaml#L89">gatewayApi.scheme</a></td>
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
			<td>Public URL scheme used when deriving `paperless.url` from Gateway API.</td>
		</tr>
		<tr>
			<td id="gnupgVolume"><a href="./values.yaml#L171">gnupgVolume</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "mountPath": "/usr/src/paperless/.gnupg",
  "sizeLimit": "16Mi"
}
</pre>
</div>
			</td>
			<td>Writable GnuPG directory used by Paperless for optional mail/decryption features.</td>
		</tr>
		<tr>
			<td id="gnupgVolume--enabled"><a href="./values.yaml#L173">gnupgVolume.enabled</a></td>
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
			<td>Enable a writable `emptyDir` for `/usr/src/paperless/.gnupg`.</td>
		</tr>
		<tr>
			<td id="gnupgVolume--mountPath"><a href="./values.yaml#L175">gnupgVolume.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/usr/src/paperless/.gnupg"
</pre>
</div>
			</td>
			<td>Mount path.</td>
		</tr>
		<tr>
			<td id="gnupgVolume--sizeLimit"><a href="./values.yaml#L177">gnupgVolume.sizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"16Mi"
</pre>
</div>
			</td>
			<td>Optional size limit.</td>
		</tr>
		<tr>
			<td id="gotenberg"><a href="./values.yaml#L312">gotenberg</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "args": [
    "--chromium-disable-javascript=true",
    "--chromium-allow-list=file:///tmp/.*"
  ],
  "command": [
    "gotenberg"
  ],
  "enabled": true,
  "image": {
    "pullPolicy": "IfNotPresent",
    "repository": "docker.io/gotenberg/gotenberg",
    "tag": "8.25"
  },
  "resources": {},
  "securityContext": {
    "allowPrivilegeEscalation": false,
    "capabilities": {
      "drop": [
        "ALL"
      ]
    },
    "readOnlyRootFilesystem": true,
    "runAsNonRoot": true,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "service": {
    "annotations": {},
    "labels": {},
    "port": 3000,
    "targetPort": 3000,
    "targetProtocol": "TCP"
  },
  "tmpVolume": {
    "enabled": true,
    "mountPath": "/tmp",
    "sizeLimit": "1Gi"
  }
}
</pre>
</div>
			</td>
			<td>Gotenberg helper deployment using the official upstream image.</td>
		</tr>
		<tr>
			<td id="gotenberg--args"><a href="./values.yaml#L337">gotenberg.args</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "--chromium-disable-javascript=true",
  "--chromium-allow-list=file:///tmp/.*"
]
</pre>
</div>
			</td>
			<td>Default upstream-compatible flags.</td>
		</tr>
		<tr>
			<td id="gotenberg--command"><a href="./values.yaml#L334">gotenberg.command</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "gotenberg"
]
</pre>
</div>
			</td>
			<td>Command override.</td>
		</tr>
		<tr>
			<td id="gotenberg--enabled"><a href="./values.yaml#L314">gotenberg.enabled</a></td>
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
			<td>Deploy the internal Gotenberg helper service when `documentConversion.enabled=true`.</td>
		</tr>
		<tr>
			<td id="gotenberg--image--pullPolicy"><a href="./values.yaml#L319">gotenberg.image.pullPolicy</a></td>
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
			<td id="gotenberg--image--repository"><a href="./values.yaml#L317">gotenberg.image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"docker.io/gotenberg/gotenberg"
</pre>
</div>
			</td>
			<td>Image repository.</td>
		</tr>
		<tr>
			<td id="gotenberg--image--tag"><a href="./values.yaml#L321">gotenberg.image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"8.25"
</pre>
</div>
			</td>
			<td>Image tag.</td>
		</tr>
		<tr>
			<td id="gotenberg--resources"><a href="./values.yaml#L358">gotenberg.resources</a></td>
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
			<td>Resource requests and limits.</td>
		</tr>
		<tr>
			<td id="gotenberg--securityContext"><a href="./values.yaml#L341">gotenberg.securityContext</a></td>
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
  "runAsNonRoot": true,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>Container security context.</td>
		</tr>
		<tr>
			<td id="gotenberg--service--annotations"><a href="./values.yaml#L324">gotenberg.service.annotations</a></td>
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
			<td id="gotenberg--service--labels"><a href="./values.yaml#L326">gotenberg.service.labels</a></td>
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
			<td id="gotenberg--service--port"><a href="./values.yaml#L328">gotenberg.service.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3000
</pre>
</div>
			</td>
			<td>Service port.</td>
		</tr>
		<tr>
			<td id="gotenberg--service--targetPort"><a href="./values.yaml#L330">gotenberg.service.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
3000
</pre>
</div>
			</td>
			<td>Container target port.</td>
		</tr>
		<tr>
			<td id="gotenberg--service--targetProtocol"><a href="./values.yaml#L332">gotenberg.service.targetProtocol</a></td>
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
			<td id="gotenberg--tmpVolume--enabled"><a href="./values.yaml#L352">gotenberg.tmpVolume.enabled</a></td>
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
			<td>Mount writable `emptyDir` at `/tmp`.</td>
		</tr>
		<tr>
			<td id="gotenberg--tmpVolume--mountPath"><a href="./values.yaml#L354">gotenberg.tmpVolume.mountPath</a></td>
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
			<td>Mount path.</td>
		</tr>
		<tr>
			<td id="gotenberg--tmpVolume--sizeLimit"><a href="./values.yaml#L356">gotenberg.tmpVolume.sizeLimit</a></td>
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
			<td id="image"><a href="./values.yaml#L12">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "ghcr.io/paperless-ngx/paperless-ngx",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>Paperless container image configuration.</td>
		</tr>
		<tr>
			<td id="image--pullPolicy"><a href="./values.yaml#L16">image.pullPolicy</a></td>
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
			<td id="image--repository"><a href="./values.yaml#L14">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"ghcr.io/paperless-ngx/paperless-ngx"
</pre>
</div>
			</td>
			<td>Image repository.</td>
		</tr>
		<tr>
			<td id="image--tag"><a href="./values.yaml#L18">image.tag</a></td>
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
			<td id="imagePullSecrets"><a href="./values.yaml#L21">imagePullSecrets</a></td>
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
			<td id="ingress"><a href="./values.yaml#L57">ingress</a></td>
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
      "host": "paperless.example.com",
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
      "nginx.ingress.kubernetes.io/proxy-body-size": "100m",
      "nginx.ingress.kubernetes.io/proxy-buffering": "off",
      "nginx.ingress.kubernetes.io/proxy-http-version": "1.1",
      "nginx.ingress.kubernetes.io/proxy-read-timeout": "3600",
      "nginx.ingress.kubernetes.io/proxy-request-buffering": "off",
      "nginx.ingress.kubernetes.io/proxy-send-timeout": "3600"
    },
    "enabled": true
  },
  "tls": []
}
</pre>
</div>
			</td>
			<td>Ingress configuration (ingress-nginx style).</td>
		</tr>
		<tr>
			<td id="ingress--annotations"><a href="./values.yaml#L63">ingress.annotations</a></td>
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
			<td id="ingress--className"><a href="./values.yaml#L61">ingress.className</a></td>
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
			<td id="ingress--enabled"><a href="./values.yaml#L59">ingress.enabled</a></td>
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
			<td id="ingress--hosts"><a href="./values.yaml#L76">ingress.hosts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "host": "paperless.example.com",
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
			<td id="ingress--secureDefaults"><a href="./values.yaml#L65">ingress.secureDefaults</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {
    "nginx.ingress.kubernetes.io/proxy-body-size": "100m",
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
			<td>Secure default ingress annotations for uploads and long-running requests.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--enabled"><a href="./values.yaml#L67">ingress.secureDefaults.enabled</a></td>
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
			<td id="ingress--tls"><a href="./values.yaml#L82">ingress.tls</a></td>
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
			<td id="libchartCnps"><a href="./values.yaml#L478">libchartCnps</a></td>
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
			<td>Optional `libchart-cnps` integration.</td>
		</tr>
		<tr>
			<td id="libchartCnps--enabled"><a href="./values.yaml#L480">libchartCnps.enabled</a></td>
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
			<td>Enable CiliumNetworkPolicy rendering via the `libchart-cnps` dependency.</td>
		</tr>
		<tr>
			<td id="libchartCnps--includeCnpgPolicies"><a href="./values.yaml#L482">libchartCnps.includeCnpgPolicies</a></td>
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
			<td>Include the CNPG traffic policy set.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L438">livenessProbe</a></td>
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
  "periodSeconds": 15,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Liveness probe for the main Paperless service.</td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L8">nameOverride</a></td>
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
			<td id="nodeSelector"><a href="./values.yaml#L517">nodeSelector</a></td>
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
			<td id="paperless"><a href="./values.yaml#L24">paperless</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "ocrLanguage": "eng",
  "ocrLanguages": "",
  "secretKey": {
    "existingSecret": {
      "key": "PAPERLESS_SECRET_KEY",
      "name": ""
    }
  },
  "timeZone": "",
  "url": ""
}
</pre>
</div>
			</td>
			<td>Paperless application settings.</td>
		</tr>
		<tr>
			<td id="paperless--ocrLanguage"><a href="./values.yaml#L30">paperless.ocrLanguage</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"eng"
</pre>
</div>
			</td>
			<td>Default OCR language (`PAPERLESS_OCR_LANGUAGE`).</td>
		</tr>
		<tr>
			<td id="paperless--ocrLanguages"><a href="./values.yaml#L33">paperless.ocrLanguages</a></td>
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
			<td>Additional OCR languages already shipped in the official image (`PAPERLESS_OCR_LANGUAGES`). @description This chart intentionally does not install extra language packages into the upstream image.</td>
		</tr>
		<tr>
			<td id="paperless--secretKey--existingSecret--key"><a href="./values.yaml#L39">paperless.secretKey.existingSecret.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"PAPERLESS_SECRET_KEY"
</pre>
</div>
			</td>
			<td>Secret key containing `PAPERLESS_SECRET_KEY`.</td>
		</tr>
		<tr>
			<td id="paperless--secretKey--existingSecret--name"><a href="./values.yaml#L37">paperless.secretKey.existingSecret.name</a></td>
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
			<td>Existing secret name containing `PAPERLESS_SECRET_KEY`. Leave empty to let the chart generate and preserve one.</td>
		</tr>
		<tr>
			<td id="paperless--timeZone"><a href="./values.yaml#L28">paperless.timeZone</a></td>
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
			<td>Time zone (`PAPERLESS_TIME_ZONE`).</td>
		</tr>
		<tr>
			<td id="paperless--url"><a href="./values.yaml#L26">paperless.url</a></td>
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
			<td>Explicit public URL (`PAPERLESS_URL`). When empty, the chart derives it from Gateway API or Ingress when possible.</td>
		</tr>
		<tr>
			<td id="persistence"><a href="./values.yaml#L180">persistence</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "consume": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "annotations": {},
    "emptyDirSizeLimit": "5Gi",
    "enabled": true,
    "existingClaim": "",
    "mountPath": "/usr/src/paperless/consume",
    "retain": false,
    "size": "5Gi",
    "storageClass": "",
    "volumeName": ""
  },
  "data": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "annotations": {},
    "emptyDirSizeLimit": "1Gi",
    "enabled": true,
    "existingClaim": "",
    "mountPath": "/usr/src/paperless/data",
    "retain": false,
    "size": "1Gi",
    "storageClass": "",
    "volumeName": ""
  },
  "export": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "annotations": {},
    "emptyDirSizeLimit": "5Gi",
    "enabled": true,
    "existingClaim": "",
    "mountPath": "/usr/src/paperless/export",
    "retain": false,
    "size": "5Gi",
    "storageClass": "",
    "volumeName": ""
  },
  "media": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "annotations": {},
    "emptyDirSizeLimit": "20Gi",
    "enabled": true,
    "existingClaim": "",
    "mountPath": "/usr/src/paperless/media",
    "retain": false,
    "size": "20Gi",
    "storageClass": "",
    "volumeName": ""
  }
}
</pre>
</div>
			</td>
			<td>Runtime persistence for Paperless state directories.</td>
		</tr>
		<tr>
			<td id="persistence--consume--enabled"><a href="./values.yaml#L218">persistence.consume.enabled</a></td>
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
			<td>Persist `/usr/src/paperless/consume`.</td>
		</tr>
		<tr>
			<td id="persistence--data--accessModes"><a href="./values.yaml#L193">persistence.data.accessModes</a></td>
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
			<td id="persistence--data--annotations"><a href="./values.yaml#L196">persistence.data.annotations</a></td>
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
			<td id="persistence--data--emptyDirSizeLimit"><a href="./values.yaml#L200">persistence.data.emptyDirSizeLimit</a></td>
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
			<td>Optional `emptyDir` size limit when persistence is disabled.</td>
		</tr>
		<tr>
			<td id="persistence--data--enabled"><a href="./values.yaml#L183">persistence.data.enabled</a></td>
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
			<td>Persist `/usr/src/paperless/data`.</td>
		</tr>
		<tr>
			<td id="persistence--data--existingClaim"><a href="./values.yaml#L187">persistence.data.existingClaim</a></td>
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
			<td id="persistence--data--mountPath"><a href="./values.yaml#L202">persistence.data.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/usr/src/paperless/data"
</pre>
</div>
			</td>
			<td>Mount path inside the container.</td>
		</tr>
		<tr>
			<td id="persistence--data--retain"><a href="./values.yaml#L185">persistence.data.retain</a></td>
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
			<td>Keep the PVC on uninstall.</td>
		</tr>
		<tr>
			<td id="persistence--data--size"><a href="./values.yaml#L189">persistence.data.size</a></td>
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
			<td>PVC size.</td>
		</tr>
		<tr>
			<td id="persistence--data--storageClass"><a href="./values.yaml#L191">persistence.data.storageClass</a></td>
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
			<td id="persistence--data--volumeName"><a href="./values.yaml#L198">persistence.data.volumeName</a></td>
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
			<td id="persistence--export--enabled"><a href="./values.yaml#L231">persistence.export.enabled</a></td>
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
			<td>Persist `/usr/src/paperless/export`.</td>
		</tr>
		<tr>
			<td id="persistence--media--enabled"><a href="./values.yaml#L205">persistence.media.enabled</a></td>
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
			<td>Persist `/usr/src/paperless/media`.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L511">podAnnotations</a></td>
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
			<td id="podLabels"><a href="./values.yaml#L514">podLabels</a></td>
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
			<td id="podSecurityContext"><a href="./values.yaml#L136">podSecurityContext</a></td>
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
			<td>Pod-level security context for the main Paperless workload.</td>
		</tr>
		<tr>
			<td id="rbac"><a href="./values.yaml#L124">rbac</a></td>
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
			<td id="rbac--create"><a href="./values.yaml#L126">rbac.create</a></td>
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
			<td>Create Role and RoleBinding.</td>
		</tr>
		<tr>
			<td id="rbac--namespace"><a href="./values.yaml#L128">rbac.namespace</a></td>
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
			<td id="rbac--rules"><a href="./values.yaml#L130">rbac.rules</a></td>
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
			<td>Explicit RBAC rules required when `rbac.create=true`.</td>
		</tr>
		<tr>
			<td id="readinessProbe"><a href="./values.yaml#L448">readinessProbe</a></td>
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
			<td>Readiness probe for the main Paperless service.</td>
		</tr>
		<tr>
			<td id="redis"><a href="./values.yaml#L244">redis</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "external": {
    "existingSecret": {
      "key": "redis-url",
      "name": ""
    },
    "url": ""
  },
  "persistence": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "enabled": true,
    "size": "2Gi",
    "storageClass": ""
  }
}
</pre>
</div>
			</td>
			<td>Redis connectivity. Paperless requires Redis for task processing and caching.</td>
		</tr>
		<tr>
			<td id="redis--enabled"><a href="./values.yaml#L246">redis.enabled</a></td>
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
			<td>Deploy the bundled local Redis subchart.</td>
		</tr>
		<tr>
			<td id="redis--external--existingSecret--key"><a href="./values.yaml#L252">redis.external.existingSecret.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"redis-url"
</pre>
</div>
			</td>
			<td>Secret key containing the full Redis URL.</td>
		</tr>
		<tr>
			<td id="redis--external--existingSecret--name"><a href="./values.yaml#L250">redis.external.existingSecret.name</a></td>
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
			<td>Existing secret containing a full Redis URL used for `PAPERLESS_REDIS`.</td>
		</tr>
		<tr>
			<td id="redis--external--url"><a href="./values.yaml#L255">redis.external.url</a></td>
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
			<td>Plain Redis URL used for `PAPERLESS_REDIS` when no secret reference is provided. @description Prefer `redis.external.existingSecret` when credentials are embedded in the URL.</td>
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
			<td>Number of Paperless application pod replicas.</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L468">resources</a></td>
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
			<td>Main Paperless resource requests and limits.</td>
		</tr>
		<tr>
			<td id="runVolume"><a href="./values.yaml#L162">runVolume</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "mountPath": "/run",
  "sizeLimit": "64Mi"
}
</pre>
</div>
			</td>
			<td>Writable `/run` mount required by the upstream entrypoint stack when `securityContext.readOnlyRootFilesystem=true`.</td>
		</tr>
		<tr>
			<td id="runVolume--enabled"><a href="./values.yaml#L164">runVolume.enabled</a></td>
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
			<td>Enable a writable `emptyDir` for `/run`.</td>
		</tr>
		<tr>
			<td id="runVolume--mountPath"><a href="./values.yaml#L166">runVolume.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/run"
</pre>
</div>
			</td>
			<td>Mount path.</td>
		</tr>
		<tr>
			<td id="runVolume--sizeLimit"><a href="./values.yaml#L168">runVolume.sizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"64Mi"
</pre>
</div>
			</td>
			<td>Optional size limit.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L471">runtimeClass</a></td>
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
			<td id="runtimeClass--pods"><a href="./values.yaml#L473">runtimeClass.pods</a></td>
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
			<td>RuntimeClass for all regular pods.</td>
		</tr>
		<tr>
			<td id="runtimeClass--tests"><a href="./values.yaml#L475">runtimeClass.tests</a></td>
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
			<td id="securityContext"><a href="./values.yaml#L140">securityContext</a></td>
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
			<td>Container-level security context for the main Paperless container.</td>
		</tr>
		<tr>
			<td id="service"><a href="./values.yaml#L42">service</a></td>
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
  "targetPort": 8000,
  "targetProtocol": "TCP",
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>Kubernetes Service for the main Paperless web UI/API.</td>
		</tr>
		<tr>
			<td id="service--annotations"><a href="./values.yaml#L46">service.annotations</a></td>
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
			<td id="service--labels"><a href="./values.yaml#L48">service.labels</a></td>
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
			<td id="service--port"><a href="./values.yaml#L50">service.port</a></td>
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
			<td id="service--targetPort"><a href="./values.yaml#L52">service.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
8000
</pre>
</div>
			</td>
			<td>Container target port used by the Paperless webserver.</td>
		</tr>
		<tr>
			<td id="service--targetProtocol"><a href="./values.yaml#L54">service.targetProtocol</a></td>
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
			<td id="service--type"><a href="./values.yaml#L44">service.type</a></td>
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
			<td id="serviceAccount"><a href="./values.yaml#L113">serviceAccount</a></td>
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
			<td>ServiceAccount settings.</td>
		</tr>
		<tr>
			<td id="serviceAccount--annotations"><a href="./values.yaml#L117">serviceAccount.annotations</a></td>
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
			<td id="serviceAccount--automountServiceAccountToken"><a href="./values.yaml#L121">serviceAccount.automountServiceAccountToken</a></td>
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
			<td>Automount the ServiceAccount token.</td>
		</tr>
		<tr>
			<td id="serviceAccount--create"><a href="./values.yaml#L115">serviceAccount.create</a></td>
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
			<td id="serviceAccount--name"><a href="./values.yaml#L119">serviceAccount.name</a></td>
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
			<td id="startupProbe"><a href="./values.yaml#L458">startupProbe</a></td>
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
			<td>Startup probe for the main Paperless service.</td>
		</tr>
		<tr>
			<td id="tika"><a href="./values.yaml#L361">tika</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "image": {
    "pullPolicy": "IfNotPresent",
    "repository": "docker.io/apache/tika",
    "tag": "3.2.3.0-full"
  },
  "resources": {},
  "securityContext": {
    "allowPrivilegeEscalation": false,
    "capabilities": {
      "drop": [
        "ALL"
      ]
    },
    "readOnlyRootFilesystem": true,
    "runAsNonRoot": true,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "service": {
    "annotations": {},
    "labels": {},
    "port": 9998,
    "targetPort": 9998,
    "targetProtocol": "TCP"
  },
  "tmpVolume": {
    "enabled": true,
    "mountPath": "/tmp",
    "sizeLimit": "1Gi"
  }
}
</pre>
</div>
			</td>
			<td>Apache Tika helper deployment using the official upstream image.</td>
		</tr>
		<tr>
			<td id="tika--enabled"><a href="./values.yaml#L363">tika.enabled</a></td>
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
			<td>Deploy the internal Tika helper service when `documentConversion.enabled=true`.</td>
		</tr>
		<tr>
			<td id="tika--image--pullPolicy"><a href="./values.yaml#L368">tika.image.pullPolicy</a></td>
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
			<td id="tika--image--repository"><a href="./values.yaml#L366">tika.image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"docker.io/apache/tika"
</pre>
</div>
			</td>
			<td>Image repository.</td>
		</tr>
		<tr>
			<td id="tika--image--tag"><a href="./values.yaml#L370">tika.image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"3.2.3.0-full"
</pre>
</div>
			</td>
			<td>Image tag.</td>
		</tr>
		<tr>
			<td id="tika--resources"><a href="./values.yaml#L400">tika.resources</a></td>
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
			<td>Resource requests and limits.</td>
		</tr>
		<tr>
			<td id="tika--securityContext"><a href="./values.yaml#L383">tika.securityContext</a></td>
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
  "runAsNonRoot": true,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>Container security context.</td>
		</tr>
		<tr>
			<td id="tika--service--annotations"><a href="./values.yaml#L373">tika.service.annotations</a></td>
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
			<td id="tika--service--labels"><a href="./values.yaml#L375">tika.service.labels</a></td>
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
			<td id="tika--service--port"><a href="./values.yaml#L377">tika.service.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
9998
</pre>
</div>
			</td>
			<td>Service port.</td>
		</tr>
		<tr>
			<td id="tika--service--targetPort"><a href="./values.yaml#L379">tika.service.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
9998
</pre>
</div>
			</td>
			<td>Container target port.</td>
		</tr>
		<tr>
			<td id="tika--service--targetProtocol"><a href="./values.yaml#L381">tika.service.targetProtocol</a></td>
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
			<td id="tika--tmpVolume--enabled"><a href="./values.yaml#L394">tika.tmpVolume.enabled</a></td>
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
			<td>Mount writable `emptyDir` at `/tmp`.</td>
		</tr>
		<tr>
			<td id="tika--tmpVolume--mountPath"><a href="./values.yaml#L396">tika.tmpVolume.mountPath</a></td>
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
			<td>Mount path.</td>
		</tr>
		<tr>
			<td id="tika--tmpVolume--sizeLimit"><a href="./values.yaml#L398">tika.tmpVolume.sizeLimit</a></td>
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
  "sizeLimit": "2Gi"
}
</pre>
</div>
			</td>
			<td>Writable `/tmp` mount required when `securityContext.readOnlyRootFilesystem=true`.</td>
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
			<td>Enable a writable `emptyDir` for `/tmp`.</td>
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
			<td>Mount path.</td>
		</tr>
		<tr>
			<td id="tmpVolume--sizeLimit"><a href="./values.yaml#L159">tmpVolume.sizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"2Gi"
</pre>
</div>
			</td>
			<td>Optional size limit.</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L520">tolerations</a></td>
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
<hr /><hr />

## Appendix - Chart-specifics

### Scope and supported runtime model

* This chart deploys the official `ghcr.io/paperless-ngx/paperless-ngx` image.
* Redis is required by Paperless and is bundled by default via the local `redis` subchart that uses the official `library/redis` image. You can disable it and provide an external Redis URL instead.
* Database modes supported by this chart:
  * bundled SQLite fallback for simple installs
  * external PostgreSQL
  * existing CNPG cluster
* Optional document conversion support uses the official `gotenberg/gotenberg` and `apache/tika` images.

### Persistence model

* Paperless runtime paths are split into separate persistence sections for:
  * `data`
  * `media`
  * `consume`
  * `export`
* Each path can use its own PVC or fall back to `emptyDir`.
* PVC lifecycle follows Kubernetes defaults: scaling operations keep data, and uninstall removes PVCs unless `persistence.<name>.retain=true`.

### Security and compatibility

* The main Paperless workload defaults to `runAsNonRoot`, dropped Linux capabilities, `RuntimeDefault` seccomp, and `readOnlyRootFilesystem=true`.
* Writable runtime paths required by the official image are mounted explicitly at `/tmp`, `/run`, and `/usr/src/paperless/.gnupg`.
* This chart intentionally does not mutate the official image to install extra OCR packages. Use `paperless.ocrLanguages` only for language packs already shipped in the upstream image.

### Exposure model

* Application services stay `ClusterIP` only.
* North-south traffic is exposed through either `Ingress` or `HTTPRoute`.
* `paperless.url` can be set explicitly, otherwise the chart derives a public URL from Gateway API or Ingress when possible.

### Network policies

* `libchartCnps.enabled=true` is optional and disabled by default.
* Default policy generation includes ingress-nginx and Envoy Gateway source selectors when those exposure modes are enabled.
* If you use external Redis or PostgreSQL with Cilium policies enabled, add the required egress selectors and ports under `cnps.appTraffic.egress`.
