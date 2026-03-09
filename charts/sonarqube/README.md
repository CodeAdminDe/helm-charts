

# sonarqube

![Version: 0.3.0](https://img.shields.io/badge/Version-0.3.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 26.3.0.120487-community](https://img.shields.io/badge/AppVersion-26.3.0.120487--community-informational?style=flat-square)

A Helm chart for deploying SonarQube Server on Kubernetes.

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
helm install sonarqube codeadminde/sonarqube
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

To install the chart with the release name `sonarqube`

```bash
helm install sonarqube codeadminde/sonarqube
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

## Uninstallation

To uninstall the chart release named `sonarqube`

```bash
helm uninstall sonarqube
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
> helm install sonarqube codeadminde/sonarqube -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install sonarqube --set key=value --set keyTwo=secondValue codeadminde/sonarqube
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
			<td id="additionalEnvSecrets"><a href="./values.yaml#L395">additionalEnvSecrets</a></td>
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
			<td>Additional env vars from existing secrets. @description Supports both map and list forms.
```yaml
additionalEnvSecrets:
  SONAR_AUTH_GITHUB_CLIENTSECRET: my-secret
  SONAR_AUTH_GITHUB_CLIENTID:
    secretName: my-secret
    secretKey: clientId

additionalEnvSecrets:
  - name: SONAR_AUTH_GITHUB_CLIENTSECRET
    secretName: my-secret
    secretKey: clientSecret
```</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L452">affinity</a></td>
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
			<td id="applyHealthChecks"><a href="./values.yaml#L327">applyHealthChecks</a></td>
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
			<td id="applySecurity"><a href="./values.yaml#L206">applySecurity</a></td>
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
			<td id="autoscaling"><a href="./values.yaml#L369">autoscaling</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "maxReplicas": 1,
  "minReplicas": 1,
  "targetCPUUtilizationPercentage": 80
}
</pre>
</div>
			</td>
			<td>HorizontalPodAutoscaler configuration.</td>
		</tr>
		<tr>
			<td id="autoscaling--enabled"><a href="./values.yaml#L372">autoscaling.enabled</a></td>
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
			<td>Enable HPA generation. @description Not supported by this chart because SonarQube Server deployment is single-replica.</td>
		</tr>
		<tr>
			<td id="cnps"><a href="./values.yaml#L415">cnps</a></td>
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
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L429">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow egress traffic from SonarQube pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEndpoints"><a href="./values.yaml#L431">cnps.appTraffic.egress.toEndpoints</a></td>
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
			<td>Explicit destination endpoint selectors.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEntities"><a href="./values.yaml#L433">cnps.appTraffic.egress.toEntities</a></td>
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
			<td>Explicit destination entities.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toPorts"><a href="./values.yaml#L435">cnps.appTraffic.egress.toPorts</a></td>
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
			<td>Allowed egress ports.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L422">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress traffic to SonarQube pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEndpoints"><a href="./values.yaml#L424">cnps.appTraffic.ingress.fromEndpoints</a></td>
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
			<td>Explicit source endpoint selectors.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEntities"><a href="./values.yaml#L426">cnps.appTraffic.ingress.fromEntities</a></td>
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
			<td>Explicit source entities.</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic--instanceExtraEgress"><a href="./values.yaml#L418">cnps.cnpgTraffic.instanceExtraEgress</a></td>
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
			<td>Additional Cilium egress rules for CNPG instance pods when libchartCnps.includeCnpgPolicies=true.</td>
		</tr>
		<tr>
			<td id="database"><a href="./values.yaml#L287">database</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "jdbcUrl": "",
  "postgres": {
    "host": "postgresql.default.svc.cluster.local",
    "name": "sonarqube",
    "passwordSecret": {
      "key": "password",
      "name": "sonarqube-postgresql-app"
    },
    "port": 5432,
    "sslMode": "require",
    "user": "sonarqube"
  },
  "useCnpgCluster": {
    "appConnectionSecretName": "",
    "clusterName": "cnpg-cluster",
    "enabled": false,
    "port": 5432,
    "secretKeys": {
      "password": "password",
      "username": "username"
    },
    "sslMode": "require"
  }
}
</pre>
</div>
			</td>
			<td>PostgreSQL connection settings.</td>
		</tr>
		<tr>
			<td id="database--jdbcUrl"><a href="./values.yaml#L290">database.jdbcUrl</a></td>
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
			<td>Optional full JDBC URL override. @description When empty, the chart builds `jdbc:postgresql://host:port/db?sslmode=...` from values.</td>
		</tr>
		<tr>
			<td id="database--postgres--host"><a href="./values.yaml#L294">database.postgres.host</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"postgresql.default.svc.cluster.local"
</pre>
</div>
			</td>
			<td>PostgreSQL host (used when CNPG mode is disabled and jdbcUrl is empty).</td>
		</tr>
		<tr>
			<td id="database--postgres--name"><a href="./values.yaml#L298">database.postgres.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"sonarqube"
</pre>
</div>
			</td>
			<td>PostgreSQL database name.</td>
		</tr>
		<tr>
			<td id="database--postgres--passwordSecret--key"><a href="./values.yaml#L307">database.postgres.passwordSecret.key</a></td>
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
			<td>Secret key containing PostgreSQL password.</td>
		</tr>
		<tr>
			<td id="database--postgres--passwordSecret--name"><a href="./values.yaml#L305">database.postgres.passwordSecret.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"sonarqube-postgresql-app"
</pre>
</div>
			</td>
			<td>Existing secret containing PostgreSQL password.</td>
		</tr>
		<tr>
			<td id="database--postgres--port"><a href="./values.yaml#L296">database.postgres.port</a></td>
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
			<td id="database--postgres--sslMode"><a href="./values.yaml#L302">database.postgres.sslMode</a></td>
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
			<td>PostgreSQL SSL mode (for generated JDBC URL).</td>
		</tr>
		<tr>
			<td id="database--postgres--user"><a href="./values.yaml#L300">database.postgres.user</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"sonarqube"
</pre>
</div>
			</td>
			<td>PostgreSQL username (used when CNPG mode is disabled).</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--appConnectionSecretName"><a href="./values.yaml#L315">database.useCnpgCluster.appConnectionSecretName</a></td>
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
			<td>Explicit CNPG app secret name (defaults to `<clusterName>-app`).</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--clusterName"><a href="./values.yaml#L313">database.useCnpgCluster.clusterName</a></td>
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
			<td>CNPG cluster name (RW service `<clusterName>-rw`).</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--enabled"><a href="./values.yaml#L311">database.useCnpgCluster.enabled</a></td>
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
			<td>Resolve DB credentials from an existing CNPG cluster app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--port"><a href="./values.yaml#L317">database.useCnpgCluster.port</a></td>
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
			<td id="database--useCnpgCluster--secretKeys--password"><a href="./values.yaml#L324">database.useCnpgCluster.secretKeys.password</a></td>
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
			<td>Key for password in app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--username"><a href="./values.yaml#L322">database.useCnpgCluster.secretKeys.username</a></td>
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
			<td>Key for username in app secret.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--sslMode"><a href="./values.yaml#L319">database.useCnpgCluster.sslMode</a></td>
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
			<td>SSL mode for generated CNPG JDBC URL.</td>
		</tr>
		<tr>
			<td id="env"><a href="./values.yaml#L378">env</a></td>
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
			<td>Additional non-sensitive environment variables.</td>
		</tr>
		<tr>
			<td id="envFromConfigMaps"><a href="./values.yaml#L401">envFromConfigMaps</a></td>
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
			<td id="envFromSecrets"><a href="./values.yaml#L398">envFromSecrets</a></td>
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
			<td id="extensionsPersistence"><a href="./values.yaml#L169">extensionsPersistence</a></td>
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
  "emptyDirSizeLimit": "2Gi",
  "enabled": false,
  "existingClaim": "",
  "retain": false,
  "size": "5Gi",
  "storageClass": "",
  "volumeName": ""
}
</pre>
</div>
			</td>
			<td>Optional persistent storage for SonarQube extensions directory.</td>
		</tr>
		<tr>
			<td id="extensionsPersistence--accessModes"><a href="./values.yaml#L181">extensionsPersistence.accessModes</a></td>
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
			<td>Extensions PVC access modes.</td>
		</tr>
		<tr>
			<td id="extensionsPersistence--annotations"><a href="./values.yaml#L184">extensionsPersistence.annotations</a></td>
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
			<td>Extensions PVC annotations.</td>
		</tr>
		<tr>
			<td id="extensionsPersistence--emptyDirSizeLimit"><a href="./values.yaml#L188">extensionsPersistence.emptyDirSizeLimit</a></td>
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
			<td>emptyDir size limit when extensions persistence is disabled.</td>
		</tr>
		<tr>
			<td id="extensionsPersistence--enabled"><a href="./values.yaml#L171">extensionsPersistence.enabled</a></td>
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
			<td>Enable dedicated persistent storage for `/opt/sonarqube/extensions`.</td>
		</tr>
		<tr>
			<td id="extensionsPersistence--existingClaim"><a href="./values.yaml#L175">extensionsPersistence.existingClaim</a></td>
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
			<td>Existing PVC to use for extensions.</td>
		</tr>
		<tr>
			<td id="extensionsPersistence--retain"><a href="./values.yaml#L173">extensionsPersistence.retain</a></td>
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
			<td>Keep extensions PVC when Helm release is deleted.</td>
		</tr>
		<tr>
			<td id="extensionsPersistence--size"><a href="./values.yaml#L177">extensionsPersistence.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"5Gi"
</pre>
</div>
			</td>
			<td>Extensions PVC storage size.</td>
		</tr>
		<tr>
			<td id="extensionsPersistence--storageClass"><a href="./values.yaml#L179">extensionsPersistence.storageClass</a></td>
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
			<td>Extensions PVC storageClass.</td>
		</tr>
		<tr>
			<td id="extensionsPersistence--volumeName"><a href="./values.yaml#L186">extensionsPersistence.volumeName</a></td>
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
			<td>Extensions PVC volumeName binding.</td>
		</tr>
		<tr>
			<td id="extraInitContainers"><a href="./values.yaml#L284">extraInitContainers</a></td>
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
			<td>Additional custom init containers appended after built-in init containers.</td>
		</tr>
		<tr>
			<td id="extraVolumeMounts"><a href="./values.yaml#L407">extraVolumeMounts</a></td>
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
			<td>Additional volume mounts.</td>
		</tr>
		<tr>
			<td id="extraVolumes"><a href="./values.yaml#L404">extraVolumes</a></td>
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
			<td>Additional volumes.</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L7">fullnameOverride</a></td>
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
			<td id="gatewayApi"><a href="./values.yaml#L94">gatewayApi</a></td>
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
    "sonarqube.example.com"
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
			<td id="gatewayApi--annotations"><a href="./values.yaml#L98">gatewayApi.annotations</a></td>
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
			<td id="gatewayApi--backendRefs"><a href="./values.yaml#L117">gatewayApi.backendRefs</a></td>
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
			<td id="gatewayApi--enabled"><a href="./values.yaml#L96">gatewayApi.enabled</a></td>
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
			<td id="gatewayApi--filters"><a href="./values.yaml#L115">gatewayApi.filters</a></td>
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
			<td id="gatewayApi--hostnames"><a href="./values.yaml#L107">gatewayApi.hostnames</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "sonarqube.example.com"
]
</pre>
</div>
			</td>
			<td>Hostnames served by this route.</td>
		</tr>
		<tr>
			<td id="gatewayApi--labels"><a href="./values.yaml#L100">gatewayApi.labels</a></td>
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
			<td id="gatewayApi--matches"><a href="./values.yaml#L110">gatewayApi.matches</a></td>
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
			<td id="gatewayApi--parentRefs"><a href="./values.yaml#L102">gatewayApi.parentRefs</a></td>
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
			<td id="image"><a href="./values.yaml#L10">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "sonarqube",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>Container image configuration.</td>
		</tr>
		<tr>
			<td id="image--pullPolicy"><a href="./values.yaml#L14">image.pullPolicy</a></td>
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
			<td id="image--repository"><a href="./values.yaml#L12">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"sonarqube"
</pre>
</div>
			</td>
			<td>Image repository.</td>
		</tr>
		<tr>
			<td id="image--tag"><a href="./values.yaml#L16">image.tag</a></td>
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
			<td id="imagePullSecrets"><a href="./values.yaml#L19">imagePullSecrets</a></td>
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
			<td id="ingress"><a href="./values.yaml#L61">ingress</a></td>
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
      "host": "sonarqube.example.com",
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
    "proxyBodySize": "64m",
    "proxyBuffering": false,
    "proxyHttpVersion": "1.1",
    "proxyReadTimeoutSeconds": 3600,
    "proxyRequestBuffering": false,
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
			<td id="ingress--annotations"><a href="./values.yaml#L67">ingress.annotations</a></td>
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
			<td id="ingress--className"><a href="./values.yaml#L65">ingress.className</a></td>
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
			<td id="ingress--enabled"><a href="./values.yaml#L63">ingress.enabled</a></td>
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
    "host": "sonarqube.example.com",
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
			<td id="ingress--secureDefaults"><a href="./values.yaml#L69">ingress.secureDefaults</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "proxyBodySize": "64m",
  "proxyBuffering": false,
  "proxyHttpVersion": "1.1",
  "proxyReadTimeoutSeconds": 3600,
  "proxyRequestBuffering": false,
  "proxySendTimeoutSeconds": 3600
}
</pre>
</div>
			</td>
			<td>Secure defaults for long-lived analysis and UI/API requests.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--enabled"><a href="./values.yaml#L71">ingress.secureDefaults.enabled</a></td>
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
			<td id="ingress--secureDefaults--proxyBodySize"><a href="./values.yaml#L83">ingress.secureDefaults.proxyBodySize</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"64m"
</pre>
</div>
			</td>
			<td>Maximum accepted request body size.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyBuffering"><a href="./values.yaml#L77">ingress.secureDefaults.proxyBuffering</a></td>
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
			<td>Enable proxy buffering (`on` when true, `off` when false).</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyHttpVersion"><a href="./values.yaml#L81">ingress.secureDefaults.proxyHttpVersion</a></td>
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
			<td id="ingress--secureDefaults--proxyReadTimeoutSeconds"><a href="./values.yaml#L73">ingress.secureDefaults.proxyReadTimeoutSeconds</a></td>
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
			<td id="ingress--secureDefaults--proxyRequestBuffering"><a href="./values.yaml#L79">ingress.secureDefaults.proxyRequestBuffering</a></td>
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
			<td>Enable request buffering (`on` when true, `off` when false).</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxySendTimeoutSeconds"><a href="./values.yaml#L75">ingress.secureDefaults.proxySendTimeoutSeconds</a></td>
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
			<td id="ingress--tls"><a href="./values.yaml#L91">ingress.tls</a></td>
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
			<td id="initContainers"><a href="./values.yaml#L226">initContainers</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "plugins": {
    "enabled": false,
    "image": {
      "pullPolicy": "IfNotPresent",
      "repository": "curlimages/curl",
      "tag": "8.18.0"
    },
    "install": [],
    "noCheckCertificate": false,
    "resources": {},
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
    }
  },
  "sysctl": {
    "enabled": false,
    "fsFileMax": 131072,
    "image": {
      "pullPolicy": "IfNotPresent",
      "repository": "busybox",
      "tag": "1.37"
    },
    "securityContext": {
      "allowPrivilegeEscalation": true,
      "capabilities": {
        "add": [
          "SYS_RESOURCE"
        ]
      },
      "privileged": true,
      "readOnlyRootFilesystem": false,
      "runAsGroup": 0,
      "runAsNonRoot": false,
      "runAsUser": 0,
      "seccompProfile": {
        "type": "Unconfined"
      }
    },
    "vmMaxMapCount": 524288
  }
}
</pre>
</div>
			</td>
			<td>Init container settings.</td>
		</tr>
		<tr>
			<td id="initContainers--plugins--enabled"><a href="./values.yaml#L252">initContainers.plugins.enabled</a></td>
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
			<td>Enable plugin download init container.</td>
		</tr>
		<tr>
			<td id="initContainers--plugins--install"><a href="./values.yaml#L268">initContainers.plugins.install</a></td>
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
			<td>Plugin artifacts downloaded into `/opt/sonarqube/extensions/plugins` before startup. @description Entries can be URL strings or objects with `url` + optional `checksum` (sha256 hex).
```yaml
install:
  - "https://example.com/plugins/foo.jar"
  - url: "https://example.com/plugins/bar.jar"
    checksum: "0123456789abcdef..."
```</td>
		</tr>
		<tr>
			<td id="initContainers--plugins--noCheckCertificate"><a href="./values.yaml#L258">initContainers.plugins.noCheckCertificate</a></td>
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
			<td>Skip TLS certificate verification during plugin download.</td>
		</tr>
		<tr>
			<td id="initContainers--plugins--resources"><a href="./values.yaml#L270">initContainers.plugins.resources</a></td>
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
			<td>Plugin installer resource requests/limits.</td>
		</tr>
		<tr>
			<td id="initContainers--sysctl--enabled"><a href="./values.yaml#L230">initContainers.sysctl.enabled</a></td>
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
			<td>Enable privileged sysctl init container for Elasticsearch kernel prerequisites. @description Keep disabled unless your nodes are not pre-configured with required kernel values.</td>
		</tr>
		<tr>
			<td id="libchartCnps"><a href="./values.yaml#L410">libchartCnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "includeCnpgPolicies": true
}
</pre>
</div>
			</td>
			<td>CiliumNetworkPolicies dependency toggle.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L340">livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "httpGet": {
    "port": "http"
  },
  "initialDelaySeconds": 60,
  "periodSeconds": 20,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Liveness probe for SonarQube runtime.</td>
		</tr>
		<tr>
			<td id="livenessProbe--httpGet--port"><a href="./values.yaml#L343">livenessProbe.httpGet.port</a></td>
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
			<td>Probe path is derived from `sonarqube.webContext` by the chart helper.</td>
		</tr>
		<tr>
			<td id="logsVolume"><a href="./values.yaml#L196">logsVolume</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "sizeLimit": "2Gi"
}
</pre>
</div>
			</td>
			<td>Writable logs volume mounted at `/opt/sonarqube/logs`.</td>
		</tr>
		<tr>
			<td id="logsVolume--sizeLimit"><a href="./values.yaml#L198">logsVolume.sizeLimit</a></td>
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
			<td id="nameOverride"><a href="./values.yaml#L6">nameOverride</a></td>
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
			<td id="nodeSelector"><a href="./values.yaml#L446">nodeSelector</a></td>
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
			<td id="persistence"><a href="./values.yaml#L147">persistence</a></td>
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
  "emptyDirSizeLimit": "20Gi",
  "enabled": true,
  "existingClaim": "",
  "retain": false,
  "size": "20Gi",
  "storageClass": "",
  "volumeName": ""
}
</pre>
</div>
			</td>
			<td>Persistent storage for SonarQube data directory.</td>
		</tr>
		<tr>
			<td id="persistence--accessModes"><a href="./values.yaml#L159">persistence.accessModes</a></td>
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
			<td id="persistence--annotations"><a href="./values.yaml#L162">persistence.annotations</a></td>
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
			<td id="persistence--emptyDirSizeLimit"><a href="./values.yaml#L166">persistence.emptyDirSizeLimit</a></td>
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
			<td>emptyDir size limit when persistence is disabled.</td>
		</tr>
		<tr>
			<td id="persistence--enabled"><a href="./values.yaml#L149">persistence.enabled</a></td>
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
			<td>Enable persistent storage for `/opt/sonarqube/data`.</td>
		</tr>
		<tr>
			<td id="persistence--existingClaim"><a href="./values.yaml#L153">persistence.existingClaim</a></td>
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
			<td id="persistence--retain"><a href="./values.yaml#L151">persistence.retain</a></td>
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
			<td id="persistence--size"><a href="./values.yaml#L155">persistence.size</a></td>
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
			<td>PVC storage size.</td>
		</tr>
		<tr>
			<td id="persistence--storageClass"><a href="./values.yaml#L157">persistence.storageClass</a></td>
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
			<td id="persistence--volumeName"><a href="./values.yaml#L164">persistence.volumeName</a></td>
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
			<td id="podAnnotations"><a href="./values.yaml#L440">podAnnotations</a></td>
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
			<td id="podLabels"><a href="./values.yaml#L443">podLabels</a></td>
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
			<td id="podSecurityContext"><a href="./values.yaml#L209">podSecurityContext</a></td>
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
			<td>Pod-level security context for workload pods.</td>
		</tr>
		<tr>
			<td id="rbac"><a href="./values.yaml#L131">rbac</a></td>
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
			<td id="rbac--create"><a href="./values.yaml#L133">rbac.create</a></td>
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
			<td id="rbac--namespace"><a href="./values.yaml#L135">rbac.namespace</a></td>
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
			<td id="rbac--rules"><a href="./values.yaml#L137">rbac.rules</a></td>
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
			<td id="readinessProbe"><a href="./values.yaml#L350">readinessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 6,
  "httpGet": {
    "port": "http"
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Readiness probe for SonarQube runtime.</td>
		</tr>
		<tr>
			<td id="readinessProbe--httpGet--port"><a href="./values.yaml#L353">readinessProbe.httpGet.port</a></td>
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
			<td>Probe path is derived from `sonarqube.webContext` by the chart helper.</td>
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
			<td>Number of SonarQube pod replicas. @description SonarQube Server is designed for a single application pod in this chart.</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L360">resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "cpu": "2",
    "memory": "4Gi"
  },
  "requests": {
    "cpu": "500m",
    "memory": "2Gi"
  }
}
</pre>
</div>
			</td>
			<td>Resource requests/limits.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L140">runtimeClass</a></td>
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
			<td id="runtimeClass--pods"><a href="./values.yaml#L142">runtimeClass.pods</a></td>
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
			<td id="runtimeClass--tests"><a href="./values.yaml#L144">runtimeClass.tests</a></td>
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
			<td id="securityContext"><a href="./values.yaml#L213">securityContext</a></td>
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
			<td>Container-level security context for workload containers.</td>
		</tr>
		<tr>
			<td id="service"><a href="./values.yaml#L46">service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "labels": {},
  "port": 9000,
  "targetPort": 9000,
  "targetProtocol": "TCP",
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>Kubernetes Service configuration.</td>
		</tr>
		<tr>
			<td id="service--annotations"><a href="./values.yaml#L50">service.annotations</a></td>
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
			<td id="service--labels"><a href="./values.yaml#L52">service.labels</a></td>
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
			<td id="service--port"><a href="./values.yaml#L54">service.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
9000
</pre>
</div>
			</td>
			<td>Service port.</td>
		</tr>
		<tr>
			<td id="service--targetPort"><a href="./values.yaml#L56">service.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
9000
</pre>
</div>
			</td>
			<td>Container target port.</td>
		</tr>
		<tr>
			<td id="service--targetProtocol"><a href="./values.yaml#L58">service.targetProtocol</a></td>
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
			<td id="service--type"><a href="./values.yaml#L48">service.type</a></td>
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
			<td id="serviceAccount"><a href="./values.yaml#L120">serviceAccount</a></td>
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
			<td id="serviceAccount--annotations"><a href="./values.yaml#L124">serviceAccount.annotations</a></td>
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
			<td id="serviceAccount--automountServiceAccountToken"><a href="./values.yaml#L128">serviceAccount.automountServiceAccountToken</a></td>
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
			<td id="serviceAccount--create"><a href="./values.yaml#L122">serviceAccount.create</a></td>
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
			<td id="serviceAccount--name"><a href="./values.yaml#L126">serviceAccount.name</a></td>
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
			<td id="sonarTempVolume"><a href="./values.yaml#L201">sonarTempVolume</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "sizeLimit": "2Gi"
}
</pre>
</div>
			</td>
			<td>Writable temp volume mounted at `/opt/sonarqube/temp`.</td>
		</tr>
		<tr>
			<td id="sonarTempVolume--sizeLimit"><a href="./values.yaml#L203">sonarTempVolume.sizeLimit</a></td>
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
			<td id="sonarqube"><a href="./values.yaml#L22">sonarqube</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "edition": "community",
  "javaOpts": {
    "ce": "",
    "search": "",
    "web": ""
  },
  "monitoringPasscodeSecret": {
    "key": "passcode",
    "name": ""
  },
  "webContext": "/"
}
</pre>
</div>
			</td>
			<td>SonarQube runtime configuration.</td>
		</tr>
		<tr>
			<td id="sonarqube--edition"><a href="./values.yaml#L25">sonarqube.edition</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"community"
</pre>
</div>
			</td>
			<td>SonarQube edition hint for operators. @description This chart does not auto-select image tags based on edition; set `image.tag` explicitly for non-community editions.</td>
		</tr>
		<tr>
			<td id="sonarqube--javaOpts--ce"><a href="./values.yaml#L41">sonarqube.javaOpts.ce</a></td>
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
			<td>Optional `SONAR_CE_JAVAOPTS` value.</td>
		</tr>
		<tr>
			<td id="sonarqube--javaOpts--search"><a href="./values.yaml#L43">sonarqube.javaOpts.search</a></td>
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
			<td>Optional `SONAR_SEARCH_JAVAOPTS` value.</td>
		</tr>
		<tr>
			<td id="sonarqube--javaOpts--web"><a href="./values.yaml#L39">sonarqube.javaOpts.web</a></td>
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
			<td>Optional `SONAR_WEB_JAVAOPTS` value.</td>
		</tr>
		<tr>
			<td id="sonarqube--monitoringPasscodeSecret"><a href="./values.yaml#L33">sonarqube.monitoringPasscodeSecret</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "key": "passcode",
  "name": ""
}
</pre>
</div>
			</td>
			<td>Optional secret containing the monitoring passcode (`SONAR_WEB_SYSTEMPASSCODE`). @description Strongly recommended when exposing monitoring endpoints.</td>
		</tr>
		<tr>
			<td id="sonarqube--webContext"><a href="./values.yaml#L29">sonarqube.webContext</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/"
</pre>
</div>
			</td>
			<td>Web context path exposed by SonarQube. @description Keep `/` unless you intentionally serve SonarQube below a path prefix.</td>
		</tr>
		<tr>
			<td id="startupProbe"><a href="./values.yaml#L330">startupProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 60,
  "httpGet": {
    "port": "http"
  },
  "initialDelaySeconds": 20,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Startup probe for SonarQube bootstrap.</td>
		</tr>
		<tr>
			<td id="startupProbe--httpGet--port"><a href="./values.yaml#L333">startupProbe.httpGet.port</a></td>
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
			<td>Probe path is derived from `sonarqube.webContext` by the chart helper.</td>
		</tr>
		<tr>
			<td id="tmpVolume"><a href="./values.yaml#L191">tmpVolume</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "sizeLimit": "2Gi"
}
</pre>
</div>
			</td>
			<td>Writable temp volume mounted at `/tmp`.</td>
		</tr>
		<tr>
			<td id="tmpVolume--sizeLimit"><a href="./values.yaml#L193">tmpVolume.sizeLimit</a></td>
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
			<td id="tolerations"><a href="./values.yaml#L449">tolerations</a></td>
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

### Upstream behavior and chart scope

* This chart intentionally deploys SonarQube Server with a single `Deployment` replica.
* External infrastructure components (Ingress Controller / Gateway Controller / PostgreSQL operator installation) are out of scope.
* The runtime model follows SonarSource Kubernetes guidance: external PostgreSQL, persistent SonarQube data, and explicit security context choices.

### Database model

* SonarQube requires PostgreSQL. This chart supports:
  * direct PostgreSQL configuration (`database.postgres.*`)
  * CNPG app-secret integration (`database.useCnpgCluster.*`)
* For CNPG mode, JDBC URL host/port/sslmode are resolved from chart values while username/password come from the CNPG app secret.

### Security defaults

* Service exposure defaults to `ClusterIP`; use ingress or Gateway API resources for north-south traffic.
* Container hardening defaults are enabled (`runAsNonRoot`, dropped capabilities, no privilege escalation, `RuntimeDefault` seccomp).
* `readOnlyRootFilesystem=true` is paired with explicit writable volumes (`/opt/sonarqube/{data,extensions,logs,temp}` and `/tmp`).
* Privileged sysctl init behavior is available but disabled by default (`initContainers.sysctl.enabled=false`).

### Persistence behavior

* Data PVC (`/opt/sonarqube/data`) is enabled by default.
* Extensions persistence is optional (`extensionsPersistence.enabled=false` by default).
* PVC lifecycle defaults to Kubernetes behavior: scaling keeps PVCs, uninstall removes them unless `*.retain=true` is set.

### Cilium network policies

* `libchartCnps` integration is enabled by default.
* Ingress source defaults are conditional:
  * ingress-nginx labels are added when `ingress.enabled=true`
  * envoy-gateway labels are added when `gatewayApi.enabled=true`
  * both sets are added when both are enabled
