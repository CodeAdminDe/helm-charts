{{/* Expand chart name. */}}
{{- define "agent-zero.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "agent-zero.fullname" -}}
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
{{- define "agent-zero.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels. */}}
{{- define "agent-zero.labels" -}}
helm.sh/chart: {{ include "agent-zero.chart" . }}
{{ include "agent-zero.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels. */}}
{{- define "agent-zero.selectorLabels" -}}
app.kubernetes.io/name: {{ include "agent-zero.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* ServiceAccount name helper. */}}
{{- define "agent-zero.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "agent-zero.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Namespace helper for RBAC resources. */}}
{{- define "agent-zero.rbacNamespace" -}}
{{- default .Release.Namespace .Values.rbac.namespace -}}
{{- end }}

{{/* Role name helper. */}}
{{- define "agent-zero.rbacRoleName" -}}
{{- printf "%s-role" (include "agent-zero.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Image helper. */}}
{{- define "agent-zero.image" -}}
{{- printf "%s:%s" .Values.image.repository (default .Chart.AppVersion .Values.image.tag) -}}
{{- end }}

{{/* PVC name helper for /a0 data. */}}
{{- define "agent-zero.persistenceClaimName" -}}
{{- if .Values.persistence.existingClaim -}}
{{- .Values.persistence.existingClaim -}}
{{- else -}}
{{- printf "%s-data" (include "agent-zero.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/* HTTPRoute name helper. */}}
{{- define "agent-zero.httpRouteName" -}}
{{- printf "%s-route" (include "agent-zero.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* VPN provider helper. */}}
{{- define "agent-zero.vpn.provider" -}}
{{- default "none" .Values.vpn.provider -}}
{{- end -}}

{{/* NetBird sidecar toggle helper. */}}
{{- define "agent-zero.vpn.netbird.enabled" -}}
{{- if eq (include "agent-zero.vpn.provider" .) "netbird" -}}
true
{{- else -}}
false
{{- end -}}
{{- end -}}

{{/* NetBird image helper. */}}
{{- define "agent-zero.vpn.netbird.image" -}}
{{- printf "%s:%s" .Values.vpn.netbird.image.repository .Values.vpn.netbird.image.tag -}}
{{- end -}}

{{/* NetBird SOCKS5 proxy URL helper. */}}
{{- define "agent-zero.vpn.netbird.socksProxyUrl" -}}
{{- if .Values.vpn.netbird.proxyEnv.proxyUrl -}}
{{- .Values.vpn.netbird.proxyEnv.proxyUrl -}}
{{- else -}}
{{- printf "socks5://127.0.0.1:%v" .Values.vpn.netbird.socks5.port -}}
{{- end -}}
{{- end -}}

{{/* NetBird state PVC helper. */}}
{{- define "agent-zero.vpn.netbird.stateClaimName" -}}
{{- if .Values.vpn.netbird.persistence.existingClaim -}}
{{- .Values.vpn.netbird.persistence.existingClaim -}}
{{- else -}}
{{- printf "%s-netbird-state" (include "agent-zero.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
