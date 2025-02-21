

# outline

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.81.1](https://img.shields.io/badge/AppVersion-0.81.1-informational?style=flat-square)

A Helm chart for an easier outline (https://getoutline.com) deployment at kubernetes.

**Homepage:** <https://github.com/CodeAdminDe/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Frederic Roggon | <frederic.roggon@codeadmin.de> | <https://github.com/CodeAdminDe> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | minio(minio) | 15.0.4 |
| https://charts.bitnami.com/bitnami | postgresql(postgresql) | 16.4.13 |
| https://charts.bitnami.com/bitnami | redis(redis) | 20.8.0 |

## TL;DR

You don't want to read through the docs? That's the quick and dirty way:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
helm install outline codeadminde/outline
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

To install the chart with the release name `outline`

```bash
helm install outline codeadminde/outline
```
_**Note**: If you want to speicify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforhand._

## Uninstallation

To uninstall the chart release named `outline`

```bash
helm uninstall outline
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
> helm install outline codeadminde/outline -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Than you've to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install outline --set key=value --set keyTwo=secondValue codeadminde/outline
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
			<td id="additionalEnvSecrets"><a href="./values.yaml#L147">additionalEnvSecrets</a></td>
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
			<td>Provide additonal env vars via one or more secretes... useful for OIDC setup etc... Specifiy the ENV key used by outline as KEY and the secret name as VALUE. The secret should contain the ENV key and the encrypted value: Sample secret ... apiVersion: v1 kind: Secret metadata: name: your-secret-name-to-slack-oidc-secrets type: Opaque stringData:   SLACK_KEY: "slack-key-value-goes-here"   SLACK_SECRET: "slack-secret-value-goes-here"</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L313">affinity</a></td>
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
			<td id="autoscaling"><a href="./values.yaml#L289">autoscaling</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "maxReplicas": 100,
  "minReplicas": 1,
  "targetCPUUtilizationPercentage": 80
}
</pre>
</div>
			</td>
			<td>This section is for setting up autoscaling more information can be found here: https://kubernetes.io/docs/concepts/workloads/autoscaling/</td>
		</tr>
		<tr>
			<td id="env"><a href="./values.yaml#L124">env</a></td>
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
			<td>Provide env vars to the deployment. Do not add secretes here... use additionalEnvSecrets instead!</td>
		</tr>
		<tr>
			<td id="existingEnvSecret"><a href="./values.yaml#L132">existingEnvSecret</a></td>
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
			<td>Provide the name of a pre-existing secret for the keys SECRET_KEY and UTILS_SECRET, if you do not want to use a auto-generated one. Note that the autogenerated secrets won't be regenerated on updates. Leave empty, to let helm handle it for you.</td>
		</tr>
		<tr>
			<td id="fileStorage"><a href="./values.yaml#L96">fileStorage</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "useLocal": false
}
</pre>
</div>
			</td>
			<td>FileStorage (local or remote) config Define if you'd like to store avatar images and document attachments at local disk (requires PV) or at s3 storage. When set to 'true',  will be saved on local disk. Note that this would require a persistent volume (see persistence). When set to 'false', s3 storage with provided configuration will be used.</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L29">fullnameOverride</a></td>
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
			<td id="image"><a href="./values.yaml#L19">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "outlinewiki/outline",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>This sets the container image more information can be found here: https://kubernetes.io/docs/concepts/containers/images/ Override the image tag, whose default is the chart appVersion.</td>
		</tr>
		<tr>
			<td id="imagePullSecrets"><a href="./values.yaml#L25">imagePullSecrets</a></td>
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
			<td>This is for the secrets for pulling an image from a private repository more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/</td>
		</tr>
		<tr>
			<td id="ingress"><a href="./values.yaml#L230">ingress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "className": "nginx",
  "enabled": true,
  "hosts": [
    {
      "host": "chart-example.local",
      "paths": [
        {
          "path": "/",
          "pathType": "ImplementationSpecific"
        }
      ]
    }
  ],
  "tls": [
    {
      "hosts": [
        "chart-example.local"
      ],
      "secretName": ""
    }
  ]
}
</pre>
</div>
			</td>
			<td>This block is for setting up the outline ingress. More information about ingress in general can be found here: https://kubernetes.io/docs/concepts/services-networking/ingress/ To get a better understanding and some more explanation, take a look into the values.yaml provided with the chart.</td>
		</tr>
		<tr>
			<td id="ingress--tls[0]--secretName"><a href="./values.yaml#L257">ingress.tls[0].secretName</a></td>
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
			<td>secretName of the certificate to use. When providing an empty string as secretNmae, the key will be skipped. That allowes to use the default ingress-nginx certificate for this ingress object.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L273">livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "failureThreshold": 3,
  "httpGet": {
    "path": "/_health",
    "port": 3000
  },
  "initialDelaySeconds": 30,
  "periodSeconds": 10
}
</pre>
</div>
			</td>
			<td>This is to setup the liveness and readiness probes more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/</td>
		</tr>
		<tr>
			<td id="minio"><a href="./values.yaml#L185">minio</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "apiIngress": {
    "annotations": {
      "nginx.ingress.kubernetes.io/server-snippet": "location /minio/v2/metrics/cluster {\n    deny all;\n    return 403 \"Forbidden\";\n}\n"
    },
    "certManager": false,
    "enabled": true,
    "hostname": "data.outline.yourdomain.tld",
    "ingressClassName": "",
    "tls": true
  },
  "defaultBuckets": "ol-data",
  "disableWebUI": true,
  "enabled": true,
  "mode": "standalone",
  "persistence": {
    "enabled": true,
    "size": "16Gi",
    "storageClass": ""
  }
}
</pre>
</div>
			</td>
			<td>This block configures the dependeny / subchart details for bitnami/minio. Please take a look into the values.yaml to get a more detailed view of the required settings. If you'd want to tweak settings, please take a look at the upstream values.yaml at https://github.com/bitnami/charts/blob/main/bitnami/minio/values.yaml Note: Provides annotation for ingress-nginx to block minio cluster metrics. You should check if that's okay within your env and update if required!</td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L28">nameOverride</a></td>
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
			<td>This is to override the chart name.</td>
		</tr>
		<tr>
			<td id="nodeSelector"><a href="./values.yaml#L309">nodeSelector</a></td>
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
			<td id="persistence"><a href="./values.yaml#L100">persistence</a></td>
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
  "cacheDirHomeSizeLimit": "100Mi",
  "cacheDirTmpSizeLimit": "100Mi",
  "emptyDirSizeLimit": "500Mi",
  "enabled": true,
  "size": "1Gi",
  "storageClass": "longhorn"
}
</pre>
</div>
			</td>
			<td>This configures the persistens of your release. Note that outline needs a writeable tmp/home directory, even when using S3 as storage backend.</td>
		</tr>
		<tr>
			<td id="persistence--accessModes"><a href="./values.yaml#L116">persistence.accessModes</a></td>
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
			<td>Define the accessModes to use when not providing a already existing PVC claim.</td>
		</tr>
		<tr>
			<td id="persistence--cacheDirHomeSizeLimit"><a href="./values.yaml#L110">persistence.cacheDirHomeSizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"100Mi"
</pre>
</div>
			</td>
			<td>Define the max directory size for the /home directory. We need to use a emptyDir, when require securtyContext.readOnlyRootFilesystem: true.</td>
		</tr>
		<tr>
			<td id="persistence--cacheDirTmpSizeLimit"><a href="./values.yaml#L108">persistence.cacheDirTmpSizeLimit</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"100Mi"
</pre>
</div>
			</td>
			<td>Define the max directory size for the /tmp directory. We need to use a emptyDir, when require securtyContext.readOnlyRootFilesystem: true.</td>
		</tr>
		<tr>
			<td id="persistence--emptyDirSizeLimit"><a href="./values.yaml#L106">persistence.emptyDirSizeLimit</a></td>
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
			<td>Define the max directory size when using persistence.enabled: false together with fileStorage.useLocal: true (absolutely not recommended for production)</td>
		</tr>
		<tr>
			<td id="persistence--enabled"><a href="./values.yaml#L104">persistence.enabled</a></td>
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
			<td>false -> app uses emptyDir (with persistence.emptyDirSizeLimit) // true -> app uses pvc created by helm. (or existingClaim, if provided). When not using local filestorage (fileStorage.useLocal: false), no volume (empty or pv/c) would be assigned. Important: If you're using fileStorage.useLocal: true, together with persistence.enabled: false, you'd loose your stored data as soon as the container restarts.</td>
		</tr>
		<tr>
			<td id="persistence--size"><a href="./values.yaml#L112">persistence.size</a></td>
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
			<td>Define the size of the PV when using persistence.enabled: true together with fileStorage.useLocal: true</td>
		</tr>
		<tr>
			<td id="persistence--storageClass"><a href="./values.yaml#L114">persistence.storageClass</a></td>
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
			<td>Define the storageClass to use when not providing a already existing PVC claim. Provide your cluster storageclass or leave it empty to use the default one.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L45">podAnnotations</a></td>
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
			<td>This is for setting Kubernetes Annotations to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/</td>
		</tr>
		<tr>
			<td id="podLabels"><a href="./values.yaml#L48">podLabels</a></td>
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
			<td>This is for setting Kubernetes Labels to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/</td>
		</tr>
		<tr>
			<td id="podSecurityContext"><a href="./values.yaml#L52">podSecurityContext</a></td>
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
			<td>This is for the pod-level security attributes and common container settings. More information: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/</td>
		</tr>
		<tr>
			<td id="postgresql"><a href="./values.yaml#L169">postgresql</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "architecture": "standalone",
  "auth": {
    "database": "outline",
    "username": "outline"
  },
  "enabled": true,
  "persistence": {
    "enabled": true,
    "size": "8Gi",
    "storageClass": ""
  }
}
</pre>
</div>
			</td>
			<td>This block configures the dependeny / subchart details for bitnami/postgresql. Please take a look into the values.yaml to get a more detailed view of the needed settings. If you'd want to tweak settings, please take a look at the upstream values.yaml at https://github.com/bitnami/charts/blob/main/bitnami/postgresql/values.yaml</td>
		</tr>
		<tr>
			<td id="provideMinioApiAsIngressSubpath"><a href="./values.yaml#L212">provideMinioApiAsIngressSubpath</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "additionalAnnotations": {
    "nginx.ingress.kubernetes.io/server-snippet": "location /ol-data-path/minio/v2/metrics/cluster {\n    deny all;\n    return 403 \"Forbidden\";\n}\n"
  },
  "enabled": false,
  "path": "/ol-data-path",
  "pathType": "ImplementationSpecific"
}
</pre>
</div>
			</td>
			<td>EXPERIMENTAL FEATURE=> If enabled, the minio service will be provided as subpath under *all* listed ingress.hosts. Note: You should set minio.apiIngress.enabled: false to avoid exposing minio via subpath and own ingress (!) Could require additional configuration changes. E.g. within subcharts! <=EXPERIMENTAL FEATURE</td>
		</tr>
		<tr>
			<td id="provideMinioApiAsIngressSubpath--additionalAnnotations"><a href="./values.yaml#L218">provideMinioApiAsIngressSubpath.additionalAnnotations</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "nginx.ingress.kubernetes.io/server-snippet": "location /ol-data-path/minio/v2/metrics/cluster {\n    deny all;\n    return 403 \"Forbidden\";\n}\n"
}
</pre>
</div>
			</td>
			<td>Add additional annotations to the ingress object. Recommended: Block external access to minio metrics. To disable, provide additionalAnnotations: {}</td>
		</tr>
		<tr>
			<td id="provideMinioApiAsIngressSubpath--additionalAnnotations--"nginx--ingress--kubernetes--io/server-snippet""><a href="./values.yaml#L220">provideMinioApiAsIngressSubpath.additionalAnnotations."nginx.ingress.kubernetes.io/server-snippet"</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"location /ol-data-path/minio/v2/metrics/cluster {\n    deny all;\n    return 403 \"Forbidden\";\n}\n"
</pre>
</div>
			</td>
			<td>Annotation for ingress-nginx to block minio cluster metrics. You should check if that's okay within your env and update / change if required!</td>
		</tr>
		<tr>
			<td id="provideMinioApiAsIngressSubpath--enabled"><a href="./values.yaml#L214">provideMinioApiAsIngressSubpath.enabled</a></td>
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
			<td>Enable subpath for minio api service.</td>
		</tr>
		<tr>
			<td id="readinessProbe--failureThreshold"><a href="./values.yaml#L284">readinessProbe.failureThreshold</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--httpGet--path"><a href="./values.yaml#L282">readinessProbe.httpGet.path</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/_health"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--httpGet--port"><a href="./values.yaml#L283">readinessProbe.httpGet.port</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--initialDelaySeconds"><a href="./values.yaml#L286">readinessProbe.initialDelaySeconds</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--periodSeconds"><a href="./values.yaml#L285">readinessProbe.periodSeconds</a></td>
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
			<td id="redis"><a href="./values.yaml#L156">redis</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "architecture": "standalone",
  "auth": {
    "enabled": true
  },
  "enabled": true,
  "persistence": {
    "size": "2Gi",
    "storageClass": ""
  }
}
</pre>
</div>
			</td>
			<td>This block configures the dependeny / subchart details for bitnami/redis. Please take a look into the values.yaml to get a more detailed view of the needed settings. If you'd want to tweak settings, please take a look at the upstream values.yaml at https://github.com/bitnami/charts/blob/main/bitnami/redis/values.yaml</td>
		</tr>
		<tr>
			<td id="replicaCount"><a href="./values.yaml#L6">replicaCount</a></td>
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
			<td>This will set the replicaset count more information can be found here: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L260">resources</a></td>
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
			<td>Specify default resources (not recommended, see values.yaml)</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L84">runtimeClass</a></td>
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
			<td id="runtimeClass--jobs"><a href="./values.yaml#L88">runtimeClass.jobs</a></td>
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
			<td id="runtimeClass--pods"><a href="./values.yaml#L86">runtimeClass.pods</a></td>
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
			<td id="runtimeClass--tests"><a href="./values.yaml#L90">runtimeClass.tests</a></td>
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
			<td id="securityContext"><a href="./values.yaml#L58">securityContext</a></td>
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
  "runAsUser": 1000,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>This is for the scurityContext at container level. Note that container settings do not affect the Pod's Volumes. More information: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container</td>
		</tr>
		<tr>
			<td id="service--port"><a href="./values.yaml#L14">service.port</a></td>
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
			<td>This sets the ports more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#field-spec-ports</td>
		</tr>
		<tr>
			<td id="service--targetPort"><a href="./values.yaml#L15">service.targetPort</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="service--type"><a href="./values.yaml#L12">service.type</a></td>
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
			<td>This sets the service type more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types</td>
		</tr>
		<tr>
			<td id="serviceAccount"><a href="./values.yaml#L32">serviceAccount</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "automount": true,
  "create": true,
  "name": ""
}
</pre>
</div>
			</td>
			<td>This section builds out the service account more information can be found here: https://kubernetes.io/docs/concepts/security/service-accounts/</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L311">tolerations</a></td>
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
			<td id="volumeMounts"><a href="./values.yaml#L304">volumeMounts</a></td>
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
			<td>Additional volumeMounts on the output Deployment definition.</td>
		</tr>
		<tr>
			<td id="volumes"><a href="./values.yaml#L297">volumes</a></td>
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
			<td>Additional volumes on the output Deployment definition.</td>
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
