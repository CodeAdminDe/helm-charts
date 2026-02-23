

# kasm-ws

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.18.1](https://img.shields.io/badge/AppVersion-1.18.1-informational?style=flat-square)
A Helm chart for an easier Kasm Workspaces (https://kasm.com) deployment on Kubernetes. Please note that this is a private helm chart and not directly or indirectly affiliated with Kasm Technologies, Inc. or its authors.
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
helm install kasm-ws codeadminde/kasm-ws
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

To install the chart with the release name `kasm-ws`

```bash
helm install kasm-ws codeadminde/kasm-ws
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._
## Uninstallation

To uninstall the chart release named `kasm-ws`

```bash
helm uninstall kasm-ws
```
_**Note**: If you want to specify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforehand._

The command removes all the Kubernetes components associated with the chart **including persistent volumes** and deletes the release.
## Configuration

Take a look at the [values.yaml](./values.yaml) file of the chart. It contains the default configuration and additional notes.
So it would be a good idea to take a look at it, even if you already know what you would like to accomplish.

To configure the release (chart values), provide your own values via a *.yaml file and reference it with the `-f` flag.

> ### Install sample
>
> ```bash
> helm install kasm-ws codeadminde/kasm-ws -f values.yaml
> ```

Alternatively, you can provide the values you want to override directly at the CLI as key=value pairs via the `--set` flag.

> ### Override sample
>
> ```bash
> helm install kasm-ws --set key=value --set keyTwo=secondValue codeadminde/kasm-ws
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
			<td id="affinity"><a href="./values.yaml#L436">affinity</a></td>
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
			<td>Configure node affinity settings for Kasm pods - [Kubernetes Affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/). Kasm is not guaranteed to work with Affinity settings - use caution if you must configuring these settings. The below, optional object passes in raw Affinity rules for Pods, Nodes, etc. for your environment. Make sure you use the correct values below as this Helm chart will not do any error checking for you. </td>
		</tr>
		<tr>
			<td id="annotations--certSecret"><a href="./values.yaml#L608">annotations.certSecret</a></td>
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
			<td>Additional certSecret annotations to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="annotations--configMap"><a href="./values.yaml#L610">annotations.configMap</a></td>
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
			<td>Additional configMap annotations to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="annotations--cron"><a href="./values.yaml#L612">annotations.cron</a></td>
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
			<td>Additional cron pod cron labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="annotations--cronPod"><a href="./values.yaml#L614">annotations.cronPod</a></td>
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
			<td id="annotations--deployment"><a href="./values.yaml#L616">annotations.deployment</a></td>
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
			<td>Additional deployment annotations to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="annotations--pod"><a href="./values.yaml#L618">annotations.pod</a></td>
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
			<td>Additional pod annotations to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="annotations--pvc"><a href="./values.yaml#L620">annotations.pvc</a></td>
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
			<td>Additional PersistentVolumeClaim annotations to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="annotations--secret"><a href="./values.yaml#L624">annotations.secret</a></td>
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
			<td>Additional secret annotations to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="annotations--service"><a href="./values.yaml#L622">annotations.service</a></td>
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
			<td>Additional service annotations to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="annotations--statefulSet"><a href="./values.yaml#L626">annotations.statefulSet</a></td>
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
			<td>Additional statefulSet annotations to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="applyHealthChecks"><a href="./values.yaml#L575">applyHealthChecks</a></td>
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
			<td>Add Pod/Container healthchecks settings for Kasm resources </td>
		</tr>
		<tr>
			<td id="applySecurity"><a href="./values.yaml#L571">applySecurity</a></td>
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
			<td>Apply Pod/Container security settings for Kasm resources </td>
		</tr>
		<tr>
			<td id="certificate--certManager"><a href="./values.yaml#L132">certificate.certManager</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "addWildCard": true,
  "annotations": {},
  "enabled": false,
  "issuerGroup": "",
  "issuerKind": "",
  "issuerName": "",
  "labels": {}
}
</pre>
</div>
			</td>
			<td>For additional cert-manager configuration/deployment information refer to the online documentation [Cert Manager Docs](https://cert-manager.io/v1.1-docs/installation/kubernetes/).  NOTE: If you do not enable `cert-manager`, you must generate your own certificates and add them as a Kubernetes secret, or present cloud-managed certificates.  Refer to [Kubernetes Secrets](https://kubernetes.io/docs/concepts/configuration/secret/), and [Kubernetes TLS Secret](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_secret_tls/) for more information. </td>
		</tr>
		<tr>
			<td id="certificate--secretName"><a href="./values.yaml#L121">certificate.secretName</a></td>
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
			<td>Set the secret name where the certificate is stored. This secret name will store a certificate created by `cert-manager` if you set `cert-manager.enabled` to true </td>
		</tr>
		<tr>
			<td id="clusterDomain"><a href="./values.yaml#L423">clusterDomain</a></td>
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
			<td>Cluster-wide Kubernetes DNS domain name </td>
		</tr>
		<tr>
			<td id="cnps"><a href="./values.yaml#L491">cnps</a></td>
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
      "allow": true,
      "fromEntities": [],
      "matchLabels": {}
    }
  },
  "workspaceTraffic": {
    "egress": {
      "allow": true,
      "denyPrivateCidrs": true,
      "egressRules": [
        {
          "toEndpoints": [
            {
              "matchLabels": {
                "io.kubernetes.pod.namespace": "kube-system",
                "k8s-app": "kube-dns"
              }
            }
          ],
          "toPorts": [
            {
              "ports": [
                {
                  "port": "53",
                  "protocol": "UDP"
                },
                {
                  "port": "53",
                  "protocol": "TCP"
                }
              ],
              "rules": {
                "dns": [
                  {
                    "matchPattern": "*"
                  }
                ]
              }
            }
          ]
        },
        {
          "toEntities": [
            "world"
          ]
        }
      ],
      "privateCidrs": [
        "10.0.0.0/8",
        "172.16.0.0/12",
        "192.168.0.0/16",
        "127.0.0.0/8",
        "169.254.0.0/16",
        "100.64.0.0/10",
        "fc00::/7",
        "fe80::/10",
        "::1/128"
      ]
    },
    "enabled": false,
    "ingress": {
      "allowFromSameNamespace": true
    },
    "namespace": "",
    "podSelector": {
      "matchLabels": {}
    }
  }
}
</pre>
</div>
			</td>
			<td>Application-specific Cilium Network Policies configuration @description Requires CiliumNetworkPolicies library-chart. These settings are ignored if libchartCnps.enabled is false.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L507">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow egress traffic for Kasm core components.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--egressRules"><a href="./values.yaml#L510">cnps.appTraffic.egress.egressRules</a></td>
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
			<td>Egress rules applied when egress.allow is true. @description Customize to your security requirements.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L495">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress traffic to the proxy component policy.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEntities"><a href="./values.yaml#L503">cnps.appTraffic.ingress.fromEntities</a></td>
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
			<td>Optional entities to allow ingress from. @description Useful to allow additional ingress entities beyond the ingress controller labels.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--matchLabels"><a href="./values.yaml#L500">cnps.appTraffic.ingress.matchLabels</a></td>
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
			<td>Labels to match ingress controller pods. @description Override to match your ingress deployment.   app.kubernetes.io/name: ingress-nginx   io.kubernetes.pod.namespace: ingress-nginx</td>
		</tr>
		<tr>
			<td id="cnps--workspaceTraffic"><a href="./values.yaml#L520">cnps.workspaceTraffic</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "egress": {
    "allow": true,
    "denyPrivateCidrs": true,
    "egressRules": [
      {
        "toEndpoints": [
          {
            "matchLabels": {
              "io.kubernetes.pod.namespace": "kube-system",
              "k8s-app": "kube-dns"
            }
          }
        ],
        "toPorts": [
          {
            "ports": [
              {
                "port": "53",
                "protocol": "UDP"
              },
              {
                "port": "53",
                "protocol": "TCP"
              }
            ],
            "rules": {
              "dns": [
                {
                  "matchPattern": "*"
                }
              ]
            }
          }
        ]
      },
      {
        "toEntities": [
          "world"
        ]
      }
    ],
    "privateCidrs": [
      "10.0.0.0/8",
      "172.16.0.0/12",
      "192.168.0.0/16",
      "127.0.0.0/8",
      "169.254.0.0/16",
      "100.64.0.0/10",
      "fc00::/7",
      "fe80::/10",
      "::1/128"
    ]
  },
  "enabled": false,
  "ingress": {
    "allowFromSameNamespace": true
  },
  "namespace": "",
  "podSelector": {
    "matchLabels": {}
  }
}
</pre>
</div>
			</td>
			<td>Workspace session namespace traffic restrictions. @description Uses the libchart-cnps AppSet merge flow to build a dedicated policy in the workspace namespace. Requires libchartCnps.enabled=true.</td>
		</tr>
		<tr>
			<td id="cnps--workspaceTraffic--egress"><a href="./values.yaml#L535">cnps.workspaceTraffic.egress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allow": true,
  "denyPrivateCidrs": true,
  "egressRules": [
    {
      "toEndpoints": [
        {
          "matchLabels": {
            "io.kubernetes.pod.namespace": "kube-system",
            "k8s-app": "kube-dns"
          }
        }
      ],
      "toPorts": [
        {
          "ports": [
            {
              "port": "53",
              "protocol": "UDP"
            },
            {
              "port": "53",
              "protocol": "TCP"
            }
          ],
          "rules": {
            "dns": [
              {
                "matchPattern": "*"
              }
            ]
          }
        }
      ]
    },
    {
      "toEntities": [
        "world"
      ]
    }
  ],
  "privateCidrs": [
    "10.0.0.0/8",
    "172.16.0.0/12",
    "192.168.0.0/16",
    "127.0.0.0/8",
    "169.254.0.0/16",
    "100.64.0.0/10",
    "fc00::/7",
    "fe80::/10",
    "::1/128"
  ]
}
</pre>
</div>
			</td>
			<td>Egress handling for workspace pods.</td>
		</tr>
		<tr>
			<td id="cnps--workspaceTraffic--egress--allow"><a href="./values.yaml#L537">cnps.workspaceTraffic.egress.allow</a></td>
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
			<td>Enable egress rule rendering.</td>
		</tr>
		<tr>
			<td id="cnps--workspaceTraffic--egress--denyPrivateCidrs"><a href="./values.yaml#L556">cnps.workspaceTraffic.egress.denyPrivateCidrs</a></td>
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
			<td>Deny private network egress from workspace pods.</td>
		</tr>
		<tr>
			<td id="cnps--workspaceTraffic--egress--egressRules"><a href="./values.yaml#L539">cnps.workspaceTraffic.egress.egressRules</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "toEndpoints": [
      {
        "matchLabels": {
          "io.kubernetes.pod.namespace": "kube-system",
          "k8s-app": "kube-dns"
        }
      }
    ],
    "toPorts": [
      {
        "ports": [
          {
            "port": "53",
            "protocol": "UDP"
          },
          {
            "port": "53",
            "protocol": "TCP"
          }
        ],
        "rules": {
          "dns": [
            {
              "matchPattern": "*"
            }
          ]
        }
      }
    ]
  },
  {
    "toEntities": [
      "world"
    ]
  }
]
</pre>
</div>
			</td>
			<td>Default egress rules. Override as required for your environment.</td>
		</tr>
		<tr>
			<td id="cnps--workspaceTraffic--egress--privateCidrs"><a href="./values.yaml#L558">cnps.workspaceTraffic.egress.privateCidrs</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "10.0.0.0/8",
  "172.16.0.0/12",
  "192.168.0.0/16",
  "127.0.0.0/8",
  "169.254.0.0/16",
  "100.64.0.0/10",
  "fc00::/7",
  "fe80::/10",
  "::1/128"
]
</pre>
</div>
			</td>
			<td>Private CIDR ranges denied when denyPrivateCidrs is true.</td>
		</tr>
		<tr>
			<td id="cnps--workspaceTraffic--enabled"><a href="./values.yaml#L522">cnps.workspaceTraffic.enabled</a></td>
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
			<td>Enable workspace egress restriction policy generation.</td>
		</tr>
		<tr>
			<td id="cnps--workspaceTraffic--ingress"><a href="./values.yaml#L530">cnps.workspaceTraffic.ingress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allowFromSameNamespace": true
}
</pre>
</div>
			</td>
			<td>Ingress handling for workspace pods.</td>
		</tr>
		<tr>
			<td id="cnps--workspaceTraffic--ingress--allowFromSameNamespace"><a href="./values.yaml#L533">cnps.workspaceTraffic.ingress.allowFromSameNamespace</a></td>
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
			<td>Allow ingress traffic only from pods in the same workspace namespace. @description Set false to rely on other policies for ingress control.</td>
		</tr>
		<tr>
			<td id="cnps--workspaceTraffic--namespace"><a href="./values.yaml#L524">cnps.workspaceTraffic.namespace</a></td>
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
			<td>Namespace where Kasm session/workspace pods run.</td>
		</tr>
		<tr>
			<td id="cnps--workspaceTraffic--podSelector"><a href="./values.yaml#L527">cnps.workspaceTraffic.podSelector</a></td>
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
			<td>Endpoint selector for workspace session pods. @description Keep empty matchLabels to select all pods in the dedicated workspace namespace.</td>
		</tr>
		<tr>
			<td id="components--api--annotations"><a href="./values.yaml#L308">components.api.annotations</a></td>
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
			<td>Custom annotations to add to the Kasm api Deployment</td>
		</tr>
		<tr>
			<td id="components--api--image"><a href="./values.yaml#L304">components.api.image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "repository": "kasmweb/api",
  "tag": "1.18.1"
}
</pre>
</div>
			</td>
			<td>Configure the image repository where the image is stored. Use this to point to an private hosted container registry instead of our public DockerHub hosted one. </td>
		</tr>
		<tr>
			<td id="components--api--labels"><a href="./values.yaml#L312">components.api.labels</a></td>
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
			<td>Custom labels to add to the Kasm api Deployment</td>
		</tr>
		<tr>
			<td id="components--api--resources"><a href="./values.yaml#L310">components.api.resources</a></td>
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
			<td>Manually configure the Kasm api Deployment resources. This overrides the pre-defined `deploymentSize` values.</td>
		</tr>
		<tr>
			<td id="components--guac--annotations"><a href="./values.yaml#L342">components.guac.annotations</a></td>
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
			<td>Custom annotations to add to the Kasm Guac Deployment</td>
		</tr>
		<tr>
			<td id="components--guac--enabled"><a href="./values.yaml#L340">components.guac.enabled</a></td>
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
			<td>Use this setting to enable/disable deployment of the Kasm Guacamole web RDP service - [Kasm Guac Service](https://docs.kasm.com/docs/guide/connection_proxies#guacamole-guac). </td>
		</tr>
		<tr>
			<td id="components--guac--image"><a href="./values.yaml#L334">components.guac.image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "repository": "kasmweb/kasm-guac",
  "tag": "1.18.1"
}
</pre>
</div>
			</td>
			<td>Configure the image repository where the image is stored. Use this to point to an private hosted container registry instead of our public DockerHub hosted one. </td>
		</tr>
		<tr>
			<td id="components--guac--labels"><a href="./values.yaml#L346">components.guac.labels</a></td>
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
			<td>Custom labels to add to the Kasm Guac Deployment</td>
		</tr>
		<tr>
			<td id="components--guac--resources"><a href="./values.yaml#L344">components.guac.resources</a></td>
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
			<td>Manually configure the Kasm Guac Deployment resources. This overrides the pre-defined `deploymentSize` values.</td>
		</tr>
		<tr>
			<td id="components--manager--annotations"><a href="./values.yaml#L323">components.manager.annotations</a></td>
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
			<td>Custom annotations to add to the Kasm Manager Deployment</td>
		</tr>
		<tr>
			<td id="components--manager--image"><a href="./values.yaml#L319">components.manager.image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "repository": "kasmweb/manager",
  "tag": "1.18.1"
}
</pre>
</div>
			</td>
			<td>Configure the image repository where the image is stored. Use this to point to an private hosted container registry instead of our public DockerHub hosted one. </td>
		</tr>
		<tr>
			<td id="components--manager--labels"><a href="./values.yaml#L327">components.manager.labels</a></td>
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
			<td>Custom labels to add to the Kasm Manager Deployment</td>
		</tr>
		<tr>
			<td id="components--manager--resources"><a href="./values.yaml#L325">components.manager.resources</a></td>
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
			<td>Manually configure the Kasm Manager Deployment resources. This overrides the pre-defined `deploymentSize` values.</td>
		</tr>
		<tr>
			<td id="components--proxy--annotations"><a href="./values.yaml#L293">components.proxy.annotations</a></td>
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
			<td>Custom annotations to add to the Kasm Proxy Deployment</td>
		</tr>
		<tr>
			<td id="components--proxy--image"><a href="./values.yaml#L289">components.proxy.image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "repository": "kasmweb/proxy",
  "tag": "1.18.1"
}
</pre>
</div>
			</td>
			<td>Configure the image repository where the image is stored. Use this to point to an private hosted container registry instead of our public DockerHub hosted one. </td>
		</tr>
		<tr>
			<td id="components--proxy--labels"><a href="./values.yaml#L297">components.proxy.labels</a></td>
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
			<td>Custom labels to add to the Kasm Proxy Deployment</td>
		</tr>
		<tr>
			<td id="components--proxy--resources"><a href="./values.yaml#L295">components.proxy.resources</a></td>
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
			<td>Manually configure the Kasm Proxy Deployment resources. This overrides the pre-defined `deploymentSize` values.</td>
		</tr>
		<tr>
			<td id="components--rdpGateway--annotations"><a href="./values.yaml#L361">components.rdpGateway.annotations</a></td>
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
			<td>Custom annotations to add to the Kasm RDP Gateway Deployment</td>
		</tr>
		<tr>
			<td id="components--rdpGateway--enabled"><a href="./values.yaml#L359">components.rdpGateway.enabled</a></td>
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
			<td>Use this setting to enable/disable deployment of the Kasm RDP Gateway service - [Kasm RDP Gateway](https://docs.kasm.com/docs/guide/connection_proxies#rdp-gateway). </td>
		</tr>
		<tr>
			<td id="components--rdpGateway--image"><a href="./values.yaml#L353">components.rdpGateway.image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "repository": "kasmweb/rdp-gateway",
  "tag": "1.18.1"
}
</pre>
</div>
			</td>
			<td>Configure the image repository where the image is stored. Use this to point to an private hosted container registry instead of our public DockerHub hosted one. </td>
		</tr>
		<tr>
			<td id="components--rdpGateway--labels"><a href="./values.yaml#L365">components.rdpGateway.labels</a></td>
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
			<td>Custom labels to add to the Kasm RDP Gateway Deployment</td>
		</tr>
		<tr>
			<td id="components--rdpGateway--resources"><a href="./values.yaml#L363">components.rdpGateway.resources</a></td>
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
			<td>Manually configure the Kasm RDP Gateway Deployment resources. This overrides the pre-defined `deploymentSize` values.</td>
		</tr>
		<tr>
			<td id="components--rdpHttpsGateway--annotations"><a href="./values.yaml#L381">components.rdpHttpsGateway.annotations</a></td>
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
			<td>Custom annotations to add to the Kasm RDP HTTPS Gateway Deployment</td>
		</tr>
		<tr>
			<td id="components--rdpHttpsGateway--enabled"><a href="./values.yaml#L379">components.rdpHttpsGateway.enabled</a></td>
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
			<td>Use this setting to enable/disable deployment of the Kasm RDP HTTPS Gateway service. This service allows users to use native RDP clients via HTTPS connections rather than exposing 3389 - [Kasm RDP HTTPS Gateway](https://docs.kasm.com/docs/guide/connection_proxies#rdp-https-gateway). </td>
		</tr>
		<tr>
			<td id="components--rdpHttpsGateway--image"><a href="./values.yaml#L372">components.rdpHttpsGateway.image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "repository": "kasmweb/rdp-https-gateway",
  "tag": "1.18.1"
}
</pre>
</div>
			</td>
			<td>Configure the image repository where the image is stored. Use this to point to an private hosted container registry instead of our public DockerHub hosted one. </td>
		</tr>
		<tr>
			<td id="components--rdpHttpsGateway--labels"><a href="./values.yaml#L385">components.rdpHttpsGateway.labels</a></td>
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
			<td>Custom labels to add to the Kasm RDP HTTPS Gateway Deployment</td>
		</tr>
		<tr>
			<td id="components--rdpHttpsGateway--resources"><a href="./values.yaml#L383">components.rdpHttpsGateway.resources</a></td>
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
			<td>Manually configure the Kasm RDP HTTPS Gateway Deployment resources. This overrides the pre-defined `deploymentSize` values.</td>
		</tr>
		<tr>
			<td id="database--annotations"><a href="./values.yaml#L223">database.annotations</a></td>
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
			<td>Custom annotations to add to the Kasm DB StatefulSet</td>
		</tr>
		<tr>
			<td id="database--hostname"><a href="./values.yaml#L152">database.hostname</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kasm-db"
</pre>
</div>
			</td>
			<td>The hostname used to connect to the database server. If you use the Kasm DB StatefulSet this will be the name of the DB service, if you use an external DB, you need to replace this value with the hostname or IP or your DB server. </td>
		</tr>
		<tr>
			<td id="database--image"><a href="./values.yaml#L203">database.image</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "repository": "kasmweb/postgres",
  "tag": "1.18.1"
}
</pre>
</div>
			</td>
			<td>Configure the image repository where the image is stored. Use this to point to an private hosted container registry instead of our public DockerHub hosted one. </td>
		</tr>
		<tr>
			<td id="database--kasmDbName"><a href="./values.yaml#L158">database.kasmDbName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kasm"
</pre>
</div>
			</td>
			<td>The name of the database where Kasm is to be initialized and that Kasm services are to connect </td>
		</tr>
		<tr>
			<td id="database--kasmDbSecret"><a href="./values.yaml#L168">database.kasmDbSecret</a></td>
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
			<td id="database--kasmDbUser"><a href="./values.yaml#L161">database.kasmDbUser</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kasmapp"
</pre>
</div>
			</td>
			<td>The name of the Kasm database User with READ/WRITE permission to the Kasm database </td>
		</tr>
		<tr>
			<td id="database--labels"><a href="./values.yaml#L227">database.labels</a></td>
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
			<td>Custom labels to add to the Kasm DB StatefulSet</td>
		</tr>
		<tr>
			<td id="database--port"><a href="./values.yaml#L155">database.port</a></td>
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
			<td>The port Kasm will use to connect to the PostgreSQL DB server </td>
		</tr>
		<tr>
			<td id="database--postgresMasterUser"><a href="./values.yaml#L193">database.postgresMasterUser</a></td>
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
			<td>An object defining the PostgreSQL DB Master user and the Kubernetes secret and key values for the Master DB password. These credentials are only used by the `db-init-job` to create the `kasmDbName` database, the `kasmDbUser` user account, set permissions for the user account, and initialize and pre-seed the Kasm Database. </td>
		</tr>
		<tr>
			<td id="database--resources"><a href="./values.yaml#L225">database.resources</a></td>
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
			<td>Manually configure the Kasm DB StatefulSet resources. This overrides the pre-defined `deploymentSize` values.</td>
		</tr>
		<tr>
			<td id="database--standalone"><a href="./values.yaml#L148">database.standalone</a></td>
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
			<td>Setting standalone to true will prevent the deployment of the Kasm DB StatefulSet and requires the user to have a self-hosted PostgreSQL Database v14 server already setup and awaiting connections. Use the below database configuration values to connect to your external DB. </td>
		</tr>
		<tr>
			<td id="database--storage--pvcSize"><a href="./values.yaml#L216">database.storage.pvcSize</a></td>
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
			<td>Set the size of the PVC to attach to your Kubernetes-hosted Database server. The default size is 8Gi. Just supply the integer value of the PVC size in GB you wish to use. </td>
		</tr>
		<tr>
			<td id="database--storage--retentionPolicy"><a href="./values.yaml#L219">database.storage.retentionPolicy</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "whenDeleted": "Delete",
  "whenScaled": "Delete"
}
</pre>
</div>
			</td>
			<td>Configure how the DB volume should be retained or deleted throughout the DB's lifecycle </td>
		</tr>
		<tr>
			<td id="database--storage--storageClassName"><a href="./values.yaml#L212">database.storage.storageClassName</a></td>
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
			<td>Set the storage class to attach to the DB for storage. NOTE: Leaving this blank will use the cluster-default storage class. </td>
		</tr>
		<tr>
			<td id="database--useCnpgCluster"><a href="./values.yaml#L179">database.useCnpgCluster</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "appConnectionSecretName": "",
  "clusterName": "cnpg-cluster",
  "enabled": false,
  "port": 5432,
  "secretKeys": {
    "database": "dbname",
    "password": "password",
    "username": "username"
  }
}
</pre>
</div>
			</td>
			<td>Configure usage of an existing in-namespace CNPG Cluster. @description Enables consumption of an already deployed CloudNativePG cluster without deploying the in-chart DB StatefulSet. Notes:  * Requires an existing CNPG cluster in the same namespace.  * App secret name defaults to `<clusterName>-app` when appConnectionSecretName is empty.  * If database.kasmDbSecret is set, it takes precedence over CNPG app secret for DB password lookups.</td>
		</tr>
		<tr>
			<td id="dbManagement--backupCron--enabled"><a href="./values.yaml#L259">dbManagement.backupCron.enabled</a></td>
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
			<td>Set to true to enable automatic Kasm DB backups </td>
		</tr>
		<tr>
			<td id="dbManagement--backupCron--pvcName"><a href="./values.yaml#L262">dbManagement.backupCron.pvcName</a></td>
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
			<td>The name of the Persistent Volume Claim to use for DB Backups </td>
		</tr>
		<tr>
			<td id="dbManagement--backupCron--pvcSize"><a href="./values.yaml#L278">dbManagement.backupCron.pvcSize</a></td>
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
			<td>Set the size of the PVC to attach to your Kubernetes-hosted Database backup job. The default size is 5Gi. Just supply the integer value of the PVC size in GB you wish to use. </td>
		</tr>
		<tr>
			<td id="dbManagement--backupCron--schedule"><a href="./values.yaml#L267">dbManagement.backupCron.schedule</a></td>
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
			<td>Use a cron-style syntax to schedule how often the backup cron job runs. The default value will run a backup every 24 hours at midnight UTC. Refer to the [Kubernetes CronJob](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/) documentation for more information. </td>
		</tr>
		<tr>
			<td id="dbManagement--backupCron--storageClass"><a href="./values.yaml#L274">dbManagement.backupCron.storageClass</a></td>
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
			<td>The `storageClassName` to attach the DB backup job for storage of regular DB backups. Leave the value empty to use your default Kubernetes storageClass </td>
		</tr>
		<tr>
			<td id="dbManagement--backupCron--timeZone"><a href="./values.yaml#L270">dbManagement.backupCron.timeZone</a></td>
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
			<td>The time zone to use for the backup cron job. The default is UTC. </td>
		</tr>
		<tr>
			<td id="dbManagement--initialize"><a href="./values.yaml#L234">dbManagement.initialize</a></td>
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
			<td>Initialize the DB. This is required for an initial deployment of Kasm to configure the DB for Kasm usage </td>
		</tr>
		<tr>
			<td id="dbManagement--upgrade--enable"><a href="./values.yaml#L243">dbManagement.upgrade.enable</a></td>
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
			<td id="dbManagement--upgrade--oldDbBackupFileName"><a href="./values.yaml#L252">dbManagement.upgrade.oldDbBackupFileName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kasm_dump.tar"
</pre>
</div>
			</td>
			<td>The file name of the database backup to restore and upgrade. </td>
		</tr>
		<tr>
			<td id="dbManagement--upgrade--oldDbBackupPvc"><a href="./values.yaml#L249">dbManagement.upgrade.oldDbBackupPvc</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kasm-db-dump-pvc"
</pre>
</div>
			</td>
			<td>The PVC to connect to the Upgrade job that contains the DB backup tarball. </td>
		</tr>
		<tr>
			<td id="dbManagement--upgrade--oldDbSecretsName"><a href="./values.yaml#L246">dbManagement.upgrade.oldDbSecretsName</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"kasm-secrets"
</pre>
</div>
			</td>
			<td>The name of the Kubernetes secret where Kasm and DB passwords are stored. </td>
		</tr>
		<tr>
			<td id="deploymentSize"><a href="./values.yaml#L6">deploymentSize</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"small"
</pre>
</div>
			</td>
			<td>Define the estimated size of the Kasm deployment in expected session load.  small  = Up to 10-15 sessions  medium = Up to 25-30 sessions  large  = Up to 50+ sessions </td>
		</tr>
		<tr>
			<td id="extraLabels--certSecret"><a href="./values.yaml#L634">extraLabels.certSecret</a></td>
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
			<td>Additional certSecret labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraLabels--configMap"><a href="./values.yaml#L636">extraLabels.configMap</a></td>
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
			<td>Additional configMap labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraLabels--cron"><a href="./values.yaml#L650">extraLabels.cron</a></td>
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
			<td>Additional cron labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraLabels--cronPod"><a href="./values.yaml#L652">extraLabels.cronPod</a></td>
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
			<td>Additional cron Pod labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraLabels--deployment"><a href="./values.yaml#L638">extraLabels.deployment</a></td>
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
			<td>Additional deployment labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraLabels--job"><a href="./values.yaml#L646">extraLabels.job</a></td>
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
			<td>Additional job labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraLabels--jobPod"><a href="./values.yaml#L648">extraLabels.jobPod</a></td>
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
			<td>Additional job Pod labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraLabels--pod"><a href="./values.yaml#L640">extraLabels.pod</a></td>
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
			<td>Additional pod labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraLabels--pvc"><a href="./values.yaml#L654">extraLabels.pvc</a></td>
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
			<td>Additional PersistentVolumeClaim labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraLabels--secret"><a href="./values.yaml#L642">extraLabels.secret</a></td>
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
			<td>Additional secret labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraLabels--service"><a href="./values.yaml#L644">extraLabels.service</a></td>
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
			<td>Additional service labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraLabels--statefulSet"><a href="./values.yaml#L656">extraLabels.statefulSet</a></td>
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
			<td>Additional statefulSet labels to apply to resources created by this chart</td>
		</tr>
		<tr>
			<td id="extraObjects"><a href="./values.yaml#L661">extraObjects</a></td>
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
			<td>Deploy additional Kubernetes manifests. This field is expected to be either a multi-line string, a list of strings, or a list of objects. </td>
		</tr>
		<tr>
			<td id="imagePullPolicy"><a href="./values.yaml#L393">imagePullPolicy</a></td>
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
			<td>Configure global image pull policy </td>
		</tr>
		<tr>
			<td id="imagePullSecrets--annotations"><a href="./values.yaml#L419">imagePullSecrets.annotations</a></td>
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
			<td>Additional annotations for this secret</td>
		</tr>
		<tr>
			<td id="imagePullSecrets--email"><a href="./values.yaml#L415">imagePullSecrets.email</a></td>
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
			<td>The email address used to authenticate (optional, used for dockerconfigjson and dockercfg)</td>
		</tr>
		<tr>
			<td id="imagePullSecrets--enabled"><a href="./values.yaml#L399">imagePullSecrets.enabled</a></td>
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
			<td>Enable/disable image pull secrets</td>
		</tr>
		<tr>
			<td id="imagePullSecrets--labels"><a href="./values.yaml#L417">imagePullSecrets.labels</a></td>
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
			<td>Additional labels for this secret</td>
		</tr>
		<tr>
			<td id="imagePullSecrets--name"><a href="./values.yaml#L405">imagePullSecrets.name</a></td>
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
			<td>Secret name to use. If left blank, will be dynamically generated. To use an existing Image pull secret, or one you manually created, set `imagePullSecrets.enabled`, and provide the name of the Image Pull Secret you created, making sure to leave all other values below empty. </td>
		</tr>
		<tr>
			<td id="imagePullSecrets--password"><a href="./values.yaml#L413">imagePullSecrets.password</a></td>
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
			<td>The password used to authenticate against your Registry server.</td>
		</tr>
		<tr>
			<td id="imagePullSecrets--server"><a href="./values.yaml#L409">imagePullSecrets.server</a></td>
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
			<td>The Registry server to use when pulling images (required for dockerconfigjson and dockercfg)</td>
		</tr>
		<tr>
			<td id="imagePullSecrets--type"><a href="./values.yaml#L407">imagePullSecrets.type</a></td>
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
			<td>Type of image pull credential to create. Valid types are "dockerconfigjson", "dockercfg", or "basic"</td>
		</tr>
		<tr>
			<td id="imagePullSecrets--username"><a href="./values.yaml#L411">imagePullSecrets.username</a></td>
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
			<td>The username used to authenticate against your Registry server.</td>
		</tr>
		<tr>
			<td id="ingress--annotations"><a href="./values.yaml#L69">ingress.annotations</a></td>
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
			<td id="ingress--backendProtocol"><a href="./values.yaml#L62">ingress.backendProtocol</a></td>
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
			<td>The backend protocol to for the Ingress to communicate with the Kasm proxy service. Valid values: http or https </td>
		</tr>
		<tr>
			<td id="ingress--enabled"><a href="./values.yaml#L55">ingress.enabled</a></td>
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
			<td>Set the enabled value to `true` to use a pre-defined Ingress service to expose Kasm </td>
		</tr>
		<tr>
			<td id="ingress--ingressClassName"><a href="./values.yaml#L65">ingress.ingressClassName</a></td>
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
			<td>Define the ingress Class to use for your Kasm ingress </td>
		</tr>
		<tr>
			<td id="ingress--labels"><a href="./values.yaml#L82">ingress.labels</a></td>
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
			<td id="ingress--secureDefaults"><a href="./values.yaml#L72">ingress.secureDefaults</a></td>
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
  "proxySendTimeoutSeconds": 3600,
  "websocket": {
    "annotationKey": "nginx.org/websocket-services",
    "enabled": true
  }
}
</pre>
</div>
			</td>
			<td>Secure-by-default ingress annotation settings. @description Applied by default and merged with ingress.annotations (custom annotations win on key conflicts).</td>
		</tr>
		<tr>
			<td id="ingress--tls"><a href="./values.yaml#L58">ingress.tls</a></td>
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
			<td>Set tls value to `true` to eanble TLS configuration for the hostname defined at `publicAddr` parameter </td>
		</tr>
		<tr>
			<td id="kasmZones"><a href="./values.yaml#L30">kasmZones</a></td>
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
			<td>This is a list of objects defining different Kasm Zone configurations for your deployment. This configuration is typically used for multi-region, large, or custom deployments where the customer requires a high degree of configurability and has multiple resources in disparate areas.  NOTE: If you configure custom zones below, you MUST use a valid `ingress` configuration due to the increased deployment complexity of a multi-zone Kasm deployment. Refer to the Kasm [Deployment Zones](https://docs.kasm.com/docs/guide/deployment_zones) documentation for more information on Kasm Zones.  The first zone in the list is treated as the primary zone. Traffic to the configured `publicAddr` in the ingress rule will be routed to this primary zone. </td>
		</tr>
		<tr>
			<td id="labels"><a href="./values.yaml#L600">labels</a></td>
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
			<td>Custom labels to apply to all deployed resources </td>
		</tr>
		<tr>
			<td id="libchartCnps"><a href="./values.yaml#L482">libchartCnps</a></td>
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
			<td id="libchartCnps--enabled"><a href="./values.yaml#L484">libchartCnps.enabled</a></td>
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
			<td id="libchartCnps--includeCnpgPolicies"><a href="./values.yaml#L487">libchartCnps.includeCnpgPolicies</a></td>
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
			<td>Include CNPG-specific policies @description These are usually only required when using CNPG resources in the same namespace.</td>
		</tr>
		<tr>
			<td id="nodeSelector"><a href="./values.yaml#L428">nodeSelector</a></td>
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
			<td>Configure node selector settings for your Kasm pods - [Kubernetes Node Selector](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#nodeselector). </td>
		</tr>
		<tr>
			<td id="proxyService"><a href="./values.yaml#L45">proxyService</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "labels": {},
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>Configure the proxy service type. This chart is intentionally restricted to ClusterIP-only exposure.  The service.annotations defined here only apply to the `proxy` service. If you wish to apply annotations to all services, use the annotations.service value at the bottom of this chart.  NOTE: External exposure is expected to happen through ingress/route resources only. </td>
		</tr>
		<tr>
			<td id="publicAddr"><a href="./values.yaml#L16">publicAddr</a></td>
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
			<td>Set the access URL to be used for the Kasm deployment. This is the URL you will use to access your Kasm deployment. This URL can be a private address, it just needs to be resolvable by systems you use to interface with Kasm.  If you create a self-signed or custom certificate, this is the value you should assign as the Common Name associated with the certificate. If `certificate.certManager.enabled` is set to true, this is the name used to generate the certificate. </td>
		</tr>
		<tr>
			<td id="rbac"><a href="./values.yaml#L449">rbac</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "create": false,
  "namespace": "",
  "rules": [],
  "serviceAccount": {
    "annotations": {},
    "automountServiceAccountToken": true,
    "create": false,
    "name": ""
  }
}
</pre>
</div>
			</td>
			<td>Role-Based Access Control configuration for manager/session orchestration.</td>
		</tr>
		<tr>
			<td id="rbac--create"><a href="./values.yaml#L451">rbac.create</a></td>
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
			<td>Create namespace-scoped RBAC resources (Role + RoleBinding).</td>
		</tr>
		<tr>
			<td id="rbac--namespace"><a href="./values.yaml#L454">rbac.namespace</a></td>
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
			<td>Namespace where Role and RoleBinding should be created. @description Leave empty to use .Release.Namespace. Set this to your dedicated workspace/session namespace if manager must orchestrate pods there.</td>
		</tr>
		<tr>
			<td id="rbac--rules"><a href="./values.yaml#L469">rbac.rules</a></td>
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
			<td>Override Role rules. If empty, a least-privilege baseline is used.

<details>
<summary>Default baseline rules (Expand)</summary>

- apiGroups: [""]
  resources: ["pods", "services", "persistentvolumeclaims"]
  verbs: ["get", "list", "watch", "create", "delete"]
- apiGroups: [""]
  resources: ["pods/log", "pods/status"]
  verbs: ["get"]

</details></td>
		</tr>
		<tr>
			<td id="rbac--serviceAccount--annotations"><a href="./values.yaml#L477">rbac.serviceAccount.annotations</a></td>
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
			<td>ServiceAccount annotations (e.g., workload identity / IAM role bindings).</td>
		</tr>
		<tr>
			<td id="rbac--serviceAccount--automountServiceAccountToken"><a href="./values.yaml#L479">rbac.serviceAccount.automountServiceAccountToken</a></td>
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
			<td>Automatically mount ServiceAccount API credentials into manager pods.</td>
		</tr>
		<tr>
			<td id="rbac--serviceAccount--create"><a href="./values.yaml#L472">rbac.serviceAccount.create</a></td>
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
			<td>Create a dedicated ServiceAccount for manager workloads.</td>
		</tr>
		<tr>
			<td id="rbac--serviceAccount--name"><a href="./values.yaml#L475">rbac.serviceAccount.name</a></td>
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
			<td>Name of the ServiceAccount to use. @description If create=true and this is empty, defaults to "<release-name>-manager". If create=false, this should reference an existing ServiceAccount.</td>
		</tr>
		<tr>
			<td id="restartPolicy"><a href="./values.yaml#L596">restartPolicy</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"Always"
</pre>
</div>
			</td>
			<td>Configure global Pod restart policy for Kasm resources </td>
		</tr>
		<tr>
			<td id="route"><a href="./values.yaml#L86">route</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "enabled": false,
  "labels": {},
  "tls": {}
}
</pre>
</div>
			</td>
			<td>Configure an OpenShift Route for your Kasm deployment. </td>
		</tr>
		<tr>
			<td id="route--enabled"><a href="./values.yaml#L88">route.enabled</a></td>
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
			<td>Set the enabled value to `true` to use a pre-defined Route service to expose Kasm</td>
		</tr>
		<tr>
			<td id="route--tls"><a href="./values.yaml#L92">route.tls</a></td>
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
			<td>Object to define the TLS configuration for your OpenShift Route - [Configuring Secure Routes](https://docs.redhat.com/en/documentation/openshift_dedicated/4/html/networking/configuring-routes#configuring-default-certificate). </td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L440">runtimeClass</a></td>
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
			<td>Set a RuntimeClass to execute the containers with a custom runtime configuration. Register a runtimeClass within your cluster beforehand.</td>
		</tr>
		<tr>
			<td id="runtimeClass--jobs"><a href="./values.yaml#L444">runtimeClass.jobs</a></td>
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
			<td>Sets the runtimeClass for the pods for the job and cron execution. Takes the runtimeClass name, or "" (default).</td>
		</tr>
		<tr>
			<td id="runtimeClass--pods"><a href="./values.yaml#L442">runtimeClass.pods</a></td>
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
			<td id="runtimeClass--tests"><a href="./values.yaml#L446">runtimeClass.tests</a></td>
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
			<td id="securityCompatibility"><a href="./values.yaml#L579">securityCompatibility</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "rootInitContainers": {
    "db": false,
    "dbBackupCron": false,
    "guac": false,
    "proxy": false,
    "rdpGateway": false,
    "rdpHttpsGateway": false
  }
}
</pre>
</div>
			</td>
			<td>Backward-compatibility toggles for permission/bootstrap behavior. @description Enable specific root init containers only if your storage/runtime needs in-place ownership changes.</td>
		</tr>
		<tr>
			<td id="securityCompatibility--rootInitContainers--db"><a href="./values.yaml#L590">securityCompatibility.rootInitContainers.db</a></td>
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
			<td>Enable root permission init container for the Kasm DB StatefulSet.</td>
		</tr>
		<tr>
			<td id="securityCompatibility--rootInitContainers--dbBackupCron"><a href="./values.yaml#L592">securityCompatibility.rootInitContainers.dbBackupCron</a></td>
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
			<td>Enable root permission init container for the DB backup cron job.</td>
		</tr>
		<tr>
			<td id="securityCompatibility--rootInitContainers--guac"><a href="./values.yaml#L584">securityCompatibility.rootInitContainers.guac</a></td>
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
			<td>Enable root permission init container for the Kasm guac deployment.</td>
		</tr>
		<tr>
			<td id="securityCompatibility--rootInitContainers--proxy"><a href="./values.yaml#L582">securityCompatibility.rootInitContainers.proxy</a></td>
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
			<td>Enable root permission init container for the Kasm proxy deployment.</td>
		</tr>
		<tr>
			<td id="securityCompatibility--rootInitContainers--rdpGateway"><a href="./values.yaml#L586">securityCompatibility.rootInitContainers.rdpGateway</a></td>
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
			<td>Enable root permission init container for the Kasm RDP gateway deployment.</td>
		</tr>
		<tr>
			<td id="securityCompatibility--rootInitContainers--rdpHttpsGateway"><a href="./values.yaml#L588">securityCompatibility.rootInitContainers.rdpHttpsGateway</a></td>
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
			<td>Enable root permission init container for the Kasm RDP HTTPS gateway deployment.</td>
		</tr>
	</tbody>
</table>

## Value type details

The chart uses some value types for which I would like to add a further explanation / recommendation:

### string/runtimeClassName

Provide a valid name of a runtimeClass within your cluster.

If you want to get the currently available runtimeClasses within your cluster, run:

```bash
kubectl get runtimeclasses
```

_**Personal recommendation**: A runtime that I believe is worth trying is the Kata Container Runtime.
Take a look at [https://katacontainers.io](https://katacontainers.io) to get an overview about it.
Also take a look at the HowTo-Section within the kata-container GitHub Repository,
e.g. to learn [how to create a runtime class](https://github.com/kata-containers/kata-containers/blob/main/docs/how-to/run-kata-with-k8s.md#create-runtime-class-for-kata-containers)_

## Chart with experimental support for CiliumNetworkPolicies

Please note that this chart does not provide any production-ready network policies itself.
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

* This chart deploys the Kasm control plane stack for Kubernetes.
* Kasm agent nodes are intentionally not part of this chart and must be deployed separately.
* This chart stays close to upstream Kasm behavior while being versioned and released through this helm-repo.
