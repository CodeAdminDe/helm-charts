

# forgejo

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 14.0.3](https://img.shields.io/badge/AppVersion-14.0.3-informational?style=flat-square)

A Helm chart for deploying Forgejo on Kubernetes.

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
helm install forgejo codeadminde/forgejo
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

To install the chart with the release name `forgejo`

```bash
helm install forgejo codeadminde/forgejo
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `forgejo`

```bash
helm uninstall forgejo
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
> helm install forgejo codeadminde/forgejo -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install forgejo --set key=value --set keyTwo=secondValue codeadminde/forgejo
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
			<td id="additionalEnvSecrets"><a href="./values.yaml#L284">additionalEnvSecrets</a></td>
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
			<td>Additional secret-backed environment variables appended after the chart-managed Forgejo env vars on the main container. @description Supports either map form (`ENV_NAME: secret-name` or `ENV_NAME: {secretName: ..., secretKey: ...}`) or list form (`[{name, secretName, secretKey}]`).</td>
		</tr>
		<tr>
			<td id="admin"><a href="./values.yaml#L375">admin</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "email": "forgejo@local.domain",
  "enabled": true,
  "existingSecret": {
    "name": "",
    "passwordKey": "password",
    "usernameKey": "username"
  },
  "password": "",
  "passwordMode": "keepUpdated",
  "username": "forgejo_admin"
}
</pre>
</div>
			</td>
			<td>Bootstrap admin user settings.</td>
		</tr>
		<tr>
			<td id="admin--email"><a href="./values.yaml#L391">admin.email</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"forgejo@local.domain"
</pre>
</div>
			</td>
			<td>Admin email address.</td>
		</tr>
		<tr>
			<td id="admin--enabled"><a href="./values.yaml#L377">admin.enabled</a></td>
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
			<td>Enable bootstrap admin reconciliation.</td>
		</tr>
		<tr>
			<td id="admin--existingSecret"><a href="./values.yaml#L379">admin.existingSecret</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "name": "",
  "passwordKey": "password",
  "usernameKey": "username"
}
</pre>
</div>
			</td>
			<td>Existing secret containing the bootstrap admin credentials.</td>
		</tr>
		<tr>
			<td id="admin--existingSecret--name"><a href="./values.yaml#L381">admin.existingSecret.name</a></td>
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
			<td>Existing secret name.</td>
		</tr>
		<tr>
			<td id="admin--existingSecret--passwordKey"><a href="./values.yaml#L385">admin.existingSecret.passwordKey</a></td>
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
			<td>Secret key containing the admin password.</td>
		</tr>
		<tr>
			<td id="admin--existingSecret--usernameKey"><a href="./values.yaml#L383">admin.existingSecret.usernameKey</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"username"
</pre>
</div>
			</td>
			<td>Secret key containing the admin username.</td>
		</tr>
		<tr>
			<td id="admin--password"><a href="./values.yaml#L389">admin.password</a></td>
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
			<td>Admin password used when the chart generates the bootstrap secret. Leave empty to let Helm preserve/generate one.</td>
		</tr>
		<tr>
			<td id="admin--passwordMode"><a href="./values.yaml#L393">admin.passwordMode</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"keepUpdated"
</pre>
</div>
			</td>
			<td>Password reconciliation mode. Supported values: `keepUpdated`, `initialOnlyNoReset`, `initialOnlyRequireReset`.</td>
		</tr>
		<tr>
			<td id="admin--username"><a href="./values.yaml#L387">admin.username</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"forgejo_admin"
</pre>
</div>
			</td>
			<td>Admin username used when the chart generates the bootstrap secret.</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L268">affinity</a></td>
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
			<td id="applyHealthChecks"><a href="./values.yaml#L161">applyHealthChecks</a></td>
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
			<td>Apply health checks from values.</td>
		</tr>
		<tr>
			<td id="applySecurity"><a href="./values.yaml#L158">applySecurity</a></td>
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
			<td id="args"><a href="./values.yaml#L253">args</a></td>
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
			<td>Optional args override for the Forgejo container.</td>
		</tr>
		<tr>
			<td id="clusterDomain"><a href="./values.yaml#L15">clusterDomain</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cluster.local"
</pre>
</div>
			</td>
			<td>Cluster DNS suffix used for internal service URLs.</td>
		</tr>
		<tr>
			<td id="cnps"><a href="./values.yaml#L474">cnps</a></td>
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
        "world"
      ],
      "toFQDNs": [],
      "toPorts": [
        {
          "port": "22",
          "protocol": "TCP"
        },
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
    "sshIngress": {
      "allow": true,
      "fromEndpoints": [],
      "fromEntities": []
    },
    "webIngress": {
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
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L497">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow outbound traffic from the Forgejo pod.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--extraRules"><a href="./values.yaml#L514">cnps.appTraffic.egress.extraRules</a></td>
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
			<td id="cnps--appTraffic--egress--toEndpoints"><a href="./values.yaml#L499">cnps.appTraffic.egress.toEndpoints</a></td>
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
			<td>Cilium entities allowed for general egress.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toFQDNs"><a href="./values.yaml#L501">cnps.appTraffic.egress.toFQDNs</a></td>
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
			<td>Additional fully-qualified domain names for egress, for example OIDC providers or outbound webhooks.</td>
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
    "port": "22",
    "protocol": "TCP"
  },
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
			<td>Additional egress ports for the general egress rules.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--sshIngress--allow"><a href="./values.yaml#L489">cnps.appTraffic.sshIngress.allow</a></td>
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
			<td>Allow SSH ingress traffic to the Forgejo pod.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--sshIngress--fromEndpoints"><a href="./values.yaml#L492">cnps.appTraffic.sshIngress.fromEndpoints</a></td>
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
			<td>Explicit endpoint selectors allowed to reach the Forgejo SSH port. @description When `tcpRoute.enabled=true` and this list is empty, the chart falls back to `gatewayApi.controllerSelector` if set. When `service.ssh.type` is `NodePort` or `LoadBalancer`, the chart also defaults SSH ingress to the `world` entity unless you override it here or via `fromEntities`.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--sshIngress--fromEntities"><a href="./values.yaml#L494">cnps.appTraffic.sshIngress.fromEntities</a></td>
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
			<td>Explicit Cilium entities allowed to reach the Forgejo SSH port.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--webIngress--allow"><a href="./values.yaml#L481">cnps.appTraffic.webIngress.allow</a></td>
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
			<td>Allow web ingress traffic to the Forgejo pod.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--webIngress--fromEndpoints"><a href="./values.yaml#L484">cnps.appTraffic.webIngress.fromEndpoints</a></td>
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
			<td>Explicit endpoint selectors allowed to reach the Forgejo HTTP port. @description When `ingress.enabled=true` and this list is empty, the chart assumes an ingress-nginx controller with labels `app.kubernetes.io/name=ingress-nginx` in namespace `ingress-nginx`. When `gatewayApi.enabled=true` and `gatewayApi.controllerSelector` is set, that selector is also used by default.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--webIngress--fromEntities"><a href="./values.yaml#L486">cnps.appTraffic.webIngress.fromEntities</a></td>
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
			<td>Explicit Cilium entities allowed to reach the Forgejo HTTP port.</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic"><a href="./values.yaml#L476">cnps.cnpgTraffic</a></td>
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
			<td id="command"><a href="./values.yaml#L250">command</a></td>
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
			<td>Optional command override for the Forgejo container.</td>
		</tr>
		<tr>
			<td id="database"><a href="./values.yaml#L396">database</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "postgres": {
    "database": "forgejo",
    "host": "",
    "passwordSecret": {
      "key": "password",
      "name": ""
    },
    "port": 5432,
    "sslMode": "require",
    "user": "forgejo"
  },
  "type": "sqlite",
  "useCnpgCluster": {
    "appConnectionSecretName": "",
    "clusterName": "forgejo",
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
			<td>Database configuration. SQLite is the default simple fallback; production deployments should prefer PostgreSQL with CNPG.</td>
		</tr>
		<tr>
			<td id="database--postgres--database"><a href="./values.yaml#L405">database.postgres.database</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"forgejo"
</pre>
</div>
			</td>
			<td>PostgreSQL database name.</td>
		</tr>
		<tr>
			<td id="database--postgres--host"><a href="./values.yaml#L401">database.postgres.host</a></td>
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
			<td id="database--postgres--passwordSecret--key"><a href="./values.yaml#L414">database.postgres.passwordSecret.key</a></td>
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
			<td id="database--postgres--passwordSecret--name"><a href="./values.yaml#L412">database.postgres.passwordSecret.name</a></td>
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
			<td id="database--postgres--port"><a href="./values.yaml#L403">database.postgres.port</a></td>
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
			<td id="database--postgres--sslMode"><a href="./values.yaml#L409">database.postgres.sslMode</a></td>
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
			<td>PostgreSQL SSL mode (`forgejo.config.database.SSL_MODE`).</td>
		</tr>
		<tr>
			<td id="database--postgres--user"><a href="./values.yaml#L407">database.postgres.user</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"forgejo"
</pre>
</div>
			</td>
			<td>PostgreSQL username.</td>
		</tr>
		<tr>
			<td id="database--type"><a href="./values.yaml#L398">database.type</a></td>
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
			<td id="database--useCnpgCluster--appConnectionSecretName"><a href="./values.yaml#L421">database.useCnpgCluster.appConnectionSecretName</a></td>
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
			<td>Existing CNPG app secret name. Defaults to `<clusterName>-app` when empty.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--clusterName"><a href="./values.yaml#L419">database.useCnpgCluster.clusterName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"forgejo"
</pre>
</div>
			</td>
			<td>CNPG cluster name. The chart derives the RW service from this value.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--enabled"><a href="./values.yaml#L417">database.useCnpgCluster.enabled</a></td>
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
			<td id="database--useCnpgCluster--port"><a href="./values.yaml#L423">database.useCnpgCluster.port</a></td>
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
			<td>PostgreSQL port used by the CNPG cluster.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys"><a href="./values.yaml#L425">database.useCnpgCluster.secretKeys</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "database": "dbname",
  "password": "password",
  "username": "user"
}
</pre>
</div>
			</td>
			<td>Secret keys inside the CNPG app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--database"><a href="./values.yaml#L427">database.useCnpgCluster.secretKeys.database</a></td>
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
			<td>Key containing the database name.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--password"><a href="./values.yaml#L431">database.useCnpgCluster.secretKeys.password</a></td>
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
			<td>Key containing the database password.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--username"><a href="./values.yaml#L429">database.useCnpgCluster.secretKeys.username</a></td>
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
			<td>Key containing the database username.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--sslMode"><a href="./values.yaml#L433">database.useCnpgCluster.sslMode</a></td>
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
			<td>SSL mode used when wiring CNPG-backed PostgreSQL.</td>
		</tr>
		<tr>
			<td id="envFromConfigMaps"><a href="./values.yaml#L277">envFromConfigMaps</a></td>
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
			<td>Additional ConfigMap refs exposed with `envFrom` on the main container.</td>
		</tr>
		<tr>
			<td id="envFromSecrets"><a href="./values.yaml#L274">envFromSecrets</a></td>
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
			<td>Additional Secret refs exposed with `envFrom` on the main container.</td>
		</tr>
		<tr>
			<td id="extraContainers"><a href="./values.yaml#L271">extraContainers</a></td>
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
			<td>Optional extra sidecar containers added to the Forgejo pod.</td>
		</tr>
		<tr>
			<td id="extraEnv"><a href="./values.yaml#L280">extraEnv</a></td>
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
			<td>Additional non-secret environment variables appended after the chart-managed Forgejo env vars on the main container.</td>
		</tr>
		<tr>
			<td id="extraInitVolumeMounts"><a href="./values.yaml#L293">extraInitVolumeMounts</a></td>
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
			<td>Additional volume mounts for the init containers.</td>
		</tr>
		<tr>
			<td id="extraVolumeMounts"><a href="./values.yaml#L290">extraVolumeMounts</a></td>
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
			<td>Additional volume mounts for the main Forgejo container.</td>
		</tr>
		<tr>
			<td id="extraVolumes"><a href="./values.yaml#L287">extraVolumes</a></td>
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
			<td>Additional volumes mounted into the Forgejo pod.</td>
		</tr>
		<tr>
			<td id="forgejo"><a href="./values.yaml#L333">forgejo</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "additionalConfigFromEnvs": [],
  "additionalConfigSources": [],
  "config": {
    "APP_NAME": "Forgejo: Beyond coding. We forge.",
    "RUN_MODE": "prod",
    "actions": {},
    "admin": {},
    "cache": {},
    "database": {},
    "indexer": {},
    "log": {},
    "mailer": {},
    "metrics": {},
    "oauth2": {},
    "other": {},
    "packages": {},
    "queue": {},
    "repository": {},
    "security": {},
    "server": {},
    "service": {},
    "session": {}
  },
  "publicUrl": "",
  "sshDomain": ""
}
</pre>
</div>
			</td>
			<td>Forgejo runtime configuration.</td>
		</tr>
		<tr>
			<td id="forgejo--additionalConfigFromEnvs"><a href="./values.yaml#L350">forgejo.additionalConfigFromEnvs</a></td>
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
			<td>Additional `FORGEJO__...` environment variables consumed while building `app.ini`. @description Useful for sensitive per-setting overrides such as `FORGEJO__DATABASE__PASSWD`.</td>
		</tr>
		<tr>
			<td id="forgejo--additionalConfigSources"><a href="./values.yaml#L347">forgejo.additionalConfigSources</a></td>
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
			<td>Additional configuration from existing Secrets or ConfigMaps mounted into the init container.
```yaml
additionalConfigSources:
  - secret:
      secretName: forgejo-app-ini-oauth
  - configMap:
      name: forgejo-app-ini-plaintext
```</td>
		</tr>
		<tr>
			<td id="forgejo--config"><a href="./values.yaml#L353">forgejo.config</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "APP_NAME": "Forgejo: Beyond coding. We forge.",
  "RUN_MODE": "prod",
  "actions": {},
  "admin": {},
  "cache": {},
  "database": {},
  "indexer": {},
  "log": {},
  "mailer": {},
  "metrics": {},
  "oauth2": {},
  "other": {},
  "packages": {},
  "queue": {},
  "repository": {},
  "security": {},
  "server": {},
  "service": {},
  "session": {}
}
</pre>
</div>
			</td>
			<td>Inline Forgejo `app.ini` overrides. @description Top-level scalar keys map to the generic/default section (`APP_NAME`, `RUN_MODE`, ...). Nested maps map to their lower-cased section names and dotted section names are supported.</td>
		</tr>
		<tr>
			<td id="forgejo--publicUrl"><a href="./values.yaml#L335">forgejo.publicUrl</a></td>
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
			<td>Explicit public URL used for clone URLs and redirects. When empty, the chart derives it from Gateway API or Ingress and otherwise falls back to the internal HTTP service URL.</td>
		</tr>
		<tr>
			<td id="forgejo--sshDomain"><a href="./values.yaml#L337">forgejo.sshDomain</a></td>
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
			<td>Explicit SSH domain used in clone URLs. When empty, the chart derives it from the public host where possible.</td>
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
			<td id="gatewayApi"><a href="./values.yaml#L98">gatewayApi</a></td>
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
    "git.example.com"
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
			<td>Gateway API HTTPRoute configuration for the Forgejo web UI/API.</td>
		</tr>
		<tr>
			<td id="gatewayApi--annotations"><a href="./values.yaml#L109">gatewayApi.annotations</a></td>
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
			<td>Optional backend references. Defaults to the main Forgejo HTTP service when empty.</td>
		</tr>
		<tr>
			<td id="gatewayApi--controllerSelector"><a href="./values.yaml#L105">gatewayApi.controllerSelector</a></td>
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
			<td>Labels for the Gateway API controller pods, used to generate default CiliumNetworkPolicies ingress rules for both HTTPRoute and TCPRoute. If empty, you must provide explicit `cnps.appTraffic.webIngress.fromEndpoints` / `cnps.appTraffic.sshIngress.fromEndpoints` when Gateway API exposure is enabled together with Cilium policies.</td>
		</tr>
		<tr>
			<td id="gatewayApi--enabled"><a href="./values.yaml#L100">gatewayApi.enabled</a></td>
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
			<td id="gatewayApi--hostnames"><a href="./values.yaml#L118">gatewayApi.hostnames</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "git.example.com"
]
</pre>
</div>
			</td>
			<td>Hostnames served by the HTTPRoute.</td>
		</tr>
		<tr>
			<td id="gatewayApi--labels"><a href="./values.yaml#L111">gatewayApi.labels</a></td>
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
			<td id="gatewayApi--parentRefs"><a href="./values.yaml#L113">gatewayApi.parentRefs</a></td>
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
			<td id="gatewayApi--scheme"><a href="./values.yaml#L102">gatewayApi.scheme</a></td>
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
			<td>Public URL scheme used when deriving Forgejo `ROOT_URL` from Gateway API.</td>
		</tr>
		<tr>
			<td id="image"><a href="./values.yaml#L18">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "fullOverride": "",
  "pullPolicy": "IfNotPresent",
  "repository": "code.forgejo.org/forgejo/forgejo",
  "rootless": true,
  "tag": ""
}
</pre>
</div>
			</td>
			<td>Container image configuration.</td>
		</tr>
		<tr>
			<td id="image--fullOverride"><a href="./values.yaml#L28">image.fullOverride</a></td>
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
			<td>Fully override registry/repository/tag/digest handling when needed.</td>
		</tr>
		<tr>
			<td id="image--pullPolicy"><a href="./values.yaml#L22">image.pullPolicy</a></td>
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
			<td id="image--repository"><a href="./values.yaml#L20">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"code.forgejo.org/forgejo/forgejo"
</pre>
</div>
			</td>
			<td>Forgejo image repository.</td>
		</tr>
		<tr>
			<td id="image--rootless"><a href="./values.yaml#L26">image.rootless</a></td>
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
			<td>Pull the official rootless image variant.</td>
		</tr>
		<tr>
			<td id="image--tag"><a href="./values.yaml#L24">image.tag</a></td>
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
			<td id="imagePullSecrets"><a href="./values.yaml#L31">imagePullSecrets</a></td>
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
			<td id="ingress"><a href="./values.yaml#L73">ingress</a></td>
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
      "host": "git.example.com",
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
      "nginx.ingress.kubernetes.io/proxy-body-size": "0",
      "nginx.ingress.kubernetes.io/proxy-read-timeout": "600",
      "nginx.ingress.kubernetes.io/proxy-send-timeout": "600"
    },
    "enabled": true
  },
  "tls": []
}
</pre>
</div>
			</td>
			<td>Ingress configuration for the Forgejo web UI/API.</td>
		</tr>
		<tr>
			<td id="ingress--annotations"><a href="./values.yaml#L79">ingress.annotations</a></td>
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
			<td id="ingress--className"><a href="./values.yaml#L77">ingress.className</a></td>
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
			<td id="ingress--enabled"><a href="./values.yaml#L75">ingress.enabled</a></td>
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
			<td id="ingress--hosts"><a href="./values.yaml#L89">ingress.hosts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "host": "git.example.com",
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
			<td id="ingress--secureDefaults"><a href="./values.yaml#L82">ingress.secureDefaults</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {
    "nginx.ingress.kubernetes.io/proxy-body-size": "0",
    "nginx.ingress.kubernetes.io/proxy-read-timeout": "600",
    "nginx.ingress.kubernetes.io/proxy-send-timeout": "600"
  },
  "enabled": true
}
</pre>
</div>
			</td>
			<td>Secure-by-default ingress annotation baseline. @description Merged first; `ingress.annotations` overrides duplicate keys.</td>
		</tr>
		<tr>
			<td id="ingress--tls"><a href="./values.yaml#L95">ingress.tls</a></td>
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
			<td id="initContainers"><a href="./values.yaml#L232">initContainers</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "resources": {
    "limits": {},
    "requests": {
      "cpu": "100m",
      "memory": "128Mi"
    }
  }
}
</pre>
</div>
			</td>
			<td>Resource requests/limits for the init containers.</td>
		</tr>
		<tr>
			<td id="initPreScript"><a href="./values.yaml#L296">initPreScript</a></td>
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
			<td>Bash snippet injected at the beginning of the directory-initialization init container.</td>
		</tr>
		<tr>
			<td id="libchartCnps"><a href="./values.yaml#L469">libchartCnps</a></td>
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
			<td>Enable CiliumNetworkPolicy rendering via the `libchart-cnps` dependency.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L192">livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 10,
  "initialDelaySeconds": 200,
  "periodSeconds": 10,
  "successThreshold": 1,
  "tcpSocket": {
    "port": "http"
  },
  "timeoutSeconds": 1
}
</pre>
</div>
			</td>
			<td>Liveness probe for the main Forgejo container.</td>
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
			<td id="nodeSelector"><a href="./values.yaml#L262">nodeSelector</a></td>
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
			<td id="persistence"><a href="./values.yaml#L299">persistence</a></td>
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
  "annotations": {
    "helm.sh/resource-policy": "keep"
  },
  "create": true,
  "enabled": true,
  "existingClaim": "",
  "labels": {},
  "mountPath": "/data",
  "size": "10Gi",
  "storageClass": "",
  "subPath": "",
  "volumeName": ""
}
</pre>
</div>
			</td>
			<td>Persistence settings for Forgejo data, repositories, attachments, and generated `app.ini`.</td>
		</tr>
		<tr>
			<td id="persistence--accessModes"><a href="./values.yaml#L311">persistence.accessModes</a></td>
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
			<td id="persistence--annotations"><a href="./values.yaml#L320">persistence.annotations</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "helm.sh/resource-policy": "keep"
}
</pre>
</div>
			</td>
			<td>PVC annotations.</td>
		</tr>
		<tr>
			<td id="persistence--create"><a href="./values.yaml#L303">persistence.create</a></td>
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
			<td>Create a PersistentVolumeClaim. Set to `false` when using `existingClaim`.</td>
		</tr>
		<tr>
			<td id="persistence--enabled"><a href="./values.yaml#L301">persistence.enabled</a></td>
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
			<td>Enable persistent storage. When disabled, the chart falls back to `emptyDir`.</td>
		</tr>
		<tr>
			<td id="persistence--existingClaim"><a href="./values.yaml#L305">persistence.existingClaim</a></td>
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
			<td>Existing PersistentVolumeClaim to mount instead of creating one.</td>
		</tr>
		<tr>
			<td id="persistence--labels"><a href="./values.yaml#L323">persistence.labels</a></td>
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
			<td>PVC labels.</td>
		</tr>
		<tr>
			<td id="persistence--mountPath"><a href="./values.yaml#L318">persistence.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/data"
</pre>
</div>
			</td>
			<td>Data mount path inside the Forgejo container.</td>
		</tr>
		<tr>
			<td id="persistence--size"><a href="./values.yaml#L307">persistence.size</a></td>
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
			<td>PVC size.</td>
		</tr>
		<tr>
			<td id="persistence--storageClass"><a href="./values.yaml#L309">persistence.storageClass</a></td>
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
			<td>PVC storageClass. Empty uses the cluster default.</td>
		</tr>
		<tr>
			<td id="persistence--subPath"><a href="./values.yaml#L316">persistence.subPath</a></td>
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
			<td>Optional subPath mounted from the volume.</td>
		</tr>
		<tr>
			<td id="persistence--volumeName"><a href="./values.yaml#L314">persistence.volumeName</a></td>
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
			<td>Optional PVC volume name.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L256">podAnnotations</a></td>
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
			<td id="podDisruptionBudget"><a href="./values.yaml#L326">podDisruptionBudget</a></td>
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
			<td id="podDisruptionBudget--enabled"><a href="./values.yaml#L328">podDisruptionBudget.enabled</a></td>
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
			<td id="podDisruptionBudget--minAvailable"><a href="./values.yaml#L330">podDisruptionBudget.minAvailable</a></td>
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
			<td id="podLabels"><a href="./values.yaml#L259">podLabels</a></td>
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
			<td id="podSecurityContext"><a href="./values.yaml#L164">podSecurityContext</a></td>
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
			<td>Pod-level security context for Forgejo pods.</td>
		</tr>
		<tr>
			<td id="priorityClassName"><a href="./values.yaml#L247">priorityClassName</a></td>
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
			<td>Optional PriorityClass assigned to Forgejo pods.</td>
		</tr>
		<tr>
			<td id="readinessProbe"><a href="./values.yaml#L202">readinessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "httpGet": {
    "path": "/api/healthz",
    "port": "http"
  },
  "initialDelaySeconds": 5,
  "periodSeconds": 10,
  "successThreshold": 1,
  "timeoutSeconds": 1
}
</pre>
</div>
			</td>
			<td>Readiness probe for the main Forgejo container.</td>
		</tr>
		<tr>
			<td id="redis"><a href="./values.yaml#L448">redis</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "fullnameOverride": "",
  "nameOverride": "forgejo-cache",
  "persistence": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "enabled": true,
    "size": "1Gi",
    "storageClass": ""
  },
  "service": {
    "addBackwardsCompatibleMaster": true,
    "port": 6379,
    "targetPort": 6379,
    "type": "ClusterIP"
  }
}
</pre>
</div>
			</td>
			<td>Bundled Redis dependency configuration used when `redis.enabled=true`.</td>
		</tr>
		<tr>
			<td id="redis--enabled"><a href="./values.yaml#L450">redis.enabled</a></td>
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
			<td>Enable the bundled Redis chart.</td>
		</tr>
		<tr>
			<td id="redis--fullnameOverride"><a href="./values.yaml#L455">redis.fullnameOverride</a></td>
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
			<td>Optional subchart fullname override.</td>
		</tr>
		<tr>
			<td id="redis--nameOverride"><a href="./values.yaml#L453">redis.nameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"forgejo-cache"
</pre>
</div>
			</td>
			<td>Optional subchart name override. @description Defaults to `forgejo-cache` to avoid naming collisions with the main Forgejo resources when the Helm release name already contains `redis`.</td>
		</tr>
		<tr>
			<td id="redisIntegration"><a href="./values.yaml#L436">redisIntegration</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "cacheDb": 1,
  "enabled": false,
  "queueDb": 0,
  "sessionDb": 2
}
</pre>
</div>
			</td>
			<td>Auto-wire Forgejo queue/cache/session to the bundled Redis chart.</td>
		</tr>
		<tr>
			<td id="redisIntegration--cacheDb"><a href="./values.yaml#L443">redisIntegration.cacheDb</a></td>
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
			<td>Redis database number used for cache.</td>
		</tr>
		<tr>
			<td id="redisIntegration--enabled"><a href="./values.yaml#L439">redisIntegration.enabled</a></td>
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
			<td>Enable bundled Redis integration for Forgejo queue/cache/session. @description Requires `redis.enabled=true`. When disabled, Forgejo keeps its default in-memory session/cache and `level` queue settings unless you override them manually via `forgejo.config` or `forgejo.additionalConfigSources`.</td>
		</tr>
		<tr>
			<td id="redisIntegration--queueDb"><a href="./values.yaml#L441">redisIntegration.queueDb</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
0
</pre>
</div>
			</td>
			<td>Redis database number used for queues.</td>
		</tr>
		<tr>
			<td id="redisIntegration--sessionDb"><a href="./values.yaml#L445">redisIntegration.sessionDb</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
2
</pre>
</div>
			</td>
			<td>Redis database number used for sessions.</td>
		</tr>
		<tr>
			<td id="replicaCount"><a href="./values.yaml#L3">replicaCount</a></td>
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
			<td>Number of Forgejo pod replicas. @description This chart intentionally targets the single-pod deployment model. High-availability and multi-replica operation are out of scope for this repo-native chart.</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L224">resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "memory": "1Gi"
  },
  "requests": {
    "cpu": "100m",
    "memory": "256Mi"
  }
}
</pre>
</div>
			</td>
			<td>Resource requests/limits for the main Forgejo container.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L240">runtimeClass</a></td>
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
			<td id="runtimeClass--pods"><a href="./values.yaml#L242">runtimeClass.pods</a></td>
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
			<td>RuntimeClass for Forgejo pods.</td>
		</tr>
		<tr>
			<td id="runtimeClass--tests"><a href="./values.yaml#L244">runtimeClass.tests</a></td>
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
			<td id="securityContext"><a href="./values.yaml#L168">securityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "add": [],
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
			<td>Container-level security context for Forgejo and init containers.</td>
		</tr>
		<tr>
			<td id="securityContext--add"><a href="./values.yaml#L173">securityContext.add</a></td>
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
			<td>Additional capabilities to add. Set `SYS_CHROOT` here on CRI-O clusters if Git-over-SSH clone/read operations require it.</td>
		</tr>
		<tr>
			<td id="service"><a href="./values.yaml#L34">service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "http": {
    "annotations": {},
    "labels": {},
    "port": 3000,
    "targetPort": 3000,
    "targetProtocol": "TCP",
    "type": "ClusterIP"
  },
  "ssh": {
    "annotations": {},
    "enabled": true,
    "externalTrafficPolicy": "",
    "hostPort": null,
    "labels": {},
    "loadBalancerClass": "",
    "loadBalancerIP": "",
    "loadBalancerSourceRanges": [],
    "nodePort": null,
    "port": 22,
    "type": "ClusterIP"
  }
}
</pre>
</div>
			</td>
			<td>Main HTTP service configuration.</td>
		</tr>
		<tr>
			<td id="service--http--annotations"><a href="./values.yaml#L45">service.http.annotations</a></td>
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
			<td>Additional HTTP service annotations.</td>
		</tr>
		<tr>
			<td id="service--http--labels"><a href="./values.yaml#L47">service.http.labels</a></td>
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
			<td>Additional HTTP service labels.</td>
		</tr>
		<tr>
			<td id="service--http--port"><a href="./values.yaml#L39">service.http.port</a></td>
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
			<td>HTTP service port exposed inside the cluster.</td>
		</tr>
		<tr>
			<td id="service--http--targetPort"><a href="./values.yaml#L41">service.http.targetPort</a></td>
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
			<td>Forgejo HTTP container port.</td>
		</tr>
		<tr>
			<td id="service--http--targetProtocol"><a href="./values.yaml#L43">service.http.targetProtocol</a></td>
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
			<td>HTTP service target protocol.</td>
		</tr>
		<tr>
			<td id="service--http--type"><a href="./values.yaml#L37">service.http.type</a></td>
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
			<td>HTTP service type. This chart enforces `ClusterIP`.</td>
		</tr>
		<tr>
			<td id="service--ssh--annotations"><a href="./values.yaml#L68">service.ssh.annotations</a></td>
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
			<td>Additional SSH service annotations.</td>
		</tr>
		<tr>
			<td id="service--ssh--enabled"><a href="./values.yaml#L50">service.ssh.enabled</a></td>
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
			<td>Enable the dedicated SSH service.</td>
		</tr>
		<tr>
			<td id="service--ssh--externalTrafficPolicy"><a href="./values.yaml#L66">service.ssh.externalTrafficPolicy</a></td>
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
			<td>Optional external traffic policy when `service.ssh.type` is `NodePort` or `LoadBalancer`.</td>
		</tr>
		<tr>
			<td id="service--ssh--hostPort"><a href="./values.yaml#L56">service.ssh.hostPort</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td>Optional hostPort bound to the Forgejo SSH container port.</td>
		</tr>
		<tr>
			<td id="service--ssh--labels"><a href="./values.yaml#L70">service.ssh.labels</a></td>
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
			<td>Additional SSH service labels.</td>
		</tr>
		<tr>
			<td id="service--ssh--loadBalancerClass"><a href="./values.yaml#L62">service.ssh.loadBalancerClass</a></td>
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
			<td>Optional LoadBalancer class when `service.ssh.type=LoadBalancer`.</td>
		</tr>
		<tr>
			<td id="service--ssh--loadBalancerIP"><a href="./values.yaml#L60">service.ssh.loadBalancerIP</a></td>
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
			<td>Optional LoadBalancer IP when `service.ssh.type=LoadBalancer`.</td>
		</tr>
		<tr>
			<td id="service--ssh--loadBalancerSourceRanges"><a href="./values.yaml#L64">service.ssh.loadBalancerSourceRanges</a></td>
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
			<td>Optional LoadBalancer source ranges when `service.ssh.type=LoadBalancer`.</td>
		</tr>
		<tr>
			<td id="service--ssh--nodePort"><a href="./values.yaml#L58">service.ssh.nodePort</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td>Optional NodePort when `service.ssh.type=NodePort`.</td>
		</tr>
		<tr>
			<td id="service--ssh--port"><a href="./values.yaml#L54">service.ssh.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
22
</pre>
</div>
			</td>
			<td>SSH service port advertised by Forgejo clone URLs unless explicitly overridden in `forgejo.config.server.SSH_PORT`.</td>
		</tr>
		<tr>
			<td id="service--ssh--type"><a href="./values.yaml#L52">service.ssh.type</a></td>
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
			<td>SSH service type. Unlike HTTP, SSH may use `ClusterIP`, `NodePort`, or `LoadBalancer`.</td>
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
  "automountServiceAccountToken": false,
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
			<td id="serviceAccount--annotations"><a href="./values.yaml#L149">serviceAccount.annotations</a></td>
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
			<td id="serviceAccount--automountServiceAccountToken"><a href="./values.yaml#L155">serviceAccount.automountServiceAccountToken</a></td>
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
			<td id="serviceAccount--create"><a href="./values.yaml#L147">serviceAccount.create</a></td>
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
			<td id="serviceAccount--labels"><a href="./values.yaml#L151">serviceAccount.labels</a></td>
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
			<td id="serviceAccount--name"><a href="./values.yaml#L153">serviceAccount.name</a></td>
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
			<td id="startupProbe"><a href="./values.yaml#L213">startupProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "failureThreshold": 10,
  "initialDelaySeconds": 60,
  "periodSeconds": 10,
  "successThreshold": 1,
  "tcpSocket": {
    "port": "http"
  },
  "timeoutSeconds": 1
}
</pre>
</div>
			</td>
			<td>Startup probe for the main Forgejo container.</td>
		</tr>
		<tr>
			<td id="strategy"><a href="./values.yaml#L6">strategy</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "type": "Recreate"
}
</pre>
</div>
			</td>
			<td>Deployment strategy.</td>
		</tr>
		<tr>
			<td id="strategy--type"><a href="./values.yaml#L8">strategy.type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Recreate"
</pre>
</div>
			</td>
			<td>Strategy type. Forgejo should use `Recreate` by default.</td>
		</tr>
		<tr>
			<td id="tcpRoute"><a href="./values.yaml#L131">tcpRoute</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "enabled": false,
  "parentRefs": [
    {
      "name": "envoy-gateway",
      "namespace": "envoy-gateway-system",
      "sectionName": "ssh"
    }
  ],
  "port": null
}
</pre>
</div>
			</td>
			<td>Gateway API TCPRoute configuration for Forgejo SSH traffic.</td>
		</tr>
		<tr>
			<td id="tcpRoute--annotations"><a href="./values.yaml#L135">tcpRoute.annotations</a></td>
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
			<td>TCPRoute annotations.</td>
		</tr>
		<tr>
			<td id="tcpRoute--enabled"><a href="./values.yaml#L133">tcpRoute.enabled</a></td>
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
			<td>Enable TCPRoute resource creation for SSH.</td>
		</tr>
		<tr>
			<td id="tcpRoute--parentRefs"><a href="./values.yaml#L137">tcpRoute.parentRefs</a></td>
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
    "sectionName": "ssh"
  }
]
</pre>
</div>
			</td>
			<td>ParentRefs for the TCPRoute.</td>
		</tr>
		<tr>
			<td id="tcpRoute--port"><a href="./values.yaml#L142">tcpRoute.port</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
null
</pre>
</div>
			</td>
			<td>Optional TCPRoute backend port override. Defaults to `service.ssh.port` when empty.</td>
		</tr>
		<tr>
			<td id="test"><a href="./values.yaml#L517">test</a></td>
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
    "repository": "busybox",
    "tag": "1.37"
  }
}
</pre>
</div>
			</td>
			<td>Helm test settings.</td>
		</tr>
		<tr>
			<td id="test--enabled"><a href="./values.yaml#L519">test.enabled</a></td>
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
			<td>Enable the HTTP connectivity smoke test pod.</td>
		</tr>
		<tr>
			<td id="test--image--pullPolicy"><a href="./values.yaml#L526">test.image.pullPolicy</a></td>
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
			<td>Test image pull policy.</td>
		</tr>
		<tr>
			<td id="test--image--repository"><a href="./values.yaml#L522">test.image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"busybox"
</pre>
</div>
			</td>
			<td>Test image repository.</td>
		</tr>
		<tr>
			<td id="test--image--tag"><a href="./values.yaml#L524">test.image.tag</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"1.37"
</pre>
</div>
			</td>
			<td>Test image tag.</td>
		</tr>
		<tr>
			<td id="tmpVolume"><a href="./values.yaml#L183">tmpVolume</a></td>
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
			<td>Writable tmp volume required by Forgejo and the init scripts.</td>
		</tr>
		<tr>
			<td id="tmpVolume--enabled"><a href="./values.yaml#L185">tmpVolume.enabled</a></td>
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
			<td>Enable the tmp volume mount.</td>
		</tr>
		<tr>
			<td id="tmpVolume--mountPath"><a href="./values.yaml#L187">tmpVolume.mountPath</a></td>
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
			<td>Mount path for the tmp volume.</td>
		</tr>
		<tr>
			<td id="tmpVolume--sizeLimit"><a href="./values.yaml#L189">tmpVolume.sizeLimit</a></td>
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
			<td id="tolerations"><a href="./values.yaml#L265">tolerations</a></td>
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

## Notes

* This chart intentionally targets the single-pod Forgejo deployment model. It defaults to `replicaCount=1` with `Recreate` strategy and does not try to paper over Forgejo HA complexity.
* `service.http.type` stays `ClusterIP` in repo style. For external web exposure use `ingress` or `gatewayApi`.
* SSH is modeled separately from HTTP. Ingress-nginx only covers web traffic; for SSH use either `tcpRoute` or a non-`ClusterIP` `service.ssh.type`.
* The chart defaults to the official rootless Forgejo image. On some CRI-O based clusters, Git-over-SSH may additionally require `securityContext.add: [SYS_CHROOT]` as documented by Forgejo.
* `database.useCnpgCluster.enabled=true` is the recommended production path. `database.type=sqlite` remains available for lightweight installs.
* Forgejo's default in-memory session/cache and `level` queue adapters are left untouched unless you explicitly enable `redisIntegration.enabled=true` together with `redis.enabled=true` or provide your own overrides via `forgejo.additionalConfigSources` / `forgejo.additionalConfigFromEnvs`.
* `forgejo.additionalConfigSources` and `forgejo.additionalConfigFromEnvs` are the chart's generic GitOps-friendly escape hatches for sensitive or advanced `app.ini` settings such as OIDC, LDAP, mailer, proxy, webhook, or external Redis/Valkey connection strings.
