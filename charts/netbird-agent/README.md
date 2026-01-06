

# netbird-agent

![Version: 0.6.7](https://img.shields.io/badge/Version-0.6.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.61.2](https://img.shields.io/badge/AppVersion-0.61.2-informational?style=flat-square)

A Helm chart for an easier netbird agent (https://netbird.io) deployment at kubernetes.

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
helm install netbird-agent codeadminde/netbird-agent
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

To install the chart with the release name `netbird-agent`

```bash
helm install netbird-agent codeadminde/netbird-agent
```
_**Note**: If you want to speicify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforhand._

## Uninstallation

To uninstall the chart release named `netbird-agent`

```bash
helm uninstall netbird-agent
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
> helm install netbird-agent codeadminde/netbird-agent -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Than you've to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install netbird-agent --set key=value --set keyTwo=secondValue codeadminde/netbird-agent
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
			<td id="additionalEnvSecrets"><a href="./values.yaml#L141">additionalEnvSecrets</a></td>
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
			<td>Additional env vars provided via one or more secret(s). @description Specifiy the ENV key used as KEY and the secret name as VALUE. The secret should contain the ENV key and the encrypted value: Sample secret ... apiVersion: v1 kind: Secret metadata: name: your-secret-name-to-slack-oidc-secrets type: Opaque stringData:   SLACK_KEY: "slack-key-value-goes-here"   SLACK_SECRET: "slack-secret-value-goes-here"</td>
		</tr>
		<tr>
			<td id="affinity"><a href="./values.yaml#L308">affinity</a></td>
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
			<td>Affinity configuration</td>
		</tr>
		<tr>
			<td id="agent"><a href="./values.yaml#L77">agent</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "adminUrl": "",
  "caEnableRootless": true,
  "caInitPreConfig": {
    "enabled": true
  },
  "logFilePath": "/var/lib/netbird/client.log",
  "logFormat": "console",
  "logLevel": "",
  "managementUrl": "",
  "socksPort": null,
  "ssh": {
    "allowServer": false,
    "enableRoot": false,
    "enableSftp": false
  }
}
</pre>
</div>
			</td>
			<td>- NetBird agent configuration</td>
		</tr>
		<tr>
			<td id="agent--adminUrl"><a href="./values.yaml#L85">agent.adminUrl</a></td>
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
			<td>- Admin URL @description Provide the admin URL if you want to connect the agent with your self-hosted instance. If not provided, it defaults to NetBird cloud endpoint.</td>
		</tr>
		<tr>
			<td id="agent--caEnableRootless"><a href="./values.yaml#L99">agent.caEnableRootless</a></td>
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
			<td>- Enable / Disable rootless mode @description Please note, that this flag will change the used image to netbird:*-rootless. When enabled, the deployment will configure the agent to use NETSTACK_MODE to provide a socks5 proxy. When disabled, the agent pod will require additional permissions, more details: https://docs.netbird.io/use-cases/netbird-on-faas#docker</td>
		</tr>
		<tr>
			<td id="agent--caInitPreConfig"><a href="./values.yaml#L101">agent.caInitPreConfig</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true
}
</pre>
</div>
			</td>
			<td>- Config preperation options</td>
		</tr>
		<tr>
			<td id="agent--caInitPreConfig--enabled"><a href="./values.yaml#L106">agent.caInitPreConfig.enabled</a></td>
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
			<td>- Enable / Disable config preperation @description When using the image inside environments which require very strict security configuration, It could be possible, that the automatic configuration of NB_MANAGEMENT_URL and/or NB_ADMIN_URL will fail. To avoid this, i've added an initContainer which pre-puplates a config.json which contains the urls configured within the helm release.</td>
		</tr>
		<tr>
			<td id="agent--logFilePath"><a href="./values.yaml#L94">agent.logFilePath</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/var/lib/netbird/client.log"
</pre>
</div>
			</td>
			<td>- Log format (default: console; alt: json) @description The log file path needs to be writeable. The path setting will be ignored and the /var/lib/netbird/client.log file will be forced.</td>
		</tr>
		<tr>
			<td id="agent--logFormat"><a href="./values.yaml#L90">agent.logFormat</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"console"
</pre>
</div>
			</td>
			<td>- Log format (default: console; alt: json) @description The log format setting will be ignored and the console format will be forced.</td>
		</tr>
		<tr>
			<td id="agent--logLevel"><a href="./values.yaml#L87">agent.logLevel</a></td>
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
			<td>- Log level (default: info)</td>
		</tr>
		<tr>
			<td id="agent--managementUrl"><a href="./values.yaml#L81">agent.managementUrl</a></td>
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
			<td>- Management URL @description Provide the management URL if you want to connect the agent with your self-hosted instance. If not provided, it defaults to NetBird cloud endpoint.</td>
		</tr>
		<tr>
			<td id="agent--socksPort"><a href="./values.yaml#L109">agent.socksPort</a></td>
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
			<td>- SOCKS5 Listener Port @description Allowes to override the used listener port of SOCKS5 proxy provided by NetBird agent when running in rootless mode (default: 1080).</td>
		</tr>
		<tr>
			<td id="agent--ssh"><a href="./values.yaml#L111">agent.ssh</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allowServer": false,
  "enableRoot": false,
  "enableSftp": false
}
</pre>
</div>
			</td>
			<td>- Configure agent SSH features</td>
		</tr>
		<tr>
			<td id="agent--ssh--allowServer"><a href="./values.yaml#L114">agent.ssh.allowServer</a></td>
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
			<td>- Enable / Disable ssh server feature @description Decide if the netbird-agent should allow the "SSH access via NetBird" feature.</td>
		</tr>
		<tr>
			<td id="agent--ssh--enableRoot"><a href="./values.yaml#L117">agent.ssh.enableRoot</a></td>
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
			<td>- Enable / Disable root login allowed @description Decide to enable or disable the ability to login as root when using the "SSH access via NetBird" feature.</td>
		</tr>
		<tr>
			<td id="agent--ssh--enableSftp"><a href="./values.yaml#L120">agent.ssh.enableSftp</a></td>
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
			<td>- Enable / Disable sftp protocol usage @description Decide to enable or disable the ability to use sftp when using the "SSH access via NetBird" feature.</td>
		</tr>
		<tr>
			<td id="cnps"><a href="./values.yaml#L156">cnps</a></td>
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
      "matchLabels": {}
    },
    "metrics": {
      "allow": false,
      "matchLabels": {}
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
			<td id="cnps--appTraffic"><a href="./values.yaml#L158">cnps.appTraffic</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
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
    "matchLabels": {}
  },
  "metrics": {
    "allow": false,
    "matchLabels": {}
  }
}
</pre>
</div>
			</td>
			<td>Application traffic policies</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress"><a href="./values.yaml#L181">cnps.appTraffic.egress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
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
}
</pre>
</div>
			</td>
			<td>Egress traffic configuration</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L183">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow egress traffic</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--egressRules"><a href="./values.yaml#L186">cnps.appTraffic.egress.egressRules</a></td>
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
			<td>Rules which are applied when egress allow eq true. @description Allows overriding default egress rules to match your security requirements.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress"><a href="./values.yaml#L160">cnps.appTraffic.ingress</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allow": false,
  "matchLabels": {}
}
</pre>
</div>
			</td>
			<td>Ingress traffic configuration</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L162">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress traffic</td>
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
			<td>Labels to match ingress controller pods @description Allows overriding default to match your ingress deployment.   app.kubernetes.io/name: ingress-nginx   io.kubernetes.pod.namespace: ingress-nginx</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--metrics"><a href="./values.yaml#L169">cnps.appTraffic.metrics</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "allow": false,
  "matchLabels": {}
}
</pre>
</div>
			</td>
			<td>Metrics (ingress) traffic configuration</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--metrics--allow"><a href="./values.yaml#L173">cnps.appTraffic.metrics.allow</a></td>
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
			<td>Allow ingress metrics traffic @description Enable / Disable rules to allow metrics reachability. Note: Requires monitoring.enabled set to true.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--metrics--matchLabels"><a href="./values.yaml#L179">cnps.appTraffic.metrics.matchLabels</a></td>
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
			<td id="cnps--cnpgTraffic"><a href="./values.yaml#L203">cnps.cnpgTraffic</a></td>
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
			<td id="cnps--cnpgTraffic--instanceExtraEgress"><a href="./values.yaml#L221">cnps.cnpgTraffic.instanceExtraEgress</a></td>
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
			<td id="env"><a href="./values.yaml#L124">env</a></td>
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
			<td>Additional env vars @description Do not add secretes here... use additionalEnvSecrets instead!</td>
		</tr>
		<tr>
			<td id="fullnameOverride"><a href="./values.yaml#L15">fullnameOverride</a></td>
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
			<td id="hpa"><a href="./values.yaml#L272">hpa</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "maxReplicas": 10,
  "minReplicas": 2,
  "targetCPUUtilizationPercentage": 70
}
</pre>
</div>
			</td>
			<td>Horizontal Pod Autoscaler configuration</td>
		</tr>
		<tr>
			<td id="hpa--enabled"><a href="./values.yaml#L274">hpa.enabled</a></td>
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
			<td>Enable HPA</td>
		</tr>
		<tr>
			<td id="hpa--maxReplicas"><a href="./values.yaml#L278">hpa.maxReplicas</a></td>
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
			<td>Maximum replicas for HPA</td>
		</tr>
		<tr>
			<td id="hpa--minReplicas"><a href="./values.yaml#L276">hpa.minReplicas</a></td>
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
			<td>Minimum replicas for HPA</td>
		</tr>
		<tr>
			<td id="hpa--targetCPUUtilizationPercentage"><a href="./values.yaml#L280">hpa.targetCPUUtilizationPercentage</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
70
</pre>
</div>
			</td>
			<td>Target CPU utilization percentage</td>
		</tr>
		<tr>
			<td id="image--pullPolicy"><a href="./values.yaml#L10">image.pullPolicy</a></td>
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
			<td></td>
		</tr>
		<tr>
			<td id="image--repository"><a href="./values.yaml#L8">image.repository</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"netbirdio/netbird"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="image--tag"><a href="./values.yaml#L9">image.tag</a></td>
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
			<td id="image--tagSuffixRootless"><a href="./values.yaml#L11">image.tagSuffixRootless</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"-rootless"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="imagePullSecrets"><a href="./values.yaml#L13">imagePullSecrets</a></td>
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
			<td id="libchartCnps"><a href="./values.yaml#L148">libchartCnps</a></td>
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
			<td id="libchartCnps--enabled"><a href="./values.yaml#L150">libchartCnps.enabled</a></td>
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
			<td id="libchartCnps--includeCnpgPolicies"><a href="./values.yaml#L152">libchartCnps.includeCnpgPolicies</a></td>
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
			<td id="livenessProbe--exec--command[0]"><a href="./values.yaml#L290">livenessProbe.exec.command[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/bin/sh"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="livenessProbe--exec--command[1]"><a href="./values.yaml#L290">livenessProbe.exec.command[1]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"-c"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="livenessProbe--exec--command[2]"><a href="./values.yaml#L290">livenessProbe.exec.command[2]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"netbird status | grep 'NetBird IP: 100'"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="livenessProbe--failureThreshold"><a href="./values.yaml#L291">livenessProbe.failureThreshold</a></td>
			<td>
int
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
12
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="livenessProbe--initialDelaySeconds"><a href="./values.yaml#L293">livenessProbe.initialDelaySeconds</a></td>
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
			<td id="livenessProbe--periodSeconds"><a href="./values.yaml#L292">livenessProbe.periodSeconds</a></td>
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
			<td id="monitoring"><a href="./values.yaml#L244">monitoring</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "serviceMonitor": {
    "additionalLabels": {},
    "annotations": {}
  }
}
</pre>
</div>
			</td>
			<td>Monitoring configuration @description Provided monitoring rules are not valid and only used as a placeholder for future implementation. There you should NOT ENABLE the monitoring until this notice got removed. Implementation will follow when upstream support available. Upstream issue: https://github.com/netbirdio/netbird/issues/1762</td>
		</tr>
		<tr>
			<td id="monitoring--enabled"><a href="./values.yaml#L246">monitoring.enabled</a></td>
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
			<td>Enable monitoring (DO NOT ENABLE; see desc above for details)</td>
		</tr>
		<tr>
			<td id="monitoring--serviceMonitor"><a href="./values.yaml#L248">monitoring.serviceMonitor</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "additionalLabels": {},
  "annotations": {}
}
</pre>
</div>
			</td>
			<td>ServiceMonitor configuration</td>
		</tr>
		<tr>
			<td id="monitoring--serviceMonitor--additionalLabels"><a href="./values.yaml#L254">monitoring.serviceMonitor.additionalLabels</a></td>
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
			<td>Additional labels @description Provide additional labels to the service monitor resource, e.g. for auto-provisioning.</td>
		</tr>
		<tr>
			<td id="monitoring--serviceMonitor--annotations"><a href="./values.yaml#L251">monitoring.serviceMonitor.annotations</a></td>
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
			<td>Annotations @description Add Annotations to the service monitor resource.</td>
		</tr>
		<tr>
			<td id="nameOverride"><a href="./values.yaml#L14">nameOverride</a></td>
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
			<td id="nodeSelector"><a href="./values.yaml#L302">nodeSelector</a></td>
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
			<td>Node selector configuration</td>
		</tr>
		<tr>
			<td id="persistence"><a href="./values.yaml#L224">persistence</a></td>
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
  "emptyDirSizeLimit": "50Mi",
  "enabled": false,
  "size": "250Mi",
  "storageClass": "longhorn"
}
</pre>
</div>
			</td>
			<td>NetBird agent persistence configuration.</td>
		</tr>
		<tr>
			<td id="persistence--accessModes"><a href="./values.yaml#L234">persistence.accessModes</a></td>
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
			<td id="persistence--emptyDirSizeLimit"><a href="./values.yaml#L228">persistence.emptyDirSizeLimit</a></td>
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
			<td>Define the max directory size when using persistence.enabled: false</td>
		</tr>
		<tr>
			<td id="persistence--size"><a href="./values.yaml#L230">persistence.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"250Mi"
</pre>
</div>
			</td>
			<td>Define the size of the PV when using persistence.enabled: true</td>
		</tr>
		<tr>
			<td id="persistence--storageClass"><a href="./values.yaml#L232">persistence.storageClass</a></td>
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
			<td id="podAnnotations"><a href="./values.yaml#L27">podAnnotations</a></td>
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
			<td>- Pod annnotations to add to the deployment pods</td>
		</tr>
		<tr>
			<td id="podSecurityContext"><a href="./values.yaml#L30">podSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "fsGroup": 1000,
  "runAsGroup": 1000,
  "runAsUser": 1000,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>Pod security context</td>
		</tr>
		<tr>
			<td id="readinessProbe--exec--command[0]"><a href="./values.yaml#L296">readinessProbe.exec.command[0]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"/bin/sh"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--exec--command[1]"><a href="./values.yaml#L296">readinessProbe.exec.command[1]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"-c"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--exec--command[2]"><a href="./values.yaml#L296">readinessProbe.exec.command[2]</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"netbird status | grep 'NetBird IP: 100'"
</pre>
</div>
			</td>
			<td></td>
		</tr>
		<tr>
			<td id="readinessProbe--failureThreshold"><a href="./values.yaml#L297">readinessProbe.failureThreshold</a></td>
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
			<td id="readinessProbe--initialDelaySeconds"><a href="./values.yaml#L299">readinessProbe.initialDelaySeconds</a></td>
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
			<td id="readinessProbe--periodSeconds"><a href="./values.yaml#L298">readinessProbe.periodSeconds</a></td>
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
			<td id="replicaCount"><a href="./values.yaml#L5">replicaCount</a></td>
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
			<td id="resources"><a href="./values.yaml#L257">resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "cpu": "100m",
    "memory": "256Mi"
  },
  "requests": {
    "cpu": "50m",
    "memory": "128Mi"
  }
}
</pre>
</div>
			</td>
			<td>Resource requests and limits</td>
		</tr>
		<tr>
			<td id="resources--limits"><a href="./values.yaml#L265">resources.limits</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "cpu": "100m",
  "memory": "256Mi"
}
</pre>
</div>
			</td>
			<td>Resource limits</td>
		</tr>
		<tr>
			<td id="resources--limits--cpu"><a href="./values.yaml#L267">resources.limits.cpu</a></td>
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
			<td>CPU limit</td>
		</tr>
		<tr>
			<td id="resources--limits--memory"><a href="./values.yaml#L269">resources.limits.memory</a></td>
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
			<td id="resources--requests"><a href="./values.yaml#L259">resources.requests</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "cpu": "50m",
  "memory": "128Mi"
}
</pre>
</div>
			</td>
			<td>Requested resources</td>
		</tr>
		<tr>
			<td id="resources--requests--cpu"><a href="./values.yaml#L261">resources.requests.cpu</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"50m"
</pre>
</div>
			</td>
			<td>CPU request</td>
		</tr>
		<tr>
			<td id="resources--requests--memory"><a href="./values.yaml#L263">resources.requests.memory</a></td>
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
			<td id="runtimeClass"><a href="./values.yaml#L60">runtimeClass</a></td>
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
			<td id="runtimeClass--jobs"><a href="./values.yaml#L64">runtimeClass.jobs</a></td>
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
			<td id="runtimeClass--pods"><a href="./values.yaml#L62">runtimeClass.pods</a></td>
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
			<td id="runtimeClass--tests"><a href="./values.yaml#L66">runtimeClass.tests</a></td>
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
			<td id="securityContext"><a href="./values.yaml#L38">securityContext</a></td>
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
  "runAsNonRoot": true
}
</pre>
</div>
			</td>
			<td>Container security context</td>
		</tr>
		<tr>
			<td id="service"><a href="./values.yaml#L69">service</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": false,
  "metricsPort": null,
  "port": 8080,
  "targetPort": 8080,
  "type": "ClusterIP"
}
</pre>
</div>
			</td>
			<td>- Deployment service configuration</td>
		</tr>
		<tr>
			<td id="serviceAccount--annotations"><a href="./values.yaml#L21">serviceAccount.annotations</a></td>
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
			<td>- Annotations to add to the service account</td>
		</tr>
		<tr>
			<td id="serviceAccount--create"><a href="./values.yaml#L19">serviceAccount.create</a></td>
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
			<td>- Specifies whether a service account should be created</td>
		</tr>
		<tr>
			<td id="serviceAccount--name"><a href="./values.yaml#L24">serviceAccount.name</a></td>
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
			<td>- The name of the service account to use. @description If not set and create is true, a name is generated using the fullname template</td>
		</tr>
		<tr>
			<td id="startupProbe"><a href="./values.yaml#L283">startupProbe</a></td>
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
			<td>Health probes configuration for startup, liveness and readiness probes</td>
		</tr>
		<tr>
			<td id="tolerations"><a href="./values.yaml#L305">tolerations</a></td>
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
			<td>Tolerations configuration</td>
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
<hr /><hr />

## Appendix - This chart expects an existing secret

### NetBird setup key requirement

Please note that the agent requires a netbird-setup-key in order to join your network.

A sample secret:

```
---
apiVersion: v1
kind: Secret
metadata:
  name: netbird-setup-key
type: Opaque
stringData:
  key: "CHANGE_ME__I_AM_A_SAMPLE"
```

> **IMPORTANT**: Never push unencrypted secrets into repositories.
> Encrypt them beforehand or provide secrets via external provisioning logic.
