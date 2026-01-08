

# coturn-server

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.8.0](https://img.shields.io/badge/AppVersion-4.8.0-informational?style=flat-square)

A Helm chart for an easier coturn deployment at kubernetes.

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
helm install coturn-server codeadminde/coturn-server
```
_**Note**: If you want to speicify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforhand._

> I'd recommend to read trough the docs. Skip them at your own risk. ;-)

## Repository

In order to install / query / etc... the charts, you'll need to add the repository:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
```

## Installation

To install the chart with the release name `coturn-server`

```bash
helm install coturn-server codeadminde/coturn-server
```
_**Note**: If you want to speicify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforhand._

## Uninstallation

To uninstall the chart release named `coturn-server`

```bash
helm uninstall coturn-server
```
_**Note**: If you want to speicify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforhand._

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.

## Configuration

Take a look at the [values.yaml](./values.yaml) file of the chart. It contains the default configuration and additional notes.
So it would be a good idea to take a look at it, even if you already know what you would like to accomplish.

To configure the release (chart values), provide your own values via a *.yaml file and reference it with the `-f` flag.

> #### Sample
>
> ```bash
> helm install coturn-server codeadminde/coturn-server -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Than you've to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install coturn-server --set key=value --set keyTwo=secondValue codeadminde/coturn-server
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
			<td id="cnps"><a href="./values.yaml#L157">cnps</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "appTraffic": {
    "egress": {
      "allow": true
    },
    "ingress": {
      "allow": true,
      "metrics": {
        "matchLabels": {}
      }
    }
  },
  "cnpgTraffic": {
    "instanceExtraEgress": []
  }
}
</pre>
</div>
			</td>
			<td>Application-specific Cilium Network Policies configuration @description Requires CiliumNetworkPolicies library-chart. These settings will be ignored if the library-chart is not available. These settings are directly related to the application and will not influence namespace-wide policies (e.g., for DNS egress traffic).</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic"><a href="./values.yaml#L159">cnps.appTraffic</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "egress": {
    "allow": true
  },
  "ingress": {
    "allow": true,
    "metrics": {
      "matchLabels": {}
    }
  }
}
</pre>
</div>
			</td>
			<td>Application traffic policies</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress"><a href="./values.yaml#L173">cnps.appTraffic.egress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allow": true
}
</pre>
</div>
			</td>
			<td>Egress traffic configuration</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L175">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow egress traffic (used to allow DNS queries when extIp not defined)</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress"><a href="./values.yaml#L161">cnps.appTraffic.ingress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allow": true,
  "metrics": {
    "matchLabels": {}
  }
}
</pre>
</div>
			</td>
			<td>Ingress traffic configuration</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L163">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress traffic (to coturn UDP port from world)</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--metrics"><a href="./values.yaml#L165">cnps.appTraffic.ingress.metrics</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "matchLabels": {}
}
</pre>
</div>
			</td>
			<td>Metrics scraper configuration</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--metrics--matchLabels"><a href="./values.yaml#L171">cnps.appTraffic.ingress.metrics.matchLabels</a></td>
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
			<td>Labels to match Prometheus pods @description Allows overriding default to match your prometheus deployment   app.kubernetes.io/name: prometheus   app.kubernetes.io/instance: kube-prometheus-stack-prometheus   io.kubernetes.pod.namespace: monitoring--kube-prometheus-stack</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic"><a href="./values.yaml#L178">cnps.cnpgTraffic</a></td>
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
			<td>CNPG traffic policies</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic--instanceExtraEgress"><a href="./values.yaml#L196">cnps.cnpgTraffic.instanceExtraEgress</a></td>
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
			<td>Additional instance egress rules for external services (e.g., backup services) @description Add additional rule(s) as desired, to allow access to external backup services - toFQDNs:   - matchName: s3.storage.example.org   toPorts:     - ports:         - port: "443"           protocol: TCP ## OR ## - toEntities:   - world   toPorts:     - ports:         - port: "8443"           protocol: TCP ## OR ## ...</td>
		</tr>
		<tr>
			<td id="global"><a href="./values.yaml#L2">global</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "caDebugOutput": false,
  "domain": "relay.example.com",
  "imagePullSecrets": []
}
</pre>
</div>
			</td>
			<td>Global Configuration</td>
		</tr>
		<tr>
			<td id="global--caDebugOutput"><a href="./values.yaml#L9">global.caDebugOutput</a></td>
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
			<td>Enable / Disable debug output. @description WARN: When enabled, debug output will leak credentials and/or secrets into logs. Do not enable in prod envs!</td>
		</tr>
		<tr>
			<td id="global--domain"><a href="./values.yaml#L4">global.domain</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"relay.example.com"
</pre>
</div>
			</td>
			<td>Domain for the deployment</td>
		</tr>
		<tr>
			<td id="global--imagePullSecrets"><a href="./values.yaml#L6">global.imagePullSecrets</a></td>
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
			<td>Image pull secrets for private registries</td>
		</tr>
		<tr>
			<td id="libchartCnps"><a href="./values.yaml#L149">libchartCnps</a></td>
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
			<td>Cilium Network Policies configuration</td>
		</tr>
		<tr>
			<td id="libchartCnps--enabled"><a href="./values.yaml#L151">libchartCnps.enabled</a></td>
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
			<td>Enable Cilium Network Policies</td>
		</tr>
		<tr>
			<td id="libchartCnps--includeCnpgPolicies"><a href="./values.yaml#L153">libchartCnps.includeCnpgPolicies</a></td>
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
			<td>Include CNPG-specific policies</td>
		</tr>
		<tr>
			<td id="monitoring"><a href="./values.yaml#L210">monitoring</a></td>
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
			<td>Monitoring configuration</td>
		</tr>
		<tr>
			<td id="monitoring--enabled"><a href="./values.yaml#L212">monitoring.enabled</a></td>
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
			<td>Enable monitoring</td>
		</tr>
		<tr>
			<td id="rbac"><a href="./values.yaml#L199">rbac</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "create": false,
  "serviceAccount": {
    "create": true,
    "name": "coturn-server"
  }
}
</pre>
</div>
			</td>
			<td>Role-Based Access Control configuration</td>
		</tr>
		<tr>
			<td id="rbac--create"><a href="./values.yaml#L201">rbac.create</a></td>
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
			<td>Create RBAC resources</td>
		</tr>
		<tr>
			<td id="rbac--serviceAccount"><a href="./values.yaml#L203">rbac.serviceAccount</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "create": true,
  "name": "coturn-server"
}
</pre>
</div>
			</td>
			<td>Service account configuration</td>
		</tr>
		<tr>
			<td id="rbac--serviceAccount--create"><a href="./values.yaml#L205">rbac.serviceAccount.create</a></td>
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
			<td>Create service account</td>
		</tr>
		<tr>
			<td id="rbac--serviceAccount--name"><a href="./values.yaml#L207">rbac.serviceAccount.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"coturn-server"
</pre>
</div>
			</td>
			<td>Service account name</td>
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
  "jobs": "",
  "pods": "",
  "tests": ""
}
</pre>
</div>
			</td>
			<td>Set a RuntimeClass to execute the containers with a custom runtime configuration. Register a runtimeClass within your cluster beforehand.

<details>
<summary>Motivation (Expand)</summary>

> The container runtime configuration is used to run a Pod's containers. . . .
> For example, if part of your workload deserves a high level of information security assurance, you might choose to schedule those Pods so that they run in a container runtime that uses hardware virtualization.
> You'd then benefit from the extra isolation of the alternative runtime, at the expense of some additional overhead. . . .

<i>Source and more informations: https://kubernetes.io/docs/concepts/containers/runtime-class/ </i>

</details></td>
		</tr>
		<tr>
			<td id="runtimeClass--jobs"><a href="./values.yaml#L144">runtimeClass.jobs</a></td>
			<td>
<a href="#stringruntimeclassname" title="Click to get details">string/runtimeClassName</a>
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>Sets the runtimeClass for the pods for the job execution. Takes the runtimeClass name, or "" (default).</td>
		</tr>
		<tr>
			<td id="runtimeClass--pods"><a href="./values.yaml#L142">runtimeClass.pods</a></td>
			<td>
<a href="#stringruntimeclassname" title="Click to get details">string/runtimeClassName</a>
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>Sets the runtimeClass for the DaemonSet / ReplicaSet pods. Takes the runtimeClass name, or "" (default).</td>
		</tr>
		<tr>
			<td id="runtimeClass--tests"><a href="./values.yaml#L146">runtimeClass.tests</a></td>
			<td>
<a href="#stringruntimeclassname" title="Click to get details">string/runtimeClassName</a>
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
""
</pre>
</div>
			</td>
			<td>Sets the runtimeClass for the containers which gets executed by the test hook. Takes the runtimeClass name, or "" (default).</td>
		</tr>
		<tr>
			<td id="turn"><a href="./values.yaml#L13">turn</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "affinity": {
    "podAntiAffinity": "preferred"
  },
  "domain": "",
  "enabled": true,
  "extIp": "",
  "image": {
    "pullPolicy": "IfNotPresent",
    "repository": "ghcr.io/coturn/coturn",
    "tag": "4.8.0"
  },
  "initConfig": {
    "image": {
      "pullPolicy": "Always",
      "repository": "ghcr.io/codeadminde/alpine-toolbox",
      "tag": "latest"
    }
  },
  "metricsPort": 9641,
  "metricsService": {
    "port": 9641
  },
  "persistence": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "emptyDirSizeLimit": "10Mi",
    "enabled": false,
    "size": "50Mi",
    "storageClass": "longhorn"
  },
  "port": null,
  "probes": {
    "liveness": {
      "enabled": true,
      "failureThreshold": 3,
      "initialDelaySeconds": 30,
      "periodSeconds": 10,
      "timeoutSeconds": 5
    },
    "readiness": {
      "enabled": true,
      "failureThreshold": 2,
      "initialDelaySeconds": 10,
      "periodSeconds": 5,
      "timeoutSeconds": 3
    }
  },
  "replicaCount": 1,
  "resources": {
    "limits": {
      "cpu": "500m",
      "memory": "256Mi"
    },
    "requests": {
      "cpu": "100m",
      "memory": "128Mi"
    }
  },
  "securityContext": {
    "fsGroup": 65534,
    "readOnlyRootFilesystem": true,
    "runAsNonRoot": true,
    "runAsUser": 65534
  },
  "service": {
    "externalTrafficPolicy": "",
    "internalTrafficPolicy": "",
    "port": null,
    "type": "LoadBalancer"
  }
}
</pre>
</div>
			</td>
			<td>TURN (Coturn) configuration @description Coturn configuration to provide STUN/TURN.</td>
		</tr>
		<tr>
			<td id="turn--affinity"><a href="./values.yaml#L112">turn.affinity</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "podAntiAffinity": "preferred"
}
</pre>
</div>
			</td>
			<td>Pod affinity settings</td>
		</tr>
		<tr>
			<td id="turn--affinity--podAntiAffinity"><a href="./values.yaml#L114">turn.affinity.podAntiAffinity</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"preferred"
</pre>
</div>
			</td>
			<td>Pod anti-affinity strategy (required, preferred)</td>
		</tr>
		<tr>
			<td id="turn--domain"><a href="./values.yaml#L37">turn.domain</a></td>
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
			<td>Domain for coturn server to provide STUN/TURN (UDP) (optional, defaults to global.domain value if not provided)</td>
		</tr>
		<tr>
			<td id="turn--enabled"><a href="./values.yaml#L15">turn.enabled</a></td>
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
			<td>Enable coturn server deployment</td>
		</tr>
		<tr>
			<td id="turn--extIp"><a href="./values.yaml#L35">turn.extIp</a></td>
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
			<td>External IP under which the turn service will be reachable. ( ) @description Provide the public IP under which your clients will reach the coturn server. It is recommended, but optional. If empty, coturn provided autodiscover script will be used. Note that this requires external 53/UDP access for coturn. If you're using the cnps-lib chart together with allowed egress appTraffic, the CNP policy will than be extended to allow these access to the used dns servers of the autodiscover script. Ref.: https://github.com/coturn/coturn/blob/48fb3dd287a10e91d6c9843a53758fd6103dbe51/docker/coturn/rootfs/usr/local/bin/detect-external-ip.sh</td>
		</tr>
		<tr>
			<td id="turn--image"><a href="./values.yaml#L19">turn.image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "ghcr.io/coturn/coturn",
  "tag": "4.8.0"
}
</pre>
</div>
			</td>
			<td>Coturn image repository, tag and pullPolicy</td>
		</tr>
		<tr>
			<td id="turn--initConfig"><a href="./values.yaml#L24">turn.initConfig</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "image": {
    "pullPolicy": "Always",
    "repository": "ghcr.io/codeadminde/alpine-toolbox",
    "tag": "latest"
  }
}
</pre>
</div>
			</td>
			<td>Init container for dynamic management.json generation</td>
		</tr>
		<tr>
			<td id="turn--initConfig--image"><a href="./values.yaml#L26">turn.initConfig.image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "Always",
  "repository": "ghcr.io/codeadminde/alpine-toolbox",
  "tag": "latest"
}
</pre>
</div>
			</td>
			<td>Management initContainer image repository, tag and pullPolicy</td>
		</tr>
		<tr>
			<td id="turn--metricsPort"><a href="./values.yaml#L41">turn.metricsPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
9641
</pre>
</div>
			</td>
			<td>Coturn metrics port (default turnserver.conf 9641/tcp /metrics)</td>
		</tr>
		<tr>
			<td id="turn--metricsService"><a href="./values.yaml#L53">turn.metricsService</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "port": 9641
}
</pre>
</div>
			</td>
			<td>Service config (metrics; fixed type of ClusterIP)</td>
		</tr>
		<tr>
			<td id="turn--metricsService--port"><a href="./values.yaml#L55">turn.metricsService.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
9641
</pre>
</div>
			</td>
			<td>Service port</td>
		</tr>
		<tr>
			<td id="turn--persistence"><a href="./values.yaml#L69">turn.persistence</a></td>
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
  "emptyDirSizeLimit": "10Mi",
  "enabled": false,
  "size": "50Mi",
  "storageClass": "longhorn"
}
</pre>
</div>
			</td>
			<td>Management server persistence configuration.</td>
		</tr>
		<tr>
			<td id="turn--persistence--accessModes"><a href="./values.yaml#L79">turn.persistence.accessModes</a></td>
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
			<td>Define the accessModes to use when not providing an already existing PVC claim.</td>
		</tr>
		<tr>
			<td id="turn--persistence--emptyDirSizeLimit"><a href="./values.yaml#L73">turn.persistence.emptyDirSizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"10Mi"
</pre>
</div>
			</td>
			<td>Define the max directory size when using persistence.enabled: false</td>
		</tr>
		<tr>
			<td id="turn--persistence--size"><a href="./values.yaml#L75">turn.persistence.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"50Mi"
</pre>
</div>
			</td>
			<td>Define the size of the PV when using persistence.enabled: true</td>
		</tr>
		<tr>
			<td id="turn--persistence--storageClass"><a href="./values.yaml#L77">turn.persistence.storageClass</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"longhorn"
</pre>
</div>
			</td>
			<td>Define the storageClass to use when not providing an already existing PVC claim. Provide your cluster storageclass or leave it empty to use the default one.</td>
		</tr>
		<tr>
			<td id="turn--port"><a href="./values.yaml#L39">turn.port</a></td>
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
			<td>Port for coturn server to provide STUN/TURN (UDP) (optional, defaults to 3478 if not provided)</td>
		</tr>
		<tr>
			<td id="turn--probes"><a href="./values.yaml#L86">turn.probes</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "liveness": {
    "enabled": true,
    "failureThreshold": 3,
    "initialDelaySeconds": 30,
    "periodSeconds": 10,
    "timeoutSeconds": 5
  },
  "readiness": {
    "enabled": true,
    "failureThreshold": 2,
    "initialDelaySeconds": 10,
    "periodSeconds": 5,
    "timeoutSeconds": 3
  }
}
</pre>
</div>
			</td>
			<td>Health probes configuration</td>
		</tr>
		<tr>
			<td id="turn--probes--liveness"><a href="./values.yaml#L88">turn.probes.liveness</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "failureThreshold": 3,
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Liveness probe settings</td>
		</tr>
		<tr>
			<td id="turn--probes--liveness--enabled"><a href="./values.yaml#L90">turn.probes.liveness.enabled</a></td>
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
			<td>Enable liveness probe</td>
		</tr>
		<tr>
			<td id="turn--probes--liveness--failureThreshold"><a href="./values.yaml#L98">turn.probes.liveness.failureThreshold</a></td>
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
			<td>Liveness probe failure threshold</td>
		</tr>
		<tr>
			<td id="turn--probes--liveness--initialDelaySeconds"><a href="./values.yaml#L92">turn.probes.liveness.initialDelaySeconds</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
30
</pre>
</div>
			</td>
			<td>Initial delay before first liveness probe</td>
		</tr>
		<tr>
			<td id="turn--probes--liveness--periodSeconds"><a href="./values.yaml#L94">turn.probes.liveness.periodSeconds</a></td>
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
			<td>Liveness probe interval</td>
		</tr>
		<tr>
			<td id="turn--probes--liveness--timeoutSeconds"><a href="./values.yaml#L96">turn.probes.liveness.timeoutSeconds</a></td>
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
			<td>Liveness probe timeout</td>
		</tr>
		<tr>
			<td id="turn--probes--readiness"><a href="./values.yaml#L100">turn.probes.readiness</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "failureThreshold": 2,
  "initialDelaySeconds": 10,
  "periodSeconds": 5,
  "timeoutSeconds": 3
}
</pre>
</div>
			</td>
			<td>Readiness probe settings</td>
		</tr>
		<tr>
			<td id="turn--probes--readiness--enabled"><a href="./values.yaml#L102">turn.probes.readiness.enabled</a></td>
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
			<td>Enable readiness probe</td>
		</tr>
		<tr>
			<td id="turn--probes--readiness--failureThreshold"><a href="./values.yaml#L110">turn.probes.readiness.failureThreshold</a></td>
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
			<td>Readiness probe failure threshold</td>
		</tr>
		<tr>
			<td id="turn--probes--readiness--initialDelaySeconds"><a href="./values.yaml#L104">turn.probes.readiness.initialDelaySeconds</a></td>
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
			<td>Initial delay before first readiness probe</td>
		</tr>
		<tr>
			<td id="turn--probes--readiness--periodSeconds"><a href="./values.yaml#L106">turn.probes.readiness.periodSeconds</a></td>
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
			<td>Readiness probe interval</td>
		</tr>
		<tr>
			<td id="turn--probes--readiness--timeoutSeconds"><a href="./values.yaml#L108">turn.probes.readiness.timeoutSeconds</a></td>
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
			<td>Readiness probe timeout</td>
		</tr>
		<tr>
			<td id="turn--replicaCount"><a href="./values.yaml#L17">turn.replicaCount</a></td>
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
			<td>Number of replicas</td>
		</tr>
		<tr>
			<td id="turn--resources"><a href="./values.yaml#L57">turn.resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "cpu": "500m",
    "memory": "256Mi"
  },
  "requests": {
    "cpu": "100m",
    "memory": "128Mi"
  }
}
</pre>
</div>
			</td>
			<td>Resource requests and limits</td>
		</tr>
		<tr>
			<td id="turn--resources--limits--cpu"><a href="./values.yaml#L65">turn.resources.limits.cpu</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"500m"
</pre>
</div>
			</td>
			<td>CPU limit</td>
		</tr>
		<tr>
			<td id="turn--resources--limits--memory"><a href="./values.yaml#L67">turn.resources.limits.memory</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"256Mi"
</pre>
</div>
			</td>
			<td>Memory limit</td>
		</tr>
		<tr>
			<td id="turn--resources--requests--cpu"><a href="./values.yaml#L60">turn.resources.requests.cpu</a></td>
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
			<td>CPU request</td>
		</tr>
		<tr>
			<td id="turn--resources--requests--memory"><a href="./values.yaml#L62">turn.resources.requests.memory</a></td>
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
			<td>Memory request</td>
		</tr>
		<tr>
			<td id="turn--securityContext"><a href="./values.yaml#L116">turn.securityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "fsGroup": 65534,
  "readOnlyRootFilesystem": true,
  "runAsNonRoot": true,
  "runAsUser": 65534
}
</pre>
</div>
			</td>
			<td>Pod security context</td>
		</tr>
		<tr>
			<td id="turn--securityContext--fsGroup"><a href="./values.yaml#L122">turn.securityContext.fsGroup</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
65534
</pre>
</div>
			</td>
			<td>File system group</td>
		</tr>
		<tr>
			<td id="turn--securityContext--readOnlyRootFilesystem"><a href="./values.yaml#L124">turn.securityContext.readOnlyRootFilesystem</a></td>
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
			<td>Use read-only root filesystem</td>
		</tr>
		<tr>
			<td id="turn--securityContext--runAsNonRoot"><a href="./values.yaml#L118">turn.securityContext.runAsNonRoot</a></td>
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
			<td>Run container as non-root user</td>
		</tr>
		<tr>
			<td id="turn--securityContext--runAsUser"><a href="./values.yaml#L120">turn.securityContext.runAsUser</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
65534
</pre>
</div>
			</td>
			<td>User ID for running container</td>
		</tr>
		<tr>
			<td id="turn--service"><a href="./values.yaml#L43">turn.service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "externalTrafficPolicy": "",
  "internalTrafficPolicy": "",
  "port": null,
  "type": "LoadBalancer"
}
</pre>
</div>
			</td>
			<td>Service config (STUN)</td>
		</tr>
		<tr>
			<td id="turn--service--externalTrafficPolicy"><a href="./values.yaml#L49">turn.service.externalTrafficPolicy</a></td>
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
			<td>LoadBalancer externalTrafficPolicy (optional, defaults to Local if not provided)</td>
		</tr>
		<tr>
			<td id="turn--service--internalTrafficPolicy"><a href="./values.yaml#L51">turn.service.internalTrafficPolicy</a></td>
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
			<td>LoadBalancer internalTrafficPolicy (optional, defaults to Cluster if not provided)</td>
		</tr>
		<tr>
			<td id="turn--service--port"><a href="./values.yaml#L47">turn.service.port</a></td>
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
			<td>Service port (optional, defaults to 3478 if not provided)</td>
		</tr>
		<tr>
			<td id="turn--service--type"><a href="./values.yaml#L45">turn.service.type</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"LoadBalancer"
</pre>
</div>
			</td>
			<td>Service type (STUN should be exported via LoadBalancer, instead of ClusterIP)</td>
		</tr>
	</tbody>
</table>

## Value type details

The chart uses some value types for which I would like to add a further explanation / recommendation:

### string/runtimeClassName

Provide a valid name of a runtimeClass within your cluster.

If you want to get the current available runtimeClasses within your cluster, exec:

```
kubectl get -A runtimeClasses
```

_**Personal recommendation**: A runtime that I believe is worth trying is the Kata Container Runtime.
Take a look at [https://katacontainers.io](https://katacontainers.io) to get an overview about it.
Also take a look at the HowTo-Section within the kata-container GitHub Repository,
e.g. to learn [how to create a runtime class](https://github.com/kata-containers/kata-containers/blob/main/docs/how-to/run-kata-with-k8s.md#create-runtime-class-for-kata-containers)_

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
