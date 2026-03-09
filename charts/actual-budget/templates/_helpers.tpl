{{/* Expand chart name. */}}
{{- define "actual-budget.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "actual-budget.fullname" -}}
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
{{- define "actual-budget.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels. */}}
{{- define "actual-budget.labels" -}}
helm.sh/chart: {{ include "actual-budget.chart" . }}
{{ include "actual-budget.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels. */}}
{{- define "actual-budget.selectorLabels" -}}
app.kubernetes.io/name: {{ include "actual-budget.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* ServiceAccount name helper. */}}
{{- define "actual-budget.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "actual-budget.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Namespace helper for RBAC resources. */}}
{{- define "actual-budget.rbacNamespace" -}}
{{- default .Release.Namespace .Values.rbac.namespace -}}
{{- end }}

{{/* Role name helper. */}}
{{- define "actual-budget.rbacRoleName" -}}
{{- printf "%s-role" (include "actual-budget.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* HTTPRoute name helper. */}}
{{- define "actual-budget.httpRouteName" -}}
{{- printf "%s-route" (include "actual-budget.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Resolve CNPG app secret name. */}}
{{- define "actual-budget.cnpg.appConnectionSecretName" -}}
{{- if .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- else -}}
{{- printf "%s-app" .Values.database.useCnpgCluster.clusterName -}}
{{- end -}}
{{- end }}
