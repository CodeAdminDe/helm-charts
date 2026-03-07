

# mastodon

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v4.5.7](https://img.shields.io/badge/AppVersion-v4.5.7-informational?style=flat-square)

A Helm chart for deploying Mastodon on Kubernetes with repo-aligned secure defaults and integrations.

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
| https://mastodon.github.io/helm-charts | upstream(mastodon) | 0.3.0 |

## TL;DR

You don't want to read through the docs? That's the quick and dirty way:

```bash
helm repo add codeadminde https://codeadminde.github.io/helm-charts/
helm repo update
helm install mastodon codeadminde/mastodon
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

To install the chart with the release name `mastodon`

```bash
helm install mastodon codeadminde/mastodon
```
_**Note**: If you want to speicify a namespace, provide the name via the `-n` (or `--namespace`) flag. You need to create the desired namespace beforhand._

## Uninstallation

To uninstall the chart release named `mastodon`

```bash
helm uninstall mastodon
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
> helm install mastodon codeadminde/mastodon -f values.yaml
> ```

Alternatively, you could provide the values which you want to override at the CLI directly. Than you've to provide the values as key=value pair(s), referenced by the `--set` flag.

> #### Sample
>
> ```bash
> helm install mastodon --set key=value --set keyTwo=secondValue codeadminde/mastodon
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
			<td id="cnps"><a href="./values.yaml#L301">cnps</a></td>
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
			<td>App-specific CiliumNetworkPolicies settings.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--allow"><a href="./values.yaml#L312">cnps.appTraffic.egress.allow</a></td>
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
			<td>Allow egress traffic from Mastodon app pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEndpoints"><a href="./values.yaml#L314">cnps.appTraffic.egress.toEndpoints</a></td>
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
			<td>Optional explicit egress endpoint selectors.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toEntities"><a href="./values.yaml#L316">cnps.appTraffic.egress.toEntities</a></td>
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
			<td>Optional explicit egress entities.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--egress--toPorts"><a href="./values.yaml#L320">cnps.appTraffic.egress.toPorts</a></td>
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
			<td>Optional explicit egress ports. @description Defaults to `443/TCP`; chart appends PostgreSQL and Redis ports when available.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--allow"><a href="./values.yaml#L305">cnps.appTraffic.ingress.allow</a></td>
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
			<td>Allow ingress traffic to Mastodon app pods.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEndpoints"><a href="./values.yaml#L307">cnps.appTraffic.ingress.fromEndpoints</a></td>
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
			<td>Optional explicit ingress source endpoints.</td>
		</tr>
		<tr>
			<td id="cnps--appTraffic--ingress--fromEntities"><a href="./values.yaml#L309">cnps.appTraffic.ingress.fromEntities</a></td>
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
			<td>Optional explicit ingress entities.</td>
		</tr>
		<tr>
			<td id="cnps--cnpgTraffic--instanceExtraEgress"><a href="./values.yaml#L325">cnps.cnpgTraffic.instanceExtraEgress</a></td>
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
			<td>Extra CNPG egress rules passed to libchart-cnps CNPG policy set.</td>
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
			<td id="libchartCnps"><a href="./values.yaml#L296">libchartCnps</a></td>
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
			<td>Enable libchart-cnps integration for CiliumNetworkPolicies.</td>
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
			<td>Override release-based naming for wrapper-owned resources (validation/CNP/test objects).</td>
		</tr>
		<tr>
			<td id="redis"><a href="./values.yaml#L247">redis</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "existingEnvSecret": "mastodon-redis",
  "fullnameOverride": "mastodon-redis",
  "persistence": {
    "enabled": true,
    "size": "8Gi",
    "storageClass": ""
  },
  "podSecurityContext": {
    "fsGroup": 1000,
    "runAsGroup": 1000,
    "runAsUser": 1000,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "resources": {
    "limits": {
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
    "readOnlyRootFilesystem": true,
    "runAsNonRoot": true
  },
  "service": {
    "addBackwardsCompatibleMaster": true,
    "type": "ClusterIP"
  }
}
</pre>
</div>
			</td>
			<td>Local redis dependency (CodeAdminDe/helm-charts redis).</td>
		</tr>
		<tr>
			<td id="redis--enabled"><a href="./values.yaml#L249">redis.enabled</a></td>
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
			<td>Enable bundled redis dependency.</td>
		</tr>
		<tr>
			<td id="redis--existingEnvSecret"><a href="./values.yaml#L254">redis.existingEnvSecret</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"mastodon-redis"
</pre>
</div>
			</td>
			<td>Fixed secret name used by redis chart.</td>
		</tr>
		<tr>
			<td id="redis--fullnameOverride"><a href="./values.yaml#L252">redis.fullnameOverride</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"mastodon-redis"
</pre>
</div>
			</td>
			<td>Fixed fullname for redis dependency to provide stable upstream wiring. @description If you need multiple mastodon releases in one namespace, override this and adjust `upstream.redis.*` accordingly.</td>
		</tr>
		<tr>
			<td id="redis--persistence--enabled"><a href="./values.yaml#L264">redis.persistence.enabled</a></td>
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
			<td>Enable redis persistence.</td>
		</tr>
		<tr>
			<td id="redis--persistence--size"><a href="./values.yaml#L266">redis.persistence.size</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"8Gi"
</pre>
</div>
			</td>
			<td>PVC size for redis.</td>
		</tr>
		<tr>
			<td id="redis--persistence--storageClass"><a href="./values.yaml#L268">redis.persistence.storageClass</a></td>
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
			<td>Optional storageClass for redis PVC.</td>
		</tr>
		<tr>
			<td id="redis--podSecurityContext"><a href="./values.yaml#L271">redis.podSecurityContext</a></td>
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
			<td>Redis pod security context override.</td>
		</tr>
		<tr>
			<td id="redis--resources"><a href="./values.yaml#L288">redis.resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "memory": "512Mi"
  },
  "requests": {
    "cpu": "100m",
    "memory": "128Mi"
  }
}
</pre>
</div>
			</td>
			<td>Redis resource requests/limits.</td>
		</tr>
		<tr>
			<td id="redis--securityContext"><a href="./values.yaml#L279">redis.securityContext</a></td>
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
			<td>Redis container security context override.</td>
		</tr>
		<tr>
			<td id="redis--service--addBackwardsCompatibleMaster"><a href="./values.yaml#L260">redis.service.addBackwardsCompatibleMaster</a></td>
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
			<td>Keep `<name>-master` compatibility service enabled (used by upstream defaults).</td>
		</tr>
		<tr>
			<td id="redis--service--type"><a href="./values.yaml#L258">redis.service.type</a></td>
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
			<td>Service type for bundled redis.</td>
		</tr>
		<tr>
			<td id="runtimeClass"><a href="./values.yaml#L6">runtimeClass</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "tests": ""
}
</pre>
</div>
			</td>
			<td>RuntimeClass names for wrapper-owned resources.</td>
		</tr>
		<tr>
			<td id="runtimeClass--tests"><a href="./values.yaml#L8">runtimeClass.tests</a></td>
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
			<td id="upstream"><a href="./values.yaml#L19">upstream</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "enabled": true,
  "fullnameOverride": "",
  "httproute": {
    "annotations": {},
    "enabled": false,
    "hostnames": [
      "mastodon.example.com"
    ],
    "labels": {},
    "parentRefs": [
      {
        "name": "envoy-gateway",
        "namespace": "envoy-gateway-system",
        "sectionName": "websecure"
      }
    ],
    "rules": [
      {
        "matches": [
          {
            "path": {
              "type": "PathPrefix",
              "value": "/"
            }
          }
        ]
      }
    ],
    "streamingHostnames": []
  },
  "image": {
    "pullPolicy": "IfNotPresent",
    "tag": ""
  },
  "ingress": {
    "annotations": {
      "nginx.ingress.kubernetes.io/proxy-body-size": "40m",
      "nginx.ingress.kubernetes.io/proxy-buffering": "off",
      "nginx.ingress.kubernetes.io/proxy-http-version": "1.1",
      "nginx.ingress.kubernetes.io/proxy-read-timeout": "3600",
      "nginx.ingress.kubernetes.io/proxy-request-buffering": "off",
      "nginx.ingress.kubernetes.io/proxy-send-timeout": "3600"
    },
    "className": "",
    "enabled": false,
    "hosts": [
      {
        "host": "mastodon.example.com",
        "paths": [
          {
            "path": "/",
            "pathType": "Prefix"
          }
        ]
      }
    ],
    "streaming": {
      "annotations": {},
      "className": "",
      "enabled": false,
      "hosts": [
        {
          "host": "streaming.mastodon.example.com",
          "paths": [
            {
              "path": "/",
              "pathType": "Prefix"
            }
          ]
        }
      ],
      "tls": []
    },
    "tls": []
  },
  "mastodon": {
    "hooks": {
      "dbMigrate": {
        "enabled": true
      },
      "dbPrepare": {
        "enabled": true
      }
    },
    "localDomain": "mastodon.example.com",
    "s3": {
      "bucket": "mastodon-media",
      "endpoint": "https://s3.example.com",
      "existingSecret": "mastodon-s3",
      "existingSecretKeys": {
        "accessKeyId": "access-key-id",
        "secretAccessKey": "secret-access-key"
      },
      "hostname": "s3.example.com",
      "region": "us-east-1"
    },
    "secrets": {
      "existingSecret": "mastodon-secrets",
      "existingSecretKeys": {
        "areDeterministicKey": "are-deterministic-key",
        "areKeyDerivationSalt": "are-derivation-salt",
        "arePrimaryKey": "are-primary-key",
        "secretKeyBase": "secret-key-base",
        "vapidPrivateKey": "vapid-private-key",
        "vapidPublicKey": "vapid-public-key"
      }
    },
    "sidekiq": {
      "resources": {
        "limits": {
          "memory": "2Gi"
        },
        "requests": {
          "cpu": "250m",
          "memory": "512Mi"
        }
      },
      "workers": [
        {
          "concurrency": 25,
          "name": "all-queues",
          "queues": [
            "default,8",
            "push,6",
            "ingress,4",
            "mailers,2",
            "pull",
            "scheduler",
            "fasp"
          ],
          "replicas": 1
        }
      ]
    },
    "smtp": {
      "existingSecret": "mastodon-smtp",
      "existingSecretKeys": {
        "password": "password",
        "username": "username"
      }
    },
    "streaming": {
      "replicas": 1,
      "resources": {
        "limits": {
          "memory": "1Gi"
        },
        "requests": {
          "cpu": "150m",
          "memory": "256Mi"
        }
      }
    },
    "web": {
      "replicas": 1,
      "resources": {
        "limits": {
          "memory": "2Gi"
        },
        "requests": {
          "cpu": "250m",
          "memory": "512Mi"
        }
      }
    },
    "webDomain": ""
  },
  "nameOverride": "",
  "podSecurityContext": {
    "fsGroup": 991,
    "runAsGroup": 991,
    "runAsUser": 991
  },
  "postgresql": {
    "database": "mastodon",
    "direct": {
      "database": "",
      "hostname": "",
      "port": ""
    },
    "existingSecret": "cnpg-cluster-app",
    "existingSecretKeys": {
      "password": "password",
      "username": "user"
    },
    "hostname": "cnpg-cluster-rw",
    "port": 5432,
    "preparedStatements": true
  },
  "redis": {
    "cache": {
      "enabled": false
    },
    "existingSecret": "mastodon-redis",
    "existingSecretKeys": {
      "password": "REDIS_PASSWORD"
    },
    "hostname": "mastodon-redis-master",
    "port": 6379,
    "sidekiq": {
      "enabled": false
    }
  },
  "resources": {},
  "securityContext": {
    "allowPrivilegeEscalation": false,
    "capabilities": {
      "drop": [
        "ALL"
      ]
    },
    "readOnlyRootFilesystem": false,
    "runAsNonRoot": true,
    "seccompProfile": {
      "type": "RuntimeDefault"
    }
  },
  "service": {
    "port": 80,
    "type": "ClusterIP"
  },
  "serviceAccount": {
    "annotations": {},
    "create": true,
    "name": ""
  },
  "timezone": "UTC"
}
</pre>
</div>
			</td>
			<td>Official upstream Mastodon chart values. @description This chart wraps the official `mastodon/helm-charts` chart under the alias `upstream`.
```yaml
upstream:
  mastodon:
    extraEnvVars:
      DISABLE_SYSTEM_CHECK: "true"
```</td>
		</tr>
		<tr>
			<td id="upstream--enabled"><a href="./values.yaml#L21">upstream.enabled</a></td>
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
			<td>Enable upstream Mastodon subchart rendering.</td>
		</tr>
		<tr>
			<td id="upstream--httproute--enabled"><a href="./values.yaml#L75">upstream.httproute.enabled</a></td>
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
			<td>Enable HTTPRoute resources in upstream chart (Gateway API).</td>
		</tr>
		<tr>
			<td id="upstream--httproute--hostnames"><a href="./values.yaml#L84">upstream.httproute.hostnames</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  "mastodon.example.com"
]
</pre>
</div>
			</td>
			<td>Hostnames for web route.</td>
		</tr>
		<tr>
			<td id="upstream--httproute--parentRefs"><a href="./values.yaml#L79">upstream.httproute.parentRefs</a></td>
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
    "sectionName": "websecure"
  }
]
</pre>
</div>
			</td>
			<td>ParentRefs for Gateway API routing.</td>
		</tr>
		<tr>
			<td id="upstream--httproute--rules"><a href="./values.yaml#L89">upstream.httproute.rules</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "matches": [
      {
        "path": {
          "type": "PathPrefix",
          "value": "/"
        }
      }
    ]
  }
]
</pre>
</div>
			</td>
			<td>HTTPRoute matching rules.</td>
		</tr>
		<tr>
			<td id="upstream--httproute--streamingHostnames"><a href="./values.yaml#L87">upstream.httproute.streamingHostnames</a></td>
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
			<td>Optional dedicated streaming hostnames.</td>
		</tr>
		<tr>
			<td id="upstream--image--pullPolicy"><a href="./values.yaml#L29">upstream.image.pullPolicy</a></td>
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
			<td>Upstream image pull policy.</td>
		</tr>
		<tr>
			<td id="upstream--image--tag"><a href="./values.yaml#L31">upstream.image.tag</a></td>
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
			<td>Optional upstream image tag override (defaults to upstream chart appVersion).</td>
		</tr>
		<tr>
			<td id="upstream--ingress--annotations"><a href="./values.yaml#L46">upstream.ingress.annotations</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "nginx.ingress.kubernetes.io/proxy-body-size": "40m",
  "nginx.ingress.kubernetes.io/proxy-buffering": "off",
  "nginx.ingress.kubernetes.io/proxy-http-version": "1.1",
  "nginx.ingress.kubernetes.io/proxy-read-timeout": "3600",
  "nginx.ingress.kubernetes.io/proxy-request-buffering": "off",
  "nginx.ingress.kubernetes.io/proxy-send-timeout": "3600"
}
</pre>
</div>
			</td>
			<td>Ingress annotations. @description Includes secure defaults for ingress-nginx; override keys as needed for your controller.</td>
		</tr>
		<tr>
			<td id="upstream--ingress--className"><a href="./values.yaml#L43">upstream.ingress.className</a></td>
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
			<td id="upstream--ingress--enabled"><a href="./values.yaml#L41">upstream.ingress.enabled</a></td>
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
			<td>Enable ingress resource creation in upstream chart.</td>
		</tr>
		<tr>
			<td id="upstream--ingress--hosts"><a href="./values.yaml#L54">upstream.ingress.hosts</a></td>
			<td>
list
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
[
  {
    "host": "mastodon.example.com",
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
			<td>Ingress hosts/paths.</td>
		</tr>
		<tr>
			<td id="upstream--ingress--streaming--enabled"><a href="./values.yaml#L63">upstream.ingress.streaming.enabled</a></td>
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
			<td>Enable dedicated streaming ingress in upstream chart.</td>
		</tr>
		<tr>
			<td id="upstream--ingress--tls"><a href="./values.yaml#L60">upstream.ingress.tls</a></td>
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
			<td>Ingress TLS entries.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--hooks--dbMigrate--enabled"><a href="./values.yaml#L107">upstream.mastodon.hooks.dbMigrate.enabled</a></td>
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
			<td>Run DB migrations on upgrades.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--hooks--dbPrepare--enabled"><a href="./values.yaml#L104">upstream.mastodon.hooks.dbPrepare.enabled</a></td>
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
			<td>Run DB prepare job on install.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--localDomain"><a href="./values.yaml#L97">upstream.mastodon.localDomain</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"mastodon.example.com"
</pre>
</div>
			</td>
			<td>Public federation domain.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--s3"><a href="./values.yaml#L122">upstream.mastodon.s3</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "bucket": "mastodon-media",
  "endpoint": "https://s3.example.com",
  "existingSecret": "mastodon-s3",
  "existingSecretKeys": {
    "accessKeyId": "access-key-id",
    "secretAccessKey": "secret-access-key"
  },
  "hostname": "s3.example.com",
  "region": "us-east-1"
}
</pre>
</div>
			</td>
			<td>S3/object-storage configuration (optional but recommended for production).</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--s3--bucket"><a href="./values.yaml#L130">upstream.mastodon.s3.bucket</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"mastodon-media"
</pre>
</div>
			</td>
			<td>S3 bucket name for Mastodon media.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--s3--endpoint"><a href="./values.yaml#L126">upstream.mastodon.s3.endpoint</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"https://s3.example.com"
</pre>
</div>
			</td>
			<td>S3 endpoint URL.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--s3--existingSecret"><a href="./values.yaml#L132">upstream.mastodon.s3.existingSecret</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"mastodon-s3"
</pre>
</div>
			</td>
			<td>Existing secret containing S3 credentials.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--s3--hostname"><a href="./values.yaml#L124">upstream.mastodon.s3.hostname</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"s3.example.com"
</pre>
</div>
			</td>
			<td>S3 hostname (without scheme).</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--s3--region"><a href="./values.yaml#L128">upstream.mastodon.s3.region</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"us-east-1"
</pre>
</div>
			</td>
			<td>S3 region.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--secrets--existingSecret"><a href="./values.yaml#L112">upstream.mastodon.secrets.existingSecret</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"mastodon-secrets"
</pre>
</div>
			</td>
			<td>Existing secret with Mastodon app secrets. @description Strongly recommended. Avoid storing Mastodon secrets in plain values.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--sidekiq--resources"><a href="./values.yaml#L170">upstream.mastodon.sidekiq.resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "memory": "2Gi"
  },
  "requests": {
    "cpu": "250m",
    "memory": "512Mi"
  }
}
</pre>
</div>
			</td>
			<td>Sidekiq default resources.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--smtp"><a href="./values.yaml#L138">upstream.mastodon.smtp</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "existingSecret": "mastodon-smtp",
  "existingSecretKeys": {
    "password": "password",
    "username": "username"
  }
}
</pre>
</div>
			</td>
			<td>SMTP configuration (optional but recommended for production).</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--smtp--existingSecret"><a href="./values.yaml#L140">upstream.mastodon.smtp.existingSecret</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"mastodon-smtp"
</pre>
</div>
			</td>
			<td>Existing secret containing SMTP credentials.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--streaming--replicas"><a href="./values.yaml#L179">upstream.mastodon.streaming.replicas</a></td>
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
			<td>Streaming deployment replicas.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--streaming--resources"><a href="./values.yaml#L181">upstream.mastodon.streaming.resources</a></td>
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
    "cpu": "150m",
    "memory": "256Mi"
  }
}
</pre>
</div>
			</td>
			<td>Streaming resources.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--web--replicas"><a href="./values.yaml#L147">upstream.mastodon.web.replicas</a></td>
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
			<td>Web deployment replicas.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--web--resources"><a href="./values.yaml#L149">upstream.mastodon.web.resources</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "limits": {
    "memory": "2Gi"
  },
  "requests": {
    "cpu": "250m",
    "memory": "512Mi"
  }
}
</pre>
</div>
			</td>
			<td>Web resources.</td>
		</tr>
		<tr>
			<td id="upstream--mastodon--webDomain"><a href="./values.yaml#L99">upstream.mastodon.webDomain</a></td>
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
			<td>Optional web domain override.</td>
		</tr>
		<tr>
			<td id="upstream--nameOverride"><a href="./values.yaml#L24">upstream.nameOverride</a></td>
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
			<td>Upstream naming overrides.</td>
		</tr>
		<tr>
			<td id="upstream--podSecurityContext"><a href="./values.yaml#L189">upstream.podSecurityContext</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "fsGroup": 991,
  "runAsGroup": 991,
  "runAsUser": 991
}
</pre>
</div>
			</td>
			<td>Global pod-level security context for upstream workloads.</td>
		</tr>
		<tr>
			<td id="upstream--postgresql"><a href="./values.yaml#L213">upstream.postgresql</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "database": "mastodon",
  "direct": {
    "database": "",
    "hostname": "",
    "port": ""
  },
  "existingSecret": "cnpg-cluster-app",
  "existingSecretKeys": {
    "password": "password",
    "username": "user"
  },
  "hostname": "cnpg-cluster-rw",
  "port": 5432,
  "preparedStatements": true
}
</pre>
</div>
			</td>
			<td>PostgreSQL connectivity. @description Defaults assume an in-namespace CNPG cluster (`cnpg-cluster`) with app secret (`cnpg-cluster-app`).</td>
		</tr>
		<tr>
			<td id="upstream--redis"><a href="./values.yaml#L229">upstream.redis</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "cache": {
    "enabled": false
  },
  "existingSecret": "mastodon-redis",
  "existingSecretKeys": {
    "password": "REDIS_PASSWORD"
  },
  "hostname": "mastodon-redis-master",
  "port": 6379,
  "sidekiq": {
    "enabled": false
  }
}
</pre>
</div>
			</td>
			<td>Redis connectivity. @description Defaults are wired to this chart's local `redis` dependency (`mastodon-redis-master` + secret `mastodon-redis`).</td>
		</tr>
		<tr>
			<td id="upstream--resources"><a href="./values.yaml#L241">upstream.resources</a></td>
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
			<td>Optional global resources fallback for upstream components.</td>
		</tr>
		<tr>
			<td id="upstream--securityContext"><a href="./values.yaml#L195">upstream.securityContext</a></td>
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
  "runAsNonRoot": true,
  "seccompProfile": {
    "type": "RuntimeDefault"
  }
}
</pre>
</div>
			</td>
			<td>Global container-level security context for upstream workloads.</td>
		</tr>
		<tr>
			<td id="upstream--service--port"><a href="./values.yaml#L37">upstream.service.port</a></td>
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
			<td>Service port exposed by upstream web service.</td>
		</tr>
		<tr>
			<td id="upstream--service--type"><a href="./values.yaml#L35">upstream.service.type</a></td>
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
			<td>Service type for Mastodon web service. This wrapper enforces `ClusterIP`.</td>
		</tr>
		<tr>
			<td id="upstream--serviceAccount"><a href="./values.yaml#L206">upstream.serviceAccount</a></td>
			<td>
object
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
{
  "annotations": {},
  "create": true,
  "name": ""
}
</pre>
</div>
			</td>
			<td>Upstream service account configuration.</td>
		</tr>
		<tr>
			<td id="upstream--timezone"><a href="./values.yaml#L244">upstream.timezone</a></td>
			<td>
string
</td>
			<td>
				<div style="max-width: 300px;">
<pre lang="json">
"UTC"
</pre>
</div>
			</td>
			<td>Optional timezone for all upstream workloads.</td>
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

### Upstream model and scope

* This chart wraps the official Mastodon Helm chart as dependency alias `upstream`.
* It does not install cluster infrastructure (Ingress Controller, Gateway Controller, CNPG operator).
* Deployment logic (web/sidekiq/streaming/jobs) remains upstream-compatible.

### CNPG baseline

* Default PostgreSQL values target an in-cluster CNPG cluster:
  * host: `cnpg-cluster-rw`
  * auth secret: `cnpg-cluster-app`
* Adapt `upstream.postgresql.*` if your cluster/secret names differ.

### Redis baseline

* Redis is wired through this monorepo's `redis` chart dependency by default.
* For minimal setup, redis naming is fixed to:
  * service: `mastodon-redis-master`
  * secret: `mastodon-redis` (`REDIS_PASSWORD` key)
* If you need multiple Mastodon releases in the same namespace, override redis naming and adjust `upstream.redis.hostname` / `upstream.redis.existingSecret` accordingly.

### Security posture

* Service exposure is restricted to `ClusterIP`; use ingress or Gateway API (`HTTPRoute`) for north-south traffic.
* Wrapper validation enforces secret-based credential handling for Mastodon core secrets, PostgreSQL, and Redis.
* Optional `libchart-cnps` integration is included for Cilium policy deployments.

### Secret requirements

Required secret references for successful deployment:

1. `upstream.mastodon.secrets.existingSecret`
2. `upstream.postgresql.existingSecret`
3. `upstream.redis.existingSecret`

Optional integrations like S3/SMTP should also use existing secrets for production.
