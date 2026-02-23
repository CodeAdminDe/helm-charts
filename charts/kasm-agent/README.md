

# kasm-agent

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.18.1](https://img.shields.io/badge/AppVersion-1.18.1-informational?style=flat-square)
A Helm chart for deploying a Kasm agent workload in Kubernetes (advanced/unsupported static-agent model).
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
helm install kasm-agent codeadminde/kasm-agent
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

To install the chart with the release name `kasm-agent`

```bash
helm install kasm-agent codeadminde/kasm-agent
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._
## Uninstallation

To uninstall the chart release named `kasm-agent`

```bash
helm uninstall kasm-agent
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
> helm install kasm-agent codeadminde/kasm-agent -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Then you have to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install kasm-agent --set key=value --set keyTwo=secondValue codeadminde/kasm-agent
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
			<td id="affinity"><a href="./values.yaml#L149">affinity</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="agent--dockerHost"><a href="./values.yaml#L64">agent.dockerHost</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"tcp://docker-host.example.internal:2376"
</pre>
</div>
			</td>
			<td>Optional Docker host override, e.g. tcp://docker-host:2376. @description If empty and hostDocker.enabled=true, defaults to unix://<hostDocker.socketPath>.</td>
		</tr>
		<tr>
			<td id="agent--logLevel"><a href="./values.yaml#L61">agent.logLevel</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"info"
</pre>
</div>
			</td>
			<td>Agent log level.</td>
		</tr>
		<tr>
			<td id="agent--managerHostname"><a href="./values.yaml#L55">agent.managerHostname</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kasm-manager.example.internal"
</pre>
</div>
			</td>
			<td>Kasm manager hostname/address reachable by the agent.</td>
		</tr>
		<tr>
			<td id="agent--managerTokenSecret--key"><a href="./values.yaml#L69">agent.managerTokenSecret.key</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"manager-token"
</pre>
</div>
			</td>
			<td>Secret key containing the manager token.</td>
		</tr>
		<tr>
			<td id="agent--managerTokenSecret--name"><a href="./values.yaml#L67">agent.managerTokenSecret.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kasm-agent-manager-token"
</pre>
</div>
			</td>
			<td>Existing secret name containing the manager token.</td>
		</tr>
		<tr>
			<td id="agent--publicHostname"><a href="./values.yaml#L57">agent.publicHostname</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kasm-agent.example.internal"
</pre>
</div>
			</td>
			<td>Public hostname/address advertised by this agent.</td>
		</tr>
		<tr>
			<td id="agent--zoneName"><a href="./values.yaml#L59">agent.zoneName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"default"
</pre>
</div>
			</td>
			<td>Kasm zone name used for registration.</td>
		</tr>
		<tr>
			<td id="annotations"><a href="./values.yaml#L186">annotations</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "deployment": {},
  "pod": {},
  "secret": {},
  "service": {}
}
</pre>
</div>
			</td>
			<td>Common annotations applied to resources created by this chart.</td>
		</tr>
		<tr>
			<td id="cnps"><a href="./values.yaml#L161">cnps</a></td>
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
      "egressRules": [
        {
          "toEntities": [
            "world"
          ],
          "toPorts": [
            {
              "ports": [
                {
                  "port": "443",
                  "protocol": "TCP"
                }
              ]
            }
          ]
        }
      ]
    },
    "ingress": {
      "allow": false,
      "fromEntities": [],
      "matchLabels": {}
    }
  }
}
</pre>
</div>
			</td>
			<td>Application-specific Cilium Network Policies configuration. @description Requires CiliumNetworkPolicies library chart.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L172">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow egress traffic from the agent.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--egressRules"><a href="./values.yaml#L174">cnps.appTraffic.egress.egressRules</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "toEntities": [
      "world"
    ],
    "toPorts": [
      {
        "ports": [
          {
            "port": "443",
            "protocol": "TCP"
          }
        ]
      }
    ]
  }
]
</pre>
</div>
			</td>
			<td>Egress rules used when allow=true.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L165">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress traffic to the agent.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEntities"><a href="./values.yaml#L169">cnps.appTraffic.ingress.fromEntities</a></td>
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
			<td>Optional Cilium entities to allow ingress from.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--matchLabels"><a href="./values.yaml#L167">cnps.appTraffic.ingress.matchLabels</a></td>
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
			<td>Optional labels to match source pods.</td>
		</tr>
		<tr>
			<td id="extraEnv"><a href="./values.yaml#L73">extraEnv</a></td>
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
			<td>Additional plain environment variables. @description Do not place secrets here.</td>
		</tr>
		<tr>
			<td id="extraEnvSecrets"><a href="./values.yaml#L77">extraEnvSecrets</a></td>
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
			<td>Additional environment variables from secrets. @description Map ENV_NAME -> secretName, where each secret contains a key with the same ENV_NAME.</td>
		</tr>
		<tr>
			<td id="extraHostPaths"><a href="./values.yaml#L96">extraHostPaths</a></td>
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
			<td>Additional hostPath mounts. @description Use only when strictly required by your runtime environment.</td>
		</tr>
		<tr>
			<td id="extraLabels"><a href="./values.yaml#L193">extraLabels</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "deployment": {},
  "pod": {},
  "secret": {},
  "service": {},
  "serviceAccount": {}
}
</pre>
</div>
			</td>
			<td>Additional labels per resource type.</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L16">fullnameOverride</a></td>
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
			<td id="hostDocker--binaryMountPath"><a href="./values.yaml#L92">hostDocker.binaryMountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/usr/bin/docker"
</pre>
</div>
			</td>
			<td>Container mount path for docker binary.</td>
		</tr>
		<tr>
			<td id="hostDocker--binaryPath"><a href="./values.yaml#L90">hostDocker.binaryPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/usr/bin/docker"
</pre>
</div>
			</td>
			<td>Host docker binary path.</td>
		</tr>
		<tr>
			<td id="hostDocker--enabled"><a href="./values.yaml#L82">hostDocker.enabled</a></td>
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
			<td>Mount host docker socket into the pod. @description Required for setups where the agent must control a host Docker daemon.</td>
		</tr>
		<tr>
			<td id="hostDocker--mountBinary"><a href="./values.yaml#L88">hostDocker.mountBinary</a></td>
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
			<td>Mount host docker client binary.</td>
		</tr>
		<tr>
			<td id="hostDocker--socketMountPath"><a href="./values.yaml#L86">hostDocker.socketMountPath</a></td>
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
			<td>Container mount path for the socket.</td>
		</tr>
		<tr>
			<td id="hostDocker--socketPath"><a href="./values.yaml#L84">hostDocker.socketPath</a></td>
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
			<td>Host docker socket path.</td>
		</tr>
		<tr>
			<td id="image--pullPolicy"><a href="./values.yaml#L12">image.pullPolicy</a></td>
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
			<td>Container image pull policy.</td>
		</tr>
		<tr>
			<td id="image--repository"><a href="./values.yaml#L8">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kasmweb/agent"
</pre>
</div>
			</td>
			<td>Container image repository.</td>
		</tr>
		<tr>
			<td id="image--tag"><a href="./values.yaml#L10">image.tag</a></td>
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
			<td>Container image tag. Defaults to chart appVersion if empty.</td>
		</tr>
		<tr>
			<td id="imagePullSecrets"><a href="./values.yaml#L14">imagePullSecrets</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="labels"><a href="./values.yaml#L183">labels</a></td>
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
			<td>Common labels applied to all resources.</td>
		</tr>
		<tr>
			<td id="libchartCnps"><a href="./values.yaml#L153">libchartCnps</a></td>
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
			<td>Cilium Network Policies configuration.</td>
		</tr>
		<tr>
			<td id="libchartCnps--enabled"><a href="./values.yaml#L155">libchartCnps.enabled</a></td>
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
			<td>Enable Cilium Network Policies.</td>
		</tr>
		<tr>
			<td id="libchartCnps--includeCnpgPolicies"><a href="./values.yaml#L157">libchartCnps.includeCnpgPolicies</a></td>
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
			<td>Include CNPG-specific policies.</td>
		</tr>
		<tr>
			<td id="livenessProbe--failureThreshold"><a href="./values.yaml#L138">livenessProbe.failureThreshold</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
6
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="livenessProbe--initialDelaySeconds"><a href="./values.yaml#L135">livenessProbe.initialDelaySeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
20
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="livenessProbe--periodSeconds"><a href="./values.yaml#L136">livenessProbe.periodSeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
20
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="livenessProbe--tcpSocket--port"><a href="./values.yaml#L134">livenessProbe.tcpSocket.port</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"agent"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="livenessProbe--timeoutSeconds"><a href="./values.yaml#L137">livenessProbe.timeoutSeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
5
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L15">nameOverride</a></td>
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
			<td id="nodeSelector"><a href="./values.yaml#L148">nodeSelector</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L103">podAnnotations</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="podLabels"><a href="./values.yaml#L104">podLabels</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="podSecurityContext--fsGroup"><a href="./values.yaml#L110">podSecurityContext.fsGroup</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="podSecurityContext--runAsGroup"><a href="./values.yaml#L109">podSecurityContext.runAsGroup</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="podSecurityContext--runAsUser"><a href="./values.yaml#L108">podSecurityContext.runAsUser</a></td>
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
			<td>Static agent deployments commonly require root-level interaction with Docker resources.</td>
		</tr>
		<tr>
			<td id="podSecurityContext--seccompProfile--type"><a href="./values.yaml#L112">podSecurityContext.seccompProfile.type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"RuntimeDefault"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--failureThreshold"><a href="./values.yaml#L146">readinessProbe.failureThreshold</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
6
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--initialDelaySeconds"><a href="./values.yaml#L143">readinessProbe.initialDelaySeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
10
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--periodSeconds"><a href="./values.yaml#L144">readinessProbe.periodSeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
10
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--tcpSocket--port"><a href="./values.yaml#L142">readinessProbe.tcpSocket.port</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"agent"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--timeoutSeconds"><a href="./values.yaml#L145">readinessProbe.timeoutSeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
5
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="replicaCount"><a href="./values.yaml#L4">replicaCount</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="resources--limits--cpu"><a href="./values.yaml#L129">resources.limits.cpu</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"1000m"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="resources--limits--memory"><a href="./values.yaml#L130">resources.limits.memory</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="resources--requests--cpu"><a href="./values.yaml#L126">resources.requests.cpu</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"100m"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="resources--requests--memory"><a href="./values.yaml#L127">resources.requests.memory</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"128Mi"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L31">runtimeClass</a></td>
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
			<td>RuntimeClass configuration. Register a runtimeClass in the cluster before using it.</td>
		</tr>
		<tr>
			<td id="runtimeClass--pods"><a href="./values.yaml#L33">runtimeClass.pods</a></td>
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
			<td id="runtimeClass--tests"><a href="./values.yaml#L35">runtimeClass.tests</a></td>
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
			<td id="securityContext--allowPrivilegeEscalation"><a href="./values.yaml#L118">securityContext.allowPrivilegeEscalation</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="securityContext--capabilities--drop[0]"><a href="./values.yaml#L122">securityContext.capabilities.drop[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"ALL"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="securityContext--readOnlyRootFilesystem"><a href="./values.yaml#L119">securityContext.readOnlyRootFilesystem</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="securityContext--runAsGroup"><a href="./values.yaml#L116">securityContext.runAsGroup</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="securityContext--runAsNonRoot"><a href="./values.yaml#L117">securityContext.runAsNonRoot</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="securityContext--runAsUser"><a href="./values.yaml#L115">securityContext.runAsUser</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="service--annotations"><a href="./values.yaml#L49">service.annotations</a></td>
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
			<td>Custom annotations for the service.</td>
		</tr>
		<tr>
			<td id="service--enabled"><a href="./values.yaml#L39">service.enabled</a></td>
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
			<td>Enable or disable service creation.</td>
		</tr>
		<tr>
			<td id="service--labels"><a href="./values.yaml#L51">service.labels</a></td>
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
			<td>Custom labels for the service.</td>
		</tr>
		<tr>
			<td id="service--port"><a href="./values.yaml#L43">service.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
4444
</pre>
</div>
			</td>
			<td>Service port.</td>
		</tr>
		<tr>
			<td id="service--targetPort"><a href="./values.yaml#L45">service.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
4444
</pre>
</div>
			</td>
			<td>Container target port.</td>
		</tr>
		<tr>
			<td id="service--targetProtocol"><a href="./values.yaml#L47">service.targetProtocol</a></td>
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
			<td id="service--type"><a href="./values.yaml#L41">service.type</a></td>
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
			<td>Service type. This chart intentionally supports ClusterIP only.</td>
		</tr>
		<tr>
			<td id="serviceAccount--annotations"><a href="./values.yaml#L24">serviceAccount.annotations</a></td>
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
			<td>Annotations to add to the service account.</td>
		</tr>
		<tr>
			<td id="serviceAccount--automount"><a href="./values.yaml#L22">serviceAccount.automount</a></td>
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
			<td>Automatically mount a ServiceAccount token into the pod.</td>
		</tr>
		<tr>
			<td id="serviceAccount--create"><a href="./values.yaml#L20">serviceAccount.create</a></td>
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
			<td>Specifies whether a service account should be created.</td>
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
			<td>The name of the service account to use. @description If not set and create=true, a name is generated using the fullname template.</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L150">tolerations</a></td>
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
			<td></td>
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

## Appendix - Requirements and Scope

### Required Secret: Manager Token

This chart expects an existing Kubernetes secret for the manager token.

Sample:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: kasm-agent-manager-token
type: Opaque
stringData:
  manager-token: "CHANGE_ME__I_AM_A_SAMPLE"
```

> **IMPORTANT**: Never commit unencrypted secrets into Git repositories.

### Vendor Scope Note

According to Kasm vendor documentation, static Docker agents are not part of the official Kubernetes technical-preview deployment model.
This chart is therefore intended as an advanced, environment-specific option and should be validated carefully in your platform before production usage.
