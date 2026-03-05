{{/* Expand chart name. */}}
{{- define "anything-llm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "anything-llm.fullname" -}}
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
{{- define "anything-llm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels. */}}
{{- define "anything-llm.labels" -}}
helm.sh/chart: {{ include "anything-llm.chart" . }}
{{ include "anything-llm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels. */}}
{{- define "anything-llm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "anything-llm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* ServiceAccount name helper. */}}
{{- define "anything-llm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "anything-llm.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Namespace helper for RBAC resources. */}}
{{- define "anything-llm.rbacNamespace" -}}
{{- default .Release.Namespace .Values.rbac.namespace -}}
{{- end }}

{{/* Role name helper. */}}
{{- define "anything-llm.rbacRoleName" -}}
{{- printf "%s-role" (include "anything-llm.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* PVC name helper for storage data. */}}
{{- define "anything-llm.persistenceClaimName" -}}
{{- if .Values.persistence.existingClaim -}}
{{- .Values.persistence.existingClaim -}}
{{- else -}}
{{- printf "%s-data" (include "anything-llm.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/* HTTPRoute name helper. */}}
{{- define "anything-llm.httpRouteName" -}}
{{- printf "%s-route" (include "anything-llm.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Secret name helper. */}}
{{- define "anything-llm.secretName" -}}
{{- if .Values.secrets.create -}}
{{- default (printf "%s-secrets" (include "anything-llm.fullname" .)) .Values.secrets.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Values.secrets.existingSecret -}}
{{- end -}}
{{- end }}

{{/* Image tag helper honoring postgres mode defaults. */}}
{{- define "anything-llm.imageTag" -}}
{{- if eq (default "sqlite" .Values.database.mode) "postgres" -}}
{{- default "pg" .Values.image.postgresTag -}}
{{- else -}}
{{- default .Chart.AppVersion .Values.image.tag -}}
{{- end -}}
{{- end }}

{{/* Image helper. */}}
{{- define "anything-llm.image" -}}
{{- printf "%s:%s" .Values.image.repository (include "anything-llm.imageTag" .) -}}
{{- end }}

{{/* Resolve CNPG app secret name. */}}
{{- define "anything-llm.cnpg.appConnectionSecretName" -}}
{{- if .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- else -}}
{{- printf "%s-app" .Values.database.useCnpgCluster.clusterName -}}
{{- end -}}
{{- end }}
