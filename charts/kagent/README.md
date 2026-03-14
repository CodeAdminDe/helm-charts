

# kagent

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.7.22](https://img.shields.io/badge/AppVersion-v0.7.22-informational?style=flat-square)

A Helm chart for deploying kagent on Kubernetes.

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
helm install kagent codeadminde/kagent
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

To install the chart with the release name `kagent`

```bash
helm install kagent codeadminde/kagent
```
_**Note**: If you want to speicify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforhand._

## Uninstallation

To uninstall the chart release named `kagent`

```bash
helm uninstall kagent
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
> helm install kagent codeadminde/kagent -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Than you've to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install kagent --set key=value --set keyTwo=secondValue codeadminde/kagent
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
			<td id="cnps"><a href="./values.yaml#L655">cnps</a></td>
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
      "allowKubeApiServer": true,
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
			<td>App-specific Cilium policy settings.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L666">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow egress for app pods selected by app CNP.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--allowKubeApiServer"><a href="./values.yaml#L675">cnps.appTraffic.egress.allowKubeApiServer</a></td>
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
			<td>Allow controller egress to Kubernetes API server.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEntities"><a href="./values.yaml#L668">cnps.appTraffic.egress.toEntities</a></td>
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
			<td>Destination entities for outbound traffic.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toPorts"><a href="./values.yaml#L671">cnps.appTraffic.egress.toPorts</a></td>
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
			<td>Destination ports for outbound traffic.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L659">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress to app pods selected by app CNP.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEndpoints"><a href="./values.yaml#L661">cnps.appTraffic.ingress.fromEndpoints</a></td>
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
			<td>Optional explicit endpoint label selectors for ingress sources.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEntities"><a href="./values.yaml#L663">cnps.appTraffic.ingress.fromEntities</a></td>
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
			<td>Optional explicit entities for ingress sources.</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic--instanceExtraEgress"><a href="./values.yaml#L678">cnps.cnpgTraffic.instanceExtraEgress</a></td>
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
			<td>Extra egress entries appended to CNPG instance policy when includeCnpgPolicies=true.</td>
		</tr>
		<tr>
			<td id="controller"><a href="./values.yaml#L97">controller</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "a2aBaseUrl": "",
  "affinity": {},
  "agentImage": {
    "pullPolicy": "",
    "registry": "",
    "repository": "kagent-dev/kagent/app",
    "tag": ""
  },
  "autoscaling": {
    "enableMemoryUtilization": false,
    "enabled": false,
    "maxReplicas": 3,
    "minReplicas": 1,
    "targetCPUUtilizationPercentage": 80,
    "targetMemoryUtilizationPercentage": 80
  },
  "env": [],
  "envFrom": [],
  "image": {
    "pullPolicy": "",
    "registry": "",
    "repository": "kagent-dev/kagent/controller",
    "tag": ""
  },
  "livenessProbe": {
    "failureThreshold": 6,
    "httpGet": {
      "path": "/health",
      "port": "http"
    },
    "initialDelaySeconds": 30,
    "periodSeconds": 10,
    "timeoutSeconds": 5
  },
  "logLevel": "info",
  "nodeSelector": {},
  "podAnnotations": {},
  "podLabels": {},
  "podSecurityContext": {},
  "readinessProbe": {
    "failureThreshold": 6,
    "httpGet": {
      "path": "/health",
      "port": "http"
    },
    "initialDelaySeconds": 10,
    "periodSeconds": 10,
    "timeoutSeconds": 5
  },
  "replicas": 1,
  "resources": {
    "limits": {
      "cpu": "2",
      "memory": "512Mi"
    },
    "requests": {
      "cpu": "100m",
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
    "readOnlyRootFilesystem": false,
    "runAsGroup": 65532,
    "runAsNonRoot": true,
    "runAsUser": 65532,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "service": {
    "annotations": {},
    "labels": {},
    "port": 8083,
    "targetPort": 8083,
    "targetProtocol": "TCP",
    "type": "ClusterIP"
  },
  "skillsInitImage": {
    "pullPolicy": "",
    "registry": "",
    "repository": "kagent-dev/kagent/skills-init",
    "tag": ""
  },
  "startupProbe": {
    "failureThreshold": 20,
    "httpGet": {
      "path": "/health",
      "port": "http"
    },
    "initialDelaySeconds": 15,
    "periodSeconds": 15,
    "timeoutSeconds": 5
  },
  "streaming": {
    "initialBufSize": "4Ki",
    "maxBufSize": "1Mi",
    "timeout": "600s"
  },
  "tolerations": [],
  "volumeMounts": [],
  "volumes": [],
  "watchNamespaces": []
}
</pre>
</div>
			</td>
			<td>Controller deployment settings.</td>
		</tr>
		<tr>
			<td id="controller--a2aBaseUrl"><a href="./values.yaml#L105">controller.a2aBaseUrl</a></td>
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
			<td>Optional explicit A2A base URL advertised by controller.</td>
		</tr>
		<tr>
			<td id="controller--affinity"><a href="./values.yaml#L179">controller.affinity</a></td>
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
			<td>Controller affinity.</td>
		</tr>
		<tr>
			<td id="controller--agentImage--pullPolicy"><a href="./values.yaml#L123">controller.agentImage.pullPolicy</a></td>
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
			<td>Agent runtime image pull policy override.</td>
		</tr>
		<tr>
			<td id="controller--agentImage--registry"><a href="./values.yaml#L117">controller.agentImage.registry</a></td>
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
			<td>Agent runtime image registry override.</td>
		</tr>
		<tr>
			<td id="controller--agentImage--repository"><a href="./values.yaml#L119">controller.agentImage.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kagent-dev/kagent/app"
</pre>
</div>
			</td>
			<td>Agent runtime image repository used by controller-managed agent workloads.</td>
		</tr>
		<tr>
			<td id="controller--agentImage--tag"><a href="./values.yaml#L121">controller.agentImage.tag</a></td>
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
			<td>Agent runtime image tag override.</td>
		</tr>
		<tr>
			<td id="controller--autoscaling"><a href="./values.yaml#L220">controller.autoscaling</a></td>
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
			<td>Controller HPA settings.</td>
		</tr>
		<tr>
			<td id="controller--env"><a href="./values.yaml#L163">controller.env</a></td>
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
			<td>Additional controller environment variables (list form).</td>
		</tr>
		<tr>
			<td id="controller--envFrom"><a href="./values.yaml#L165">controller.envFrom</a></td>
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
			<td>Additional `envFrom` entries for controller.</td>
		</tr>
		<tr>
			<td id="controller--image--pullPolicy"><a href="./values.yaml#L114">controller.image.pullPolicy</a></td>
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
			<td>Controller image pull policy override.</td>
		</tr>
		<tr>
			<td id="controller--image--registry"><a href="./values.yaml#L108">controller.image.registry</a></td>
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
			<td>Controller image registry override.</td>
		</tr>
		<tr>
			<td id="controller--image--repository"><a href="./values.yaml#L110">controller.image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kagent-dev/kagent/controller"
</pre>
</div>
			</td>
			<td>Controller image repository.</td>
		</tr>
		<tr>
			<td id="controller--image--tag"><a href="./values.yaml#L112">controller.image.tag</a></td>
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
			<td>Controller image tag override.</td>
		</tr>
		<tr>
			<td id="controller--livenessProbe"><a href="./values.yaml#L195">controller.livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 6,
  "httpGet": {
    "path": "/health",
    "port": "http"
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>Controller health probes.</td>
		</tr>
		<tr>
			<td id="controller--logLevel"><a href="./values.yaml#L102">controller.logLevel</a></td>
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
			<td>Controller log level (`debug`, `info`, ...).</td>
		</tr>
		<tr>
			<td id="controller--nodeSelector"><a href="./values.yaml#L175">controller.nodeSelector</a></td>
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
			<td>Controller node selector.</td>
		</tr>
		<tr>
			<td id="controller--podAnnotations"><a href="./values.yaml#L171">controller.podAnnotations</a></td>
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
			<td>Controller pod annotations.</td>
		</tr>
		<tr>
			<td id="controller--podLabels"><a href="./values.yaml#L173">controller.podLabels</a></td>
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
			<td>Controller pod labels.</td>
		</tr>
		<tr>
			<td id="controller--podSecurityContext"><a href="./values.yaml#L181">controller.podSecurityContext</a></td>
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
			<td>Controller pod security context.</td>
		</tr>
		<tr>
			<td id="controller--replicas"><a href="./values.yaml#L100">controller.replicas</a></td>
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
			<td>Number of controller replicas. @description Keep at `1` when `database.type=sqlite`.</td>
		</tr>
		<tr>
			<td id="controller--securityContext"><a href="./values.yaml#L183">controller.securityContext</a></td>
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
  "runAsGroup": 65532,
  "runAsNonRoot": true,
  "runAsUser": 65532,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>Controller container security context.</td>
		</tr>
		<tr>
			<td id="controller--service--annotations"><a href="./values.yaml#L144">controller.service.annotations</a></td>
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
			<td>Controller service annotations.</td>
		</tr>
		<tr>
			<td id="controller--service--labels"><a href="./values.yaml#L146">controller.service.labels</a></td>
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
			<td>Controller service labels.</td>
		</tr>
		<tr>
			<td id="controller--service--port"><a href="./values.yaml#L148">controller.service.port</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
8083
</pre>
</div>
			</td>
			<td>Controller service port.</td>
		</tr>
		<tr>
			<td id="controller--service--targetPort"><a href="./values.yaml#L150">controller.service.targetPort</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
8083
</pre>
</div>
			</td>
			<td>Controller container target port.</td>
		</tr>
		<tr>
			<td id="controller--service--targetProtocol"><a href="./values.yaml#L152">controller.service.targetProtocol</a></td>
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
			<td>Controller service protocol.</td>
		</tr>
		<tr>
			<td id="controller--service--type"><a href="./values.yaml#L142">controller.service.type</a></td>
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
			<td>Controller Service type. This chart enforces ClusterIP.</td>
		</tr>
		<tr>
			<td id="controller--skillsInitImage--pullPolicy"><a href="./values.yaml#L132">controller.skillsInitImage.pullPolicy</a></td>
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
			<td>Skills init image pull policy override.</td>
		</tr>
		<tr>
			<td id="controller--skillsInitImage--registry"><a href="./values.yaml#L126">controller.skillsInitImage.registry</a></td>
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
			<td>Skills init image registry override.</td>
		</tr>
		<tr>
			<td id="controller--skillsInitImage--repository"><a href="./values.yaml#L128">controller.skillsInitImage.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kagent-dev/kagent/skills-init"
</pre>
</div>
			</td>
			<td>Skills init image repository.</td>
		</tr>
		<tr>
			<td id="controller--skillsInitImage--tag"><a href="./values.yaml#L130">controller.skillsInitImage.tag</a></td>
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
			<td>Skills init image tag override.</td>
		</tr>
		<tr>
			<td id="controller--streaming--initialBufSize"><a href="./values.yaml#L155">controller.streaming.initialBufSize</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"4Ki"
</pre>
</div>
			</td>
			<td>Initial A2A streaming buffer size.</td>
		</tr>
		<tr>
			<td id="controller--streaming--maxBufSize"><a href="./values.yaml#L157">controller.streaming.maxBufSize</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"1Mi"
</pre>
</div>
			</td>
			<td>Max A2A streaming buffer size.</td>
		</tr>
		<tr>
			<td id="controller--streaming--timeout"><a href="./values.yaml#L159">controller.streaming.timeout</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"600s"
</pre>
</div>
			</td>
			<td>A2A streaming timeout.</td>
		</tr>
		<tr>
			<td id="controller--tolerations"><a href="./values.yaml#L177">controller.tolerations</a></td>
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
			<td>Controller tolerations.</td>
		</tr>
		<tr>
			<td id="controller--volumeMounts"><a href="./values.yaml#L169">controller.volumeMounts</a></td>
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
			<td>Additional volumeMounts for controller container.</td>
		</tr>
		<tr>
			<td id="controller--volumes"><a href="./values.yaml#L167">controller.volumes</a></td>
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
			<td>Additional volumes for controller pod.</td>
		</tr>
		<tr>
			<td id="controller--watchNamespaces"><a href="./values.yaml#L161">controller.watchNamespaces</a></td>
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
			<td>Namespaces watched by the controller. Empty means all namespaces.</td>
		</tr>
		<tr>
			<td id="database"><a href="./values.yaml#L34">database</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "postgres": {
    "url": "",
    "urlFile": "",
    "urlSecret": {
      "key": "url",
      "name": ""
    },
    "vectorEnabled": true
  },
  "sqlite": {
    "databaseName": "kagent.db",
    "vectorEnabled": true
  },
  "type": "sqlite",
  "useCnpgCluster": {
    "appConnectionSecretName": "",
    "clusterName": "cnpg-cluster",
    "enabled": false,
    "secretKeys": {
      "uri": "uri"
    }
  }
}
</pre>
</div>
			</td>
			<td>Database configuration.</td>
		</tr>
		<tr>
			<td id="database--postgres--url"><a href="./values.yaml#L47">database.postgres.url</a></td>
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
			<td>Direct postgres URL (discouraged for production due to plaintext risk).</td>
		</tr>
		<tr>
			<td id="database--postgres--urlFile"><a href="./values.yaml#L49">database.postgres.urlFile</a></td>
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
			<td>Path to a file containing postgres URL (`POSTGRES_DATABASE_URL_FILE`).</td>
		</tr>
		<tr>
			<td id="database--postgres--urlSecret--key"><a href="./values.yaml#L54">database.postgres.urlSecret.key</a></td>
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
			<td>Secret key containing a postgres URL.</td>
		</tr>
		<tr>
			<td id="database--postgres--urlSecret--name"><a href="./values.yaml#L52">database.postgres.urlSecret.name</a></td>
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
			<td>Existing secret containing a postgres URL.</td>
		</tr>
		<tr>
			<td id="database--postgres--vectorEnabled"><a href="./values.yaml#L45">database.postgres.vectorEnabled</a></td>
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
			<td>Enable vector features for postgres mode.</td>
		</tr>
		<tr>
			<td id="database--sqlite--databaseName"><a href="./values.yaml#L42">database.sqlite.databaseName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kagent.db"
</pre>
</div>
			</td>
			<td>SQLite database file name.</td>
		</tr>
		<tr>
			<td id="database--sqlite--vectorEnabled"><a href="./values.yaml#L40">database.sqlite.vectorEnabled</a></td>
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
			<td>Enable vector features for sqlite mode.</td>
		</tr>
		<tr>
			<td id="database--type"><a href="./values.yaml#L37">database.type</a></td>
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
			<td>Database type used by controller. @description Supported values: `sqlite`, `postgres`.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--appConnectionSecretName"><a href="./values.yaml#L61">database.useCnpgCluster.appConnectionSecretName</a></td>
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
			<td>Explicit CNPG app connection secret name.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--clusterName"><a href="./values.yaml#L59">database.useCnpgCluster.clusterName</a></td>
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
			<td>CNPG cluster name.</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--enabled"><a href="./values.yaml#L57">database.useCnpgCluster.enabled</a></td>
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
			<td>Resolve postgres URL from a CNPG app secret (`<clusterName>-app` by default).</td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster--secretKeys--uri"><a href="./values.yaml#L64">database.useCnpgCluster.secretKeys.uri</a></td>
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
			<td>Secret key containing DSN/URI in CNPG app secret.</td>
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
			<td id="gatewayApi"><a href="./values.yaml#L354">gatewayApi</a></td>
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
    "kagent.example.com"
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
			<td>Gateway API HTTPRoute configuration for kagent UI.</td>
		</tr>
		<tr>
			<td id="gatewayApi--annotations"><a href="./values.yaml#L358">gatewayApi.annotations</a></td>
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
			<td id="gatewayApi--backendRefs"><a href="./values.yaml#L377">gatewayApi.backendRefs</a></td>
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
			<td>Optional backend references (defaults to UI service when empty).</td>
		</tr>
		<tr>
			<td id="gatewayApi--enabled"><a href="./values.yaml#L356">gatewayApi.enabled</a></td>
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
			<td id="gatewayApi--filters"><a href="./values.yaml#L375">gatewayApi.filters</a></td>
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
			<td>Optional filters.</td>
		</tr>
		<tr>
			<td id="gatewayApi--hostnames"><a href="./values.yaml#L367">gatewayApi.hostnames</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "kagent.example.com"
]
</pre>
</div>
			</td>
			<td>Hostnames served by this route.</td>
		</tr>
		<tr>
			<td id="gatewayApi--labels"><a href="./values.yaml#L360">gatewayApi.labels</a></td>
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
			<td id="gatewayApi--matches"><a href="./values.yaml#L370">gatewayApi.matches</a></td>
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
			<td>Match rules for HTTPRoute.</td>
		</tr>
		<tr>
			<td id="gatewayApi--parentRefs"><a href="./values.yaml#L362">gatewayApi.parentRefs</a></td>
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
			<td id="global"><a href="./values.yaml#L10">global</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "imagePullPolicy": "IfNotPresent",
  "imagePullSecrets": [],
  "registry": "cr.kagent.dev",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>Global image settings.</td>
		</tr>
		<tr>
			<td id="global--imagePullPolicy"><a href="./values.yaml#L14">global.imagePullPolicy</a></td>
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
			<td>Global image pull policy fallback.</td>
		</tr>
		<tr>
			<td id="global--imagePullSecrets"><a href="./values.yaml#L18">global.imagePullSecrets</a></td>
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
			<td>Global image pull secrets.</td>
		</tr>
		<tr>
			<td id="global--registry"><a href="./values.yaml#L12">global.registry</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"cr.kagent.dev"
</pre>
</div>
			</td>
			<td>Global image registry used when component image.registry is empty.</td>
		</tr>
		<tr>
			<td id="global--tag"><a href="./values.yaml#L16">global.tag</a></td>
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
			<td>Global image tag fallback (defaults to `.Chart.AppVersion` when empty).</td>
		</tr>
		<tr>
			<td id="ingress"><a href="./values.yaml#L324">ingress</a></td>
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
      "host": "kagent.example.com",
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
			<td>Ingress configuration for kagent UI.</td>
		</tr>
		<tr>
			<td id="ingress--annotations"><a href="./values.yaml#L330">ingress.annotations</a></td>
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
			<td id="ingress--className"><a href="./values.yaml#L328">ingress.className</a></td>
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
			<td id="ingress--enabled"><a href="./values.yaml#L326">ingress.enabled</a></td>
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
			<td id="ingress--hosts"><a href="./values.yaml#L345">ingress.hosts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "host": "kagent.example.com",
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
			<td id="ingress--secureDefaults--enabled"><a href="./values.yaml#L333">ingress.secureDefaults.enabled</a></td>
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
			<td>Enable secure ingress defaults.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyBuffering"><a href="./values.yaml#L339">ingress.secureDefaults.proxyBuffering</a></td>
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
			<td>NGINX proxy buffering mode.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyHttpVersion"><a href="./values.yaml#L343">ingress.secureDefaults.proxyHttpVersion</a></td>
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
			<td>NGINX proxy http version.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyReadTimeoutSeconds"><a href="./values.yaml#L335">ingress.secureDefaults.proxyReadTimeoutSeconds</a></td>
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
			<td>NGINX proxy read timeout in seconds.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxyRequestBuffering"><a href="./values.yaml#L341">ingress.secureDefaults.proxyRequestBuffering</a></td>
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
			<td>NGINX proxy request buffering mode.</td>
		</tr>
		<tr>
			<td id="ingress--secureDefaults--proxySendTimeoutSeconds"><a href="./values.yaml#L337">ingress.secureDefaults.proxySendTimeoutSeconds</a></td>
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
			<td>NGINX proxy send timeout in seconds.</td>
		</tr>
		<tr>
			<td id="ingress--tls"><a href="./values.yaml#L351">ingress.tls</a></td>
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
			<td id="labels"><a href="./values.yaml#L21">labels</a></td>
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
			<td>Additional labels added to all resources.</td>
		</tr>
		<tr>
			<td id="libchartCnps"><a href="./values.yaml#L648">libchartCnps</a></td>
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
			<td>Optional namespace-scoped Cilium policy library integration.</td>
		</tr>
		<tr>
			<td id="libchartCnps--enabled"><a href="./values.yaml#L650">libchartCnps.enabled</a></td>
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
			<td>Enable libchart-cnps templates.</td>
		</tr>
		<tr>
			<td id="libchartCnps--includeCnpgPolicies"><a href="./values.yaml#L652">libchartCnps.includeCnpgPolicies</a></td>
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
			<td>Include CNPG ruleset from the library.</td>
		</tr>
		<tr>
			<td id="modelConfig"><a href="./values.yaml#L572">modelConfig</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "createSecretFromApiKeyValues": true,
  "enabled": true,
  "name": "default-model-config"
}
</pre>
</div>
			</td>
			<td>Default ModelConfig generation.</td>
		</tr>
		<tr>
			<td id="modelConfig--createSecretFromApiKeyValues"><a href="./values.yaml#L578">modelConfig.createSecretFromApiKeyValues</a></td>
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
			<td>Create provider API key secret from plaintext values (not recommended for production).</td>
		</tr>
		<tr>
			<td id="modelConfig--enabled"><a href="./values.yaml#L574">modelConfig.enabled</a></td>
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
			<td>Create a default `kagent.dev/v1alpha2` ModelConfig object.</td>
		</tr>
		<tr>
			<td id="modelConfig--name"><a href="./values.yaml#L576">modelConfig.name</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"default-model-config"
</pre>
</div>
			</td>
			<td>Name of the generated ModelConfig.</td>
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
		<tr>
			<td id="namespaceOverride"><a href="./values.yaml#L7">namespaceOverride</a></td>
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
			<td>Override the namespace used for kagent resources.</td>
		</tr>
		<tr>
			<td id="otel"><a href="./values.yaml#L627">otel</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "logging": {
    "enabled": false,
    "exporter": {
      "otlp": {
        "endpoint": "",
        "insecure": true,
        "timeout": 15
      }
    }
  },
  "tracing": {
    "enabled": false,
    "exporter": {
      "otlp": {
        "endpoint": "",
        "insecure": true,
        "timeout": 15
      }
    }
  }
}
</pre>
</div>
			</td>
			<td>OpenTelemetry integration.</td>
		</tr>
		<tr>
			<td id="persistence"><a href="./values.yaml#L67">persistence</a></td>
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
  "emptyDir": {
    "enabled": true,
    "medium": "",
    "sizeLimit": "500Mi"
  },
  "enabled": true,
  "existingClaim": "",
  "mountPath": "/sqlite-volume",
  "retain": false,
  "size": "2Gi",
  "storageClass": "",
  "volumeName": ""
}
</pre>
</div>
			</td>
			<td>Persistence for sqlite mode.</td>
		</tr>
		<tr>
			<td id="persistence--accessModes"><a href="./values.yaml#L80">persistence.accessModes</a></td>
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
			<td id="persistence--annotations"><a href="./values.yaml#L83">persistence.annotations</a></td>
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
			<td id="persistence--emptyDir--enabled"><a href="./values.yaml#L90">persistence.emptyDir.enabled</a></td>
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
			<td>Enable emptyDir fallback when persistence is disabled.</td>
		</tr>
		<tr>
			<td id="persistence--emptyDir--medium"><a href="./values.yaml#L94">persistence.emptyDir.medium</a></td>
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
			<td>Optional emptyDir medium (`""` or `Memory`).</td>
		</tr>
		<tr>
			<td id="persistence--emptyDir--sizeLimit"><a href="./values.yaml#L92">persistence.emptyDir.sizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"500Mi"
</pre>
</div>
			</td>
			<td>Optional emptyDir size limit.</td>
		</tr>
		<tr>
			<td id="persistence--enabled"><a href="./values.yaml#L69">persistence.enabled</a></td>
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
			<td>Enable PVC-backed sqlite storage.</td>
		</tr>
		<tr>
			<td id="persistence--existingClaim"><a href="./values.yaml#L74">persistence.existingClaim</a></td>
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
			<td>Existing claim to use instead of creating a new PVC.</td>
		</tr>
		<tr>
			<td id="persistence--mountPath"><a href="./values.yaml#L87">persistence.mountPath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/sqlite-volume"
</pre>
</div>
			</td>
			<td>SQLite data mount path.</td>
		</tr>
		<tr>
			<td id="persistence--retain"><a href="./values.yaml#L72">persistence.retain</a></td>
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
			<td>Keep PVC when Helm release is deleted. @description Set `true` to annotate PVC with `helm.sh/resource-policy: keep`.</td>
		</tr>
		<tr>
			<td id="persistence--size"><a href="./values.yaml#L76">persistence.size</a></td>
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
			<td>PVC storage size.</td>
		</tr>
		<tr>
			<td id="persistence--storageClass"><a href="./values.yaml#L78">persistence.storageClass</a></td>
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
			<td id="persistence--volumeName"><a href="./values.yaml#L85">persistence.volumeName</a></td>
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
			<td id="podAnnotations"><a href="./values.yaml#L24">podAnnotations</a></td>
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
			<td>Common pod annotations.</td>
		</tr>
		<tr>
			<td id="providers"><a href="./values.yaml#L582">providers</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "anthropic": {
    "apiKey": "",
    "apiKeySecretKey": "ANTHROPIC_API_KEY",
    "apiKeySecretRef": "kagent-anthropic",
    "config": {},
    "model": "claude-3-5-haiku-20241022",
    "provider": "Anthropic"
  },
  "azureOpenAI": {
    "apiKey": "",
    "apiKeySecretKey": "AZUREOPENAI_API_KEY",
    "apiKeySecretRef": "kagent-azure-openai",
    "config": {
      "apiVersion": "2023-05-15",
      "azureAdToken": "",
      "azureDeployment": "",
      "azureEndpoint": ""
    },
    "model": "gpt-4.1-mini",
    "provider": "AzureOpenAI"
  },
  "default": "openAI",
  "gemini": {
    "apiKey": "",
    "apiKeySecretKey": "GOOGLE_API_KEY",
    "apiKeySecretRef": "kagent-gemini",
    "config": {},
    "model": "gemini-2.0-flash-lite",
    "provider": "Gemini"
  },
  "ollama": {
    "config": {
      "host": "host.docker.internal:11434",
      "options": {
        "num_ctx": "64000"
      }
    },
    "model": "llama3.2",
    "provider": "Ollama"
  },
  "openAI": {
    "apiKey": "",
    "apiKeySecretKey": "OPENAI_API_KEY",
    "apiKeySecretRef": "kagent-openai",
    "config": {},
    "model": "gpt-4.1-mini",
    "provider": "OpenAI"
  }
}
</pre>
</div>
			</td>
			<td>LLM provider settings. @description Selected provider key is taken from `providers.default` and rendered into ModelConfig.</td>
		</tr>
		<tr>
			<td id="providers--default"><a href="./values.yaml#L584">providers.default</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"openAI"
</pre>
</div>
			</td>
			<td>Default provider key.</td>
		</tr>
		<tr>
			<td id="providers--openAI--apiKey"><a href="./values.yaml#L591">providers.openAI.apiKey</a></td>
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
			<td>Optional plaintext API key used when `modelConfig.createSecretFromApiKeyValues=true`.</td>
		</tr>
		<tr>
			<td id="proxy"><a href="./values.yaml#L644">proxy</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "url": ""
}
</pre>
</div>
			</td>
			<td>Optional proxy URL used by controller for internal URL routing.</td>
		</tr>
		<tr>
			<td id="rbac"><a href="./values.yaml#L401">rbac</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "create": true,
  "createLeaderElectionRole": true,
  "getterRules": [
    {
      "apiGroups": [
        "kagent.dev"
      ],
      "resources": [
        "agents",
        "modelconfigs",
        "modelproviderconfigs",
        "toolservers",
        "memories",
        "remotemcpservers",
        "mcpservers"
      ],
      "verbs": [
        "get",
        "list",
        "watch"
      ]
    },
    {
      "apiGroups": [
        "kagent.dev"
      ],
      "resources": [
        "agents/finalizers",
        "modelconfigs/finalizers",
        "modelproviderconfigs/finalizers",
        "toolservers/finalizers",
        "memories/finalizers",
        "remotemcpservers/finalizers",
        "mcpservers/finalizers"
      ],
      "verbs": [
        "update"
      ]
    },
    {
      "apiGroups": [
        "kagent.dev"
      ],
      "resources": [
        "agents/status",
        "modelconfigs/status",
        "modelproviderconfigs/status",
        "toolservers/status",
        "memories/status",
        "remotemcpservers/status",
        "mcpservers/status"
      ],
      "verbs": [
        "get",
        "patch",
        "update"
      ]
    },
    {
      "apiGroups": [
        ""
      ],
      "resources": [
        "*"
      ],
      "verbs": [
        "get",
        "list",
        "watch"
      ]
    },
    {
      "apiGroups": [
        "apps"
      ],
      "resources": [
        "*"
      ],
      "verbs": [
        "get",
        "list",
        "watch"
      ]
    },
    {
      "apiGroups": [
        "batch"
      ],
      "resources": [
        "*"
      ],
      "verbs": [
        "get",
        "list",
        "watch"
      ]
    },
    {
      "apiGroups": [
        "rbac.authorization.k8s.io"
      ],
      "resources": [
        "*"
      ],
      "verbs": [
        "get",
        "list",
        "watch"
      ]
    },
    {
      "apiGroups": [
        "apiextensions.k8s.io"
      ],
      "resources": [
        "*"
      ],
      "verbs": [
        "get",
        "list",
        "watch"
      ]
    },
    {
      "apiGroups": [
        "gateway.networking.k8s.io"
      ],
      "resources": [
        "*"
      ],
      "verbs": [
        "get",
        "list",
        "watch"
      ]
    }
  ],
  "writerRules": [
    {
      "apiGroups": [
        "kagent.dev"
      ],
      "resources": [
        "agents",
        "modelconfigs",
        "modelproviderconfigs",
        "toolservers",
        "memories",
        "remotemcpservers",
        "mcpservers"
      ],
      "verbs": [
        "create",
        "update",
        "patch",
        "delete"
      ]
    },
    {
      "apiGroups": [
        "kagent.dev"
      ],
      "resources": [
        "agents/finalizers",
        "modelconfigs/finalizers",
        "modelproviderconfigs/finalizers",
        "toolservers/finalizers",
        "memories/finalizers",
        "remotemcpservers/finalizers",
        "mcpservers/finalizers"
      ],
      "verbs": [
        "update"
      ]
    },
    {
      "apiGroups": [
        ""
      ],
      "resources": [
        "*"
      ],
      "verbs": [
        "create",
        "update",
        "patch",
        "delete"
      ]
    },
    {
      "apiGroups": [
        "apps"
      ],
      "resources": [
        "*"
      ],
      "verbs": [
        "create",
        "update",
        "patch",
        "delete"
      ]
    },
    {
      "apiGroups": [
        "batch"
      ],
      "resources": [
        "*"
      ],
      "verbs": [
        "create",
        "update",
        "patch",
        "delete"
      ]
    },
    {
      "apiGroups": [
        "apiextensions.k8s.io"
      ],
      "resources": [
        "*"
      ],
      "verbs": [
        "create",
        "update",
        "patch",
        "delete"
      ]
    },
    {
      "apiGroups": [
        "gateway.networking.k8s.io"
      ],
      "resources": [
        "*"
      ],
      "verbs": [
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
			<td>RBAC for controller.</td>
		</tr>
		<tr>
			<td id="rbac--create"><a href="./values.yaml#L403">rbac.create</a></td>
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
			<td>Create RBAC resources required by the controller.</td>
		</tr>
		<tr>
			<td id="rbac--createLeaderElectionRole"><a href="./values.yaml#L405">rbac.createLeaderElectionRole</a></td>
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
			<td>Create leader-election Role/RoleBinding when replicas > 1.</td>
		</tr>
		<tr>
			<td id="rbac--getterRules"><a href="./values.yaml#L407">rbac.getterRules</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "apiGroups": [
      "kagent.dev"
    ],
    "resources": [
      "agents",
      "modelconfigs",
      "modelproviderconfigs",
      "toolservers",
      "memories",
      "remotemcpservers",
      "mcpservers"
    ],
    "verbs": [
      "get",
      "list",
      "watch"
    ]
  },
  {
    "apiGroups": [
      "kagent.dev"
    ],
    "resources": [
      "agents/finalizers",
      "modelconfigs/finalizers",
      "modelproviderconfigs/finalizers",
      "toolservers/finalizers",
      "memories/finalizers",
      "remotemcpservers/finalizers",
      "mcpservers/finalizers"
    ],
    "verbs": [
      "update"
    ]
  },
  {
    "apiGroups": [
      "kagent.dev"
    ],
    "resources": [
      "agents/status",
      "modelconfigs/status",
      "modelproviderconfigs/status",
      "toolservers/status",
      "memories/status",
      "remotemcpservers/status",
      "mcpservers/status"
    ],
    "verbs": [
      "get",
      "patch",
      "update"
    ]
  },
  {
    "apiGroups": [
      ""
    ],
    "resources": [
      "*"
    ],
    "verbs": [
      "get",
      "list",
      "watch"
    ]
  },
  {
    "apiGroups": [
      "apps"
    ],
    "resources": [
      "*"
    ],
    "verbs": [
      "get",
      "list",
      "watch"
    ]
  },
  {
    "apiGroups": [
      "batch"
    ],
    "resources": [
      "*"
    ],
    "verbs": [
      "get",
      "list",
      "watch"
    ]
  },
  {
    "apiGroups": [
      "rbac.authorization.k8s.io"
    ],
    "resources": [
      "*"
    ],
    "verbs": [
      "get",
      "list",
      "watch"
    ]
  },
  {
    "apiGroups": [
      "apiextensions.k8s.io"
    ],
    "resources": [
      "*"
    ],
    "verbs": [
      "get",
      "list",
      "watch"
    ]
  },
  {
    "apiGroups": [
      "gateway.networking.k8s.io"
    ],
    "resources": [
      "*"
    ],
    "verbs": [
      "get",
      "list",
      "watch"
    ]
  }
]
</pre>
</div>
			</td>
			<td>ClusterRole rules used for read/watch operations.</td>
		</tr>
		<tr>
			<td id="rbac--writerRules"><a href="./values.yaml#L497">rbac.writerRules</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "apiGroups": [
      "kagent.dev"
    ],
    "resources": [
      "agents",
      "modelconfigs",
      "modelproviderconfigs",
      "toolservers",
      "memories",
      "remotemcpservers",
      "mcpservers"
    ],
    "verbs": [
      "create",
      "update",
      "patch",
      "delete"
    ]
  },
  {
    "apiGroups": [
      "kagent.dev"
    ],
    "resources": [
      "agents/finalizers",
      "modelconfigs/finalizers",
      "modelproviderconfigs/finalizers",
      "toolservers/finalizers",
      "memories/finalizers",
      "remotemcpservers/finalizers",
      "mcpservers/finalizers"
    ],
    "verbs": [
      "update"
    ]
  },
  {
    "apiGroups": [
      ""
    ],
    "resources": [
      "*"
    ],
    "verbs": [
      "create",
      "update",
      "patch",
      "delete"
    ]
  },
  {
    "apiGroups": [
      "apps"
    ],
    "resources": [
      "*"
    ],
    "verbs": [
      "create",
      "update",
      "patch",
      "delete"
    ]
  },
  {
    "apiGroups": [
      "batch"
    ],
    "resources": [
      "*"
    ],
    "verbs": [
      "create",
      "update",
      "patch",
      "delete"
    ]
  },
  {
    "apiGroups": [
      "apiextensions.k8s.io"
    ],
    "resources": [
      "*"
    ],
    "verbs": [
      "create",
      "update",
      "patch",
      "delete"
    ]
  },
  {
    "apiGroups": [
      "gateway.networking.k8s.io"
    ],
    "resources": [
      "*"
    ],
    "verbs": [
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
			<td>ClusterRole rules used for write operations.</td>
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
			<td>RuntimeClass for controller and UI pods.</td>
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
			<td>RuntimeClass for test pods.</td>
		</tr>
		<tr>
			<td id="serviceAccount"><a href="./values.yaml#L380">serviceAccount</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "controller": {
    "annotations": {},
    "automountServiceAccountToken": true,
    "create": true,
    "name": ""
  },
  "ui": {
    "annotations": {},
    "automountServiceAccountToken": false,
    "create": true,
    "name": ""
  }
}
</pre>
</div>
			</td>
			<td>Service account settings.</td>
		</tr>
		<tr>
			<td id="serviceAccount--controller--annotations"><a href="./values.yaml#L385">serviceAccount.controller.annotations</a></td>
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
			<td>Controller service account annotations.</td>
		</tr>
		<tr>
			<td id="serviceAccount--controller--automountServiceAccountToken"><a href="./values.yaml#L389">serviceAccount.controller.automountServiceAccountToken</a></td>
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
			<td>Automount service account token for controller.</td>
		</tr>
		<tr>
			<td id="serviceAccount--controller--create"><a href="./values.yaml#L383">serviceAccount.controller.create</a></td>
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
			<td>Create controller service account.</td>
		</tr>
		<tr>
			<td id="serviceAccount--controller--name"><a href="./values.yaml#L387">serviceAccount.controller.name</a></td>
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
			<td>Controller service account name override.</td>
		</tr>
		<tr>
			<td id="serviceAccount--ui--annotations"><a href="./values.yaml#L394">serviceAccount.ui.annotations</a></td>
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
			<td>UI service account annotations.</td>
		</tr>
		<tr>
			<td id="serviceAccount--ui--automountServiceAccountToken"><a href="./values.yaml#L398">serviceAccount.ui.automountServiceAccountToken</a></td>
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
			<td>Automount service account token for UI.</td>
		</tr>
		<tr>
			<td id="serviceAccount--ui--create"><a href="./values.yaml#L392">serviceAccount.ui.create</a></td>
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
			<td>Create UI service account.</td>
		</tr>
		<tr>
			<td id="serviceAccount--ui--name"><a href="./values.yaml#L396">serviceAccount.ui.name</a></td>
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
			<td>UI service account name override.</td>
		</tr>
		<tr>
			<td id="ui"><a href="./values.yaml#L229">ui</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "affinity": {},
  "backendUrl": "",
  "enabled": true,
  "env": {},
  "image": {
    "pullPolicy": "",
    "registry": "",
    "repository": "kagent-dev/kagent/ui",
    "tag": ""
  },
  "livenessProbe": {
    "failureThreshold": 6,
    "httpGet": {
      "path": "/health",
      "port": "http"
    },
    "initialDelaySeconds": 30,
    "periodSeconds": 10,
    "timeoutSeconds": 5
  },
  "nodeSelector": {},
  "podAnnotations": {},
  "podLabels": {},
  "podSecurityContext": {},
  "readinessProbe": {
    "failureThreshold": 6,
    "httpGet": {
      "path": "/health",
      "port": "http"
    },
    "initialDelaySeconds": 10,
    "periodSeconds": 10,
    "timeoutSeconds": 5
  },
  "replicas": 1,
  "resources": {
    "limits": {
      "cpu": "1000m",
      "memory": "1Gi"
    },
    "requests": {
      "cpu": "100m",
      "memory": "256Mi"
    }
  },
  "securityContext": {
    "allowPrivilegeEscalation": false,
    "capabilities": {
      "drop": [
        "ALL"
      ]
    },
    "readOnlyRootFilesystem": false,
    "runAsGroup": 1001,
    "runAsNonRoot": true,
    "runAsUser": 1001,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "service": {
    "annotations": {},
    "labels": {},
    "port": 8080,
    "targetPort": 8080,
    "targetProtocol": "TCP",
    "type": "ClusterIP"
  },
  "startupProbe": {
    "failureThreshold": 20,
    "httpGet": {
      "path": "/health",
      "port": "http"
    },
    "initialDelaySeconds": 5,
    "periodSeconds": 5,
    "timeoutSeconds": 5
  },
  "tmpVolume": {
    "enabled": true,
    "sizeLimit": "256Mi"
  },
  "tolerations": []
}
</pre>
</div>
			</td>
			<td>UI deployment settings.</td>
		</tr>
		<tr>
			<td id="ui--affinity"><a href="./values.yaml#L277">ui.affinity</a></td>
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
			<td>UI affinity.</td>
		</tr>
		<tr>
			<td id="ui--backendUrl"><a href="./values.yaml#L236">ui.backendUrl</a></td>
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
			<td>Optional UI backend URL override. @description Defaults to `http://<fullname>-controller.<namespace>.svc.cluster.local:<controllerPort>/api`.</td>
		</tr>
		<tr>
			<td id="ui--enabled"><a href="./values.yaml#L231">ui.enabled</a></td>
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
			<td>Enable kagent UI deployment.</td>
		</tr>
		<tr>
			<td id="ui--env"><a href="./values.yaml#L267">ui.env</a></td>
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
			<td>Extra UI env variables.</td>
		</tr>
		<tr>
			<td id="ui--image--pullPolicy"><a href="./values.yaml#L245">ui.image.pullPolicy</a></td>
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
			<td>UI image pull policy override.</td>
		</tr>
		<tr>
			<td id="ui--image--registry"><a href="./values.yaml#L239">ui.image.registry</a></td>
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
			<td>UI image registry override.</td>
		</tr>
		<tr>
			<td id="ui--image--repository"><a href="./values.yaml#L241">ui.image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kagent-dev/kagent/ui"
</pre>
</div>
			</td>
			<td>UI image repository.</td>
		</tr>
		<tr>
			<td id="ui--image--tag"><a href="./values.yaml#L243">ui.image.tag</a></td>
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
			<td>UI image tag override.</td>
		</tr>
		<tr>
			<td id="ui--livenessProbe"><a href="./values.yaml#L298">ui.livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 6,
  "httpGet": {
    "path": "/health",
    "port": "http"
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10,
  "timeoutSeconds": 5
}
</pre>
</div>
			</td>
			<td>UI health probes.</td>
		</tr>
		<tr>
			<td id="ui--nodeSelector"><a href="./values.yaml#L273">ui.nodeSelector</a></td>
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
			<td>UI node selector.</td>
		</tr>
		<tr>
			<td id="ui--podAnnotations"><a href="./values.yaml#L269">ui.podAnnotations</a></td>
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
			<td>UI pod annotations.</td>
		</tr>
		<tr>
			<td id="ui--podLabels"><a href="./values.yaml#L271">ui.podLabels</a></td>
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
			<td>UI pod labels.</td>
		</tr>
		<tr>
			<td id="ui--podSecurityContext"><a href="./values.yaml#L279">ui.podSecurityContext</a></td>
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
			<td>UI pod security context.</td>
		</tr>
		<tr>
			<td id="ui--replicas"><a href="./values.yaml#L233">ui.replicas</a></td>
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
			<td>Number of UI replicas.</td>
		</tr>
		<tr>
			<td id="ui--securityContext"><a href="./values.yaml#L281">ui.securityContext</a></td>
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
  "runAsGroup": 1001,
  "runAsNonRoot": true,
  "runAsUser": 1001,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>UI container security context.</td>
		</tr>
		<tr>
			<td id="ui--service--annotations"><a href="./values.yaml#L257">ui.service.annotations</a></td>
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
			<td>UI service annotations.</td>
		</tr>
		<tr>
			<td id="ui--service--labels"><a href="./values.yaml#L259">ui.service.labels</a></td>
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
			<td>UI service labels.</td>
		</tr>
		<tr>
			<td id="ui--service--port"><a href="./values.yaml#L261">ui.service.port</a></td>
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
			<td>UI service port.</td>
		</tr>
		<tr>
			<td id="ui--service--targetPort"><a href="./values.yaml#L263">ui.service.targetPort</a></td>
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
			<td>UI container target port.</td>
		</tr>
		<tr>
			<td id="ui--service--targetProtocol"><a href="./values.yaml#L265">ui.service.targetProtocol</a></td>
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
			<td>UI service protocol.</td>
		</tr>
		<tr>
			<td id="ui--service--type"><a href="./values.yaml#L255">ui.service.type</a></td>
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
			<td>UI Service type. This chart enforces ClusterIP.</td>
		</tr>
		<tr>
			<td id="ui--tmpVolume--enabled"><a href="./values.yaml#L294">ui.tmpVolume.enabled</a></td>
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
			<td>Mount a writable emptyDir at `/tmp` for nginx/supervisord runtime files.</td>
		</tr>
		<tr>
			<td id="ui--tmpVolume--sizeLimit"><a href="./values.yaml#L296">ui.tmpVolume.sizeLimit</a></td>
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
			<td>Optional tmp emptyDir size limit.</td>
		</tr>
		<tr>
			<td id="ui--tolerations"><a href="./values.yaml#L275">ui.tolerations</a></td>
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
			<td>UI tolerations.</td>
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

### Scope and prerequisites

* This chart deploys the **kagent controller + UI + default ModelConfig**.
* kagent CRDs are **not** shipped here and must be installed beforehand (for example via `kagent-crds` chart).
* Upstream subcharts such as `kmcp` and built-in tool/agent bundles are intentionally not deployed by this chart to keep the implementation environment-agnostic and monorepo-aligned.

### Networking and exposure

* Both services are `ClusterIP` only.
* External exposure is intentionally done through optional `ingress` or `gatewayApi` resources for the UI.
* Controller API stays internal by default.

### Database and scaling behavior

* `database.type=sqlite` is the default and intended for single-replica controller setups.
* `controller.replicas > 1` requires `database.type=postgres`.
* Postgres can be supplied via:
  * `database.postgres.urlSecret`
  * `database.postgres.url`
  * `database.postgres.urlFile`
* CNPG integration is supported through `database.useCnpgCluster.*` using the app secret URI key.

### RBAC and security

* Controller RBAC is enabled by default because kagent reconciles cluster resources and requires cluster-scoped access.
* Review `rbac.getterRules` and `rbac.writerRules` for your environment and reduce scope where possible.
* Provider API keys should be supplied via existing Kubernetes Secrets.
* Plaintext API key values in `values.yaml` are only for bootstrap/demo workflows.

### Cilium policy integration

* `libchartCnps.enabled=false` by default for broad cluster compatibility.
* When enabled, app traffic policy adds defaults for ingress-nginx / Envoy Gateway source labels conditionally based on `ingress.enabled` / `gatewayApi.enabled`.
* App egress defaults to HTTPS world egress and optional Kubernetes API server access for controller reconciliation.
