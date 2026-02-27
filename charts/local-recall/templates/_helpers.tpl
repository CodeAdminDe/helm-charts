{{/* Expand chart name. */}}
{{- define "local-recall.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "local-recall.fullname" -}}
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
{{- define "local-recall.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels. */}}
{{- define "local-recall.labels" -}}
helm.sh/chart: {{ include "local-recall.chart" . }}
{{ include "local-recall.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels. */}}
{{- define "local-recall.selectorLabels" -}}
app.kubernetes.io/name: {{ include "local-recall.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* ServiceAccount name helper. */}}
{{- define "local-recall.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "local-recall.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Namespace helper for RBAC resources. */}}
{{- define "local-recall.rbacNamespace" -}}
{{- default .Release.Namespace .Values.rbac.namespace -}}
{{- end }}

{{/* Role name helper. */}}
{{- define "local-recall.rbacRoleName" -}}
{{- printf "%s-role" (include "local-recall.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* PVC name helper for state data. */}}
{{- define "local-recall.persistenceClaimName" -}}
{{- if .Values.persistence.existingClaim -}}
{{- .Values.persistence.existingClaim -}}
{{- else -}}
{{- printf "%s-data" (include "local-recall.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/* HTTPRoute name helper. */}}
{{- define "local-recall.httpRouteName" -}}
{{- printf "%s-route" (include "local-recall.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Image helper. */}}
{{- define "local-recall.image" -}}
{{- printf "%s:%s" .Values.image.repository (default .Chart.AppVersion .Values.image.tag) -}}
{{- end }}

{{/* Resolve CNPG app secret name. */}}
{{- define "local-recall.cnpg.appConnectionSecretName" -}}
{{- if .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- else -}}
{{- printf "%s-app" .Values.database.useCnpgCluster.clusterName -}}
{{- end -}}
{{- end }}
