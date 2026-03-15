{{/* Expand chart name. */}}
{{- define "derper.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "derper.fullname" -}}
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
{{- define "derper.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels. */}}
{{- define "derper.labels" -}}
helm.sh/chart: {{ include "derper.chart" . }}
{{ include "derper.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels. */}}
{{- define "derper.selectorLabels" -}}
app.kubernetes.io/name: {{ include "derper.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: derper
{{- end }}

{{/* Full image reference helper. */}}
{{- define "derper.image" -}}
{{- printf "%s:%s" .Values.image.repository (.Values.image.tag | default .Chart.AppVersion) -}}
{{- end }}

{{/* ServiceAccount name helper. */}}
{{- define "derper.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "derper.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Append a suffix while preserving it under Kubernetes' 63-char limit. */}}
{{- define "derper.nameWithSuffix" -}}
{{- $base := default "" .base -}}
{{- $suffix := default "" .suffix -}}
{{- $maxBase := int (max 1 (sub 63 (len $suffix))) -}}
{{- $trimmedBase := $base | trunc $maxBase | trimSuffix "-" -}}
{{- printf "%s%s" $trimmedBase $suffix | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* PVC name helper. */}}
{{- define "derper.persistenceClaimName" -}}
{{- if .Values.persistence.existingClaim -}}
{{- .Values.persistence.existingClaim -}}
{{- else -}}
{{- include "derper.nameWithSuffix" (dict "base" (include "derper.fullname" .) "suffix" "-data") -}}
{{- end -}}
{{- end }}

{{/* Safe filename base for manual cert files, aligned with derper upstream. */}}
{{- define "derper.manualCertBaseName" -}}
{{- regexReplaceAll "[^a-zA-Z0-9-.]" .Values.derper.hostname "" -}}
{{- end -}}

{{/* Manual certificate filename helper. */}}
{{- define "derper.manualCertCrtFile" -}}
{{- printf "%s.crt" (include "derper.manualCertBaseName" .) -}}
{{- end }}

{{/* Manual key filename helper. */}}
{{- define "derper.manualCertKeyFile" -}}
{{- printf "%s.key" (include "derper.manualCertBaseName" .) -}}
{{- end }}

{{/* Mesh secret mount directory. */}}
{{- define "derper.meshPskMountDir" -}}
/var/run/derper-secrets
{{- end }}

{{/* Mesh PSK file path helper. */}}
{{- define "derper.meshPskFile" -}}
{{- printf "%s/%s" (include "derper.meshPskMountDir" .) "mesh-psk" -}}
{{- end }}
