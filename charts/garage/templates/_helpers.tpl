{{/* Expand chart name. */}}
{{- define "garage.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "garage.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/* Chart label helper. */}}
{{- define "garage.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels. */}}
{{- define "garage.labels" -}}
helm.sh/chart: {{ include "garage.chart" . }}
{{ include "garage.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels. */}}
{{- define "garage.selectorLabels" -}}
app.kubernetes.io/name: {{ include "garage.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* ServiceAccount name helper. */}}
{{- define "garage.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "garage.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Namespace helper for RBAC resources. */}}
{{- define "garage.rbacNamespace" -}}
{{- default .Release.Namespace .Values.rbac.namespace -}}
{{- end }}

{{/* Role name helper. */}}
{{- define "garage.rbacRoleName" -}}
{{- printf "%s-role" (include "garage.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* ClusterRole name helper. */}}
{{- define "garage.rbacClusterRoleName" -}}
{{- if .Values.rbac.clusterRole.name -}}
{{- .Values.rbac.clusterRole.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-crd-manager" (include "garage.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/* Auth secret name helper. */}}
{{- define "garage.authSecretName" -}}
{{- if .Values.secrets.existingSecret.name -}}
{{- .Values.secrets.existingSecret.name -}}
{{- else -}}
{{- printf "%s-auth" (include "garage.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/* ConfigMap name helper. */}}
{{- define "garage.configMapName" -}}
{{- if .Values.garage.existingConfigMap.name -}}
{{- .Values.garage.existingConfigMap.name -}}
{{- else -}}
{{- printf "%s-config" (include "garage.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/* Kubernetes discovery namespace helper. */}}
{{- define "garage.kubernetesDiscoveryNamespace" -}}
{{- default .Release.Namespace .Values.garage.kubernetesDiscovery.namespace -}}
{{- end }}

{{/* Kubernetes discovery service_name helper. */}}
{{- define "garage.kubernetesDiscoveryServiceName" -}}
{{- default (include "garage.fullname" .) .Values.garage.kubernetesDiscovery.serviceName -}}
{{- end }}

{{/* Returns a random hex string with the requested length. */}}
{{- define "garage.randHex" -}}
{{- $result := "" -}}
{{- range $i := until 100 -}}
  {{- if lt (len $result) . -}}
    {{- $randList := randAlphaNum . | splitList "" -}}
    {{- $reducedList := without $randList "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y" "z" "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" -}}
    {{- $randString := join "" $reducedList -}}
    {{- $result = print $result $randString -}}
  {{- end -}}
{{- end -}}
{{- $result | trunc . -}}
{{- end }}

{{/* Render generated garage.toml content. */}}
{{- define "garage.generatedConfig" -}}
{{- if .Values.garage.garageTomlString -}}
{{- tpl .Values.garage.garageTomlString . -}}
{{- else -}}
metadata_dir = "/var/lib/garage/meta"
data_dir = "/var/lib/garage/data"

db_engine = "{{ .Values.garage.dbEngine }}"
block_size = "{{ .Values.garage.blockSize }}"

replication_factor = {{ .Values.garage.replicationFactor }}
consistency_mode = "{{ .Values.garage.consistencyMode }}"
compression_level = {{ .Values.garage.compressionLevel }}

{{- if .Values.garage.metadataAutoSnapshotInterval }}
metadata_auto_snapshot_interval = "{{ .Values.garage.metadataAutoSnapshotInterval }}"
{{- end }}

rpc_bind_addr = "{{ .Values.garage.rpcBindAddr }}"
{{- if .Values.garage.rpcPublicAddr }}
rpc_public_addr = "{{ .Values.garage.rpcPublicAddr }}"
{{- end }}
{{- if .Values.garage.rpcPublicAddrSubnet }}
rpc_public_addr_subnet = "{{ .Values.garage.rpcPublicAddrSubnet }}"
{{- end }}

bootstrap_peers = [
{{- range $index, $peer := .Values.garage.bootstrapPeers }}
{{- if $index}}, {{ end }}{{ $peer | quote }}
{{- end }}
]

{{- if .Values.garage.additionalTopLevelConfig }}
{{ tpl .Values.garage.additionalTopLevelConfig . }}
{{- end }}

{{- if .Values.garage.kubernetesDiscovery.enabled }}
[kubernetes_discovery]
namespace = "{{ include "garage.kubernetesDiscoveryNamespace" . }}"
service_name = "{{ include "garage.kubernetesDiscoveryServiceName" . }}"
skip_crd = {{ .Values.garage.kubernetesDiscovery.skipCrd }}
{{- end }}

[s3_api]
api_bind_addr = "{{ .Values.garage.s3Api.bindAddr }}"
s3_region = "{{ .Values.garage.s3Api.region }}"
root_domain = "{{ .Values.garage.s3Api.rootDomain }}"

{{- if .Values.garage.s3Web.enabled }}
[s3_web]
bind_addr = "{{ .Values.garage.s3Web.bindAddr }}"
root_domain = "{{ .Values.garage.s3Web.rootDomain }}"
index = "{{ .Values.garage.s3Web.index }}"
add_host_to_metrics = {{ .Values.garage.s3Web.addHostToMetrics }}
{{- end }}

{{- if .Values.garage.admin.enabled }}
[admin]
api_bind_addr = "{{ .Values.garage.admin.apiBindAddr }}"
metrics_require_token = {{ .Values.garage.admin.metricsRequireToken }}
{{- if .Values.garage.admin.traceSink }}
trace_sink = "{{ .Values.garage.admin.traceSink }}"
{{- end }}
{{- end }}
{{- end -}}
{{- end }}

{{/* Pod annotation checksum for config source. */}}
{{- define "garage.configChecksum" -}}
{{- if .Values.garage.existingConfigMap.name -}}
{{- $fallback := printf "%s/%s" .Values.garage.existingConfigMap.name .Values.garage.existingConfigMap.key -}}
{{- $existingConfigMap := lookup "v1" "ConfigMap" .Release.Namespace .Values.garage.existingConfigMap.name -}}
{{- if $existingConfigMap -}}
  {{- $configValue := default "" (index $existingConfigMap.data .Values.garage.existingConfigMap.key) -}}
  {{- if $configValue -}}
{{- $configValue | sha256sum -}}
  {{- else -}}
{{- $fallback | sha256sum -}}
  {{- end -}}
{{- else -}}
{{- $fallback | sha256sum -}}
{{- end -}}
{{- else -}}
{{- include "garage.generatedConfig" . | sha256sum -}}
{{- end -}}
{{- end }}

{{/* Pod annotation checksum for auth secret source. */}}
{{- define "garage.secretChecksum" -}}
{{- if .Values.secrets.existingSecret.name -}}
{{- $fallback := printf "%s/%s/%s/%s" .Values.secrets.existingSecret.name .Values.secrets.existingSecret.keys.rpcSecret .Values.secrets.existingSecret.keys.adminToken .Values.secrets.existingSecret.keys.metricsToken -}}
{{- $existingSecret := lookup "v1" "Secret" .Release.Namespace .Values.secrets.existingSecret.name -}}
{{- if $existingSecret -}}
  {{- $rpc := default "" (index $existingSecret.data .Values.secrets.existingSecret.keys.rpcSecret) -}}
  {{- $admin := default "" (index $existingSecret.data .Values.secrets.existingSecret.keys.adminToken) -}}
  {{- $metrics := default "" (index $existingSecret.data .Values.secrets.existingSecret.keys.metricsToken) -}}
{{- printf "%s|%s|%s" $rpc $admin $metrics | sha256sum -}}
{{- else -}}
{{- $fallback | sha256sum -}}
{{- end -}}
{{- else -}}
{{- toJson .Values.secrets | sha256sum -}}
{{- end -}}
{{- end }}
