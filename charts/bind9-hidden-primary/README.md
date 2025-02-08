# bind9-hidden-primary

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 9.21](https://img.shields.io/badge/AppVersion-9.21-informational?style=flat-square)

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

<table>
	<thead>
		<th>Key</th>
		<th>Type</th>
		<th>Default</th>
		<th>Description</th>
	</thead>
	<tbody>
		<tr>
			<td>affinity</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>autoscaling</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": false,
  "maxReplicas": 100,
  "minReplicas": 1,
  "targetCPUUtilizationPercentage": 80
}
</pre>
</td>
			<td>This section is for setting up autoscaling more information can be found here: https://kubernetes.io/docs/concepts/workloads/autoscaling/</td>
		</tr>
		<tr>
			<td>env</td>
			<td>object</td>
			<td><pre lang="json">
{
  "tsigHmacFunc": "HMAC-SHA512",
  "tsigKeyname": "rndc-allow-transfer-tsigkey"
}
</pre>
</td>
			<td>This configures the TSIG Key HMAC algo and Key Name which will be used within the configuration of bind9. Usually, you won't need to change these defaults. General details about the TSIG implementation could be found at: https://www.isc.org/docs/2021-bind-mgmt-05-webinar.pdf</td>
		</tr>
		<tr>
			<td>existingConfigMap</td>
			<td>object</td>
			<td><pre lang="json">
{
  "includes": "",
  "named": "",
  "run": "",
  "zonedbs": ""
}
</pre>
</td>
			<td>Provide your own includes.d/, named.conf and/or entrypoint configMap to override chart-included configurations.</td>
		</tr>
		<tr>
			<td>fullnameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>image</td>
			<td>object</td>
			<td><pre lang="json">
{
  "pullPolicy": "IfNotPresent",
  "repository": "internetsystemsconsortium/bind9",
  "tag": ""
}
</pre>
</td>
			<td>This sets the container image more information can be found here: https://kubernetes.io/docs/concepts/containers/images/ Override the image tag, whose default is the chart appVersion.</td>
		</tr>
		<tr>
			<td>imagePullSecrets</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>This is for the secrets for pulling an image from a private repository more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/</td>
		</tr>
		<tr>
			<td>jobImage</td>
			<td>object</td>
			<td><pre lang="json">
{
  "repository": "ghcr.io/codeadminde/bind9-kubectl",
  "tag": "latest"
}
</pre>
</td>
			<td>This sets the job container image to use. The image needs kubectl and bind9 already present in order to fullfill it's job and to be used with a restricted namespace policy.</td>
		</tr>
		<tr>
			<td>kind</td>
			<td>string</td>
			<td><pre lang="json">
"DaemonSet"
</pre>
</td>
			<td>This will set the kind of deployment Use "Deployment" to deploy as ReplicaSet or use DaemonSet to deploy as DaemonSet.</td>
		</tr>
		<tr>
			<td>livenessProbe</td>
			<td>object</td>
			<td><pre lang="json">
{
  "initialDelaySeconds": 5,
  "periodSeconds": 10,
  "tcpSocket": {
    "port": 5353
  }
}
</pre>
</td>
			<td>This is to setup the liveness probe. By default, we're using the tcpSocket to provide the liveness state. More information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/</td>
		</tr>
		<tr>
			<td>nameOverride</td>
			<td>string</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>This is to override the chart name.</td>
		</tr>
		<tr>
			<td>nodeSelector</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>persistence</td>
			<td>object</td>
			<td><pre lang="json">
{
  "accessModes": [
    "ReadWriteMany"
  ],
  "cacheDirSizeLimit": "500Mi",
  "emptyDirSizeLimit": "500Mi",
  "enabled": true,
  "size": "1Gi",
  "storageClass": "longhorn"
}
</pre>
</td>
			<td>This configures the persistens of your release. The bind9 service uses persistent storage to save it's current zone database and to ensure all running containers does share the same details. See values.yaml for a detailed sample.</td>
		</tr>
		<tr>
			<td>podAnnotations</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>This is for setting Kubernetes Annotations to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/</td>
		</tr>
		<tr>
			<td>podLabels</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>This is for setting Kubernetes Labels to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/</td>
		</tr>
		<tr>
			<td>podSecurityContext</td>
			<td>object</td>
			<td><pre lang="json">
{
  "fsGroup": 1000
}
</pre>
</td>
			<td>This is for the pod-level security attributes and common container settings. More information: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/</td>
		</tr>
		<tr>
			<td>providerPrimaryIpList</td>
			<td>string</td>
			<td><pre lang="json">
"127.0.0.1"
</pre>
</td>
			<td>List of upstream dns servers that are allowed to query the hidden primary (AXFR requests) and getting notified (Separator: ";") Provide your providers upstream IP and/or IPs.</td>
		</tr>
		<tr>
			<td>readinessProbe</td>
			<td>object</td>
			<td><pre lang="json">
{
  "initialDelaySeconds": 5,
  "periodSeconds": 10,
  "tcpSocket": {
    "port": 5353
  }
}
</pre>
</td>
			<td>This is to setup the readiness probe. By default, we're using the tcpSocket to provide the readiness state. More information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/</td>
		</tr>
		<tr>
			<td>replicaCount</td>
			<td>int</td>
			<td><pre lang="json">
1
</pre>
</td>
			<td>This will set the replicaset count more information can be found here: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/ (Only used when kind: Deployment)</td>
		</tr>
		<tr>
			<td>resources</td>
			<td>object</td>
			<td><pre lang="json">
{}
</pre>
</td>
			<td>Specify default resources for the</td>
		</tr>
		<tr>
			<td>runtimeClass</td>
			<td>object</td>
			<td><pre lang="json">
{
  "jobs": "",
  "pods": ""
}
</pre>
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
			<td>runtimeClass.jobs</td>
			<td>string/runtimeClassName</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Sets the runtimeClass for the pods for the job execution. Takes the runtimeClass name, or "" (default).</td>
		</tr>
		<tr>
			<td>runtimeClass.pods</td>
			<td>string/runtimeClassName</td>
			<td><pre lang="json">
""
</pre>
</td>
			<td>Sets the runtimeClass for the DaemonSet / ReplicaSet pods. Takes the runtimeClass name, or "" (default).</td>
		</tr>
		<tr>
			<td>securityContext</td>
			<td>object</td>
			<td><pre lang="json">
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
</td>
			<td>This is for the scurityContext at container level. Note that container settings do not affect the Pod's Volumes. More information: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/#set-the-security-context-for-a-container</td>
		</tr>
		<tr>
			<td>service</td>
			<td>object</td>
			<td><pre lang="json">
{
  "externalTrafficPolicy": "Local",
  "port": 5353,
  "type": "LoadBalancer"
}
</pre>
</td>
			<td>This is for setting up a service more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/</td>
		</tr>
		<tr>
			<td>service.externalTrafficPolicy</td>
			<td>string</td>
			<td><pre lang="json">
"Local"
</pre>
</td>
			<td>Set the externalTrafficPolicy to Local or Cluster. I recommmend to use Local in combination with kind: DaemonSet to get the real client-ip (as long as you won't have any other measures in place to get the real client-ip)</td>
		</tr>
		<tr>
			<td>service.port</td>
			<td>int</td>
			<td><pre lang="json">
5353
</pre>
</td>
			<td>This sets the ports more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#field-spec-ports</td>
		</tr>
		<tr>
			<td>service.type</td>
			<td>string</td>
			<td><pre lang="json">
"LoadBalancer"
</pre>
</td>
			<td>This sets the service type more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types</td>
		</tr>
		<tr>
			<td>serviceAccount</td>
			<td>object</td>
			<td><pre lang="json">
{
  "annotations": {},
  "automount": true,
  "create": true,
  "name": ""
}
</pre>
</td>
			<td>This section builds out the service account more information can be found here: https://kubernetes.io/docs/concepts/security/service-accounts/</td>
		</tr>
		<tr>
			<td>statisticsChannels</td>
			<td>object</td>
			<td><pre lang="json">
{
  "enabled": false,
  "externalTrafficPolicy": "Local",
  "port": 8053,
  "type": "ClusterIP"
}
</pre>
</td>
			<td>The statistics channel provides a XML and JSON (/json) HTTP endpoint to monitor bind. It is not protected. Use a reverse-proxy with basic-auth and ssl, if you want to expose it externally.</td>
		</tr>
		<tr>
			<td>tolerations</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td></td>
		</tr>
		<tr>
			<td>volumeMounts</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Additional volumeMounts on the output Deployment definition.</td>
		</tr>
		<tr>
			<td>volumes</td>
			<td>list</td>
			<td><pre lang="json">
[]
</pre>
</td>
			<td>Additional volumes on the output Deployment definition.</td>
		</tr>
		<tr>
			<td>zone</td>
			<td>object</td>
			<td><pre lang="json">
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

## Feedback & Security

Please reach out to me at frederic.roggon@codeadmin.de for feedback.

If you find security-related issues, please do not use the issue tracker instead, contact me via email.

----------------------------------------------
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
