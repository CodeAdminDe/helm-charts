

# bind9-hidden-primary

![Version: 0.4.2](https://img.shields.io/badge/Version-0.4.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 9.20](https://img.shields.io/badge/AppVersion-9.20-informational?style=flat-square)

A Helm chart for bind9 to use as hidden primary, based on the offical Docker Image by InternetSystemsConsortium (ISC)

**Homepage:** <https://github.com/CodeAdminDe/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Frederic Roggon | <frederic.roggon@codeadmin.de> | <https://github.com/CodeAdminDe> |

## TL;DR

You don't want to read through the docs? That's the quick and dirty way:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
helm install bind9-hidden-primary codeadminde/bind9-hidden-primary
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

To install the chart with the release name `bind9-hidden-primary`

```bash
helm install bind9-hidden-primary codeadminde/bind9-hidden-primary
```
_**Note**: If you want to speicify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforhand._

## Uninstallation

To uninstall the chart release named `bind9-hidden-primary`

```bash
helm uninstall bind9-hidden-primary
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
> helm install bind9-hidden-primary codeadminde/bind9-hidden-primary -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Than you've to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install bind9-hidden-primary --set key=value --set keyTwo=secondValue codeadminde/bind9-hidden-primary
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
			<td id="affinity"><a href="./values.yaml#L240">affinity</a></td>
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
			<td id="autoscaling"><a href="./values.yaml#L216">autoscaling</a></td>
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
			<td id="env"><a href="./values.yaml#L106">env</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "tsigHmacFunc": "HMAC-SHA512",
  "tsigKeyname": "rndc-allow-transfer-tsigkey"
}
</pre>
</div>
			</td>
			<td>This configures the TSIG Key HMAC algo and Key Name which will be used within the configuration of bind9. Usually, you won't need to change these defaults. General details about the TSIG implementation could be found at: https://www.isc.org/docs/2021-bind-mgmt-05-webinar.pdf</td>
		</tr>
		<tr>
			<td id="existingConfigMap"><a href="./values.yaml#L178">existingConfigMap</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "includes": "",
  "named": "",
  "run": "",
  "zonedbs": ""
}
</pre>
</div>
			</td>
			<td>Provide your own includes.d/, named.conf and/or entrypoint configMap to override chart-included configurations.</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L41">fullnameOverride</a></td>
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
			<td id="image"><a href="./values.yaml#L25">image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "internetsystemsconsortium/bind9",
  "tag": ""
}
</pre>
</div>
			</td>
			<td>This sets the container image more information can be found here: https://kubernetes.io/docs/concepts/containers/images/ Override the image tag, whose default is the chart appVersion.</td>
		</tr>
		<tr>
			<td id="imagePullSecrets"><a href="./values.yaml#L37">imagePullSecrets</a></td>
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
			<td id="jobImage"><a href="./values.yaml#L32">jobImage</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "repository": "ghcr.io/codeadminde/bind9-kubectl",
  "tag": "latest"
}
</pre>
</div>
			</td>
			<td>This sets the job container image to use. The image needs kubectl and bind9 already present in order to fullfill it's job and to be used with a restricted namespace policy.</td>
		</tr>
		<tr>
			<td id="livenessProbe"><a href="./values.yaml#L200">livenessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "initialDelaySeconds": 5,
  "periodSeconds": 10,
  "tcpSocket": {
    "port": 5353
  }
}
</pre>
</div>
			</td>
			<td>This is to setup the liveness probe. By default, we're using the tcpSocket to provide the liveness state. More information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/</td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L40">nameOverride</a></td>
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
			<td id="nodeSelector"><a href="./values.yaml#L236">nodeSelector</a></td>
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
			<td id="persistence"><a href="./values.yaml#L165">persistence</a></td>
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
  "cacheDirSizeLimit": "500Mi",
  "emptyDirSizeLimit": "500Mi",
  "enabled": true,
  "size": "1Gi",
  "storageClass": "longhorn"
}
</pre>
</div>
			</td>
			<td>This configures the persistens of your release. The bind9 service uses persistent storage to save it's current zone database and to ensure all running containers does share the same details. See values.yaml for a detailed sample.</td>
		</tr>
		<tr>
			<td id="podAnnotations"><a href="./values.yaml#L57">podAnnotations</a></td>
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
			<td id="podLabels"><a href="./values.yaml#L60">podLabels</a></td>
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
			<td id="podSecurityContext"><a href="./values.yaml#L64">podSecurityContext</a></td>
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
			<td id="providerPrimaryAclIpList"><a href="./values.yaml#L116">providerPrimaryAclIpList</a></td>
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
			<td>List of upstream dns servers that are allowed to query the hidden primary (AXFR requests) (Separator: ";"). Provide your providers upstream IP and/or IPs.</td>
		</tr>
		<tr>
			<td id="providerPrimaryIpList"><a href="./values.yaml#L112">providerPrimaryIpList</a></td>
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
			<td>List of upstream dns servers which gets notified (Separator: ";"). Provide your providers upstream IP and/or IPs.</td>
		</tr>
		<tr>
			<td id="proxyv2"><a href="./values.yaml#L123">proxyv2</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allowProxyIpList": "127.0.0.1/32",
  "enabled": false
}
</pre>
</div>
			</td>
			<td>EXPERIMENTAL => This feature is untested and / or unstable. Enable / Disable usage of proxyv2 protocol. WARNING: You should apply a custom NetworkPolicy to avoid spoofing, when using this feature! more details: https://kb.isc.org/docs/proxyv2-support-in-bind-9 <= EXPERIMENTAL</td>
		</tr>
		<tr>
			<td id="proxyv2--allowProxyIpList"><a href="./values.yaml#L127">proxyv2.allowProxyIpList</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"127.0.0.1/32"
</pre>
</div>
			</td>
			<td>List of addresses / networks which are allowed to send PROXYv2 headers. (Separator: ";") Provide your cluster ingress ips / range.</td>
		</tr>
		<tr>
			<td id="readinessProbe"><a href="./values.yaml#L209">readinessProbe</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "initialDelaySeconds": 5,
  "periodSeconds": 10,
  "tcpSocket": {
    "port": 5353
  }
}
</pre>
</div>
			</td>
			<td>This is to setup the readiness probe. By default, we're using the tcpSocket to provide the readiness state. More information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/</td>
		</tr>
		<tr>
			<td id="replicaCount"><a href="./values.yaml#L7">replicaCount</a></td>
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
			<td>This will set the replicaset count more information can be found here: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/ (Only replicaCount 1 supported)</td>
		</tr>
		<tr>
			<td id="resources"><a href="./values.yaml#L185">resources</a></td>
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
			<td>Specify default resources for the</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L96">runtimeClass</a></td>
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

</details>
</td>
		</tr>
		<tr>
			<td id="runtimeClass--jobs"><a href="./values.yaml#L100">runtimeClass.jobs</a></td>
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
			<td id="runtimeClass--pods"><a href="./values.yaml#L98">runtimeClass.pods</a></td>
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
			<td id="runtimeClass--tests"><a href="./values.yaml#L102">runtimeClass.tests</a></td>
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
			<td id="securityContext"><a href="./values.yaml#L70">securityContext</a></td>
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
			<td id="service"><a href="./values.yaml#L10">service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "externalTrafficPolicy": "Cluster",
  "port": 5353,
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>This is for setting up a service more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/</td>
		</tr>
		<tr>
			<td id="serviceAccount"><a href="./values.yaml#L44">serviceAccount</a></td>
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
			<td id="statisticsChannels"><a href="./values.yaml#L17">statisticsChannels</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "externalTrafficPolicy": "Cluster",
  "port": 8053,
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>The statistics channel provides a XML and JSON (/json) HTTP endpoint to monitor bind. It is not protected. Use a reverse-proxy with basic-auth and ssl, if you want to expose it externally.</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L238">tolerations</a></td>
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
			<td id="volumeMounts"><a href="./values.yaml#L231">volumeMounts</a></td>
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
			<td id="volumes"><a href="./values.yaml#L224">volumes</a></td>
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
		<tr>
			<td id="zone"><a href="./values.yaml#L150">zone</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "name": "myzone.sample-chart.example.com",
  "providerPrimaryNameservers": [
    "a.sample-chart.example.com",
    "b.sample-chart.example.com",
    "c.sample-chart.example.com"
  ],
  "soa": {
    "hostmasterMail": "hostmaster.example.com",
    "nsHostname": "ns1"
  },
  "spfTxtRecordValue": "v=spf1 -all"
}
</pre>
</div>
			</td>
			<td>Zone details Provide your zone details to configure the nameserver to match our needs.

<details>
<summary> Object param description (Expand)</summary>

```
zone:
  name: Name of the zone that this bind deployment is authorative hidden primary
  soa:
    nsHostname: nameserver hostname for soa record... just use whatever you like, it does not need to be resolvable.
    hostmasterMail: The mail that you like to publish withn the soa record. replace the @-sign by a dot, like: hostmaster@example.com -> hostmaster.example.com
  spfTxtRecordValue: We set the SPF record to disallow all servers sending mails with this domain. You could overwirte it as you wish.
  providerPrimaryNameservers: Provide a list of nameservers that are resposible for the zone. These are typically the providers primary nameservers.
    - ns1.provider.tld
    - ns2.provider.tld
```

</details>
</td>
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
