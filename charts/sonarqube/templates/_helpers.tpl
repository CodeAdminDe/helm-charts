{{/* Expand chart name. */}}
{{- define "sonarqube.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "sonarqube.fullname" -}}
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
{{- define "sonarqube.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels. */}}
{{- define "sonarqube.labels" -}}
helm.sh/chart: {{ include "sonarqube.chart" . }}
{{ include "sonarqube.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels. */}}
{{- define "sonarqube.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sonarqube.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Append a suffix while preserving it under Kubernetes' 63-char name limit. */}}
{{- define "sonarqube.nameWithSuffix" -}}
{{- $base := default "" .base -}}
{{- $suffix := default "" .suffix -}}
{{- $maxBase := int (max 1 (sub 63 (len $suffix))) -}}
{{- $trimmedBase := $base | trunc $maxBase | trimSuffix "-" -}}
{{- printf "%s%s" $trimmedBase $suffix | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* ServiceAccount name helper. */}}
{{- define "sonarqube.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sonarqube.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Namespace helper for RBAC resources. */}}
{{- define "sonarqube.rbacNamespace" -}}
{{- default .Release.Namespace .Values.rbac.namespace -}}
{{- end }}

{{/* Role name helper. */}}
{{- define "sonarqube.rbacRoleName" -}}
{{- include "sonarqube.nameWithSuffix" (dict "base" (include "sonarqube.fullname" .) "suffix" "-role") -}}
{{- end }}

{{/* HTTPRoute name helper. */}}
{{- define "sonarqube.httpRouteName" -}}
{{- include "sonarqube.nameWithSuffix" (dict "base" (include "sonarqube.fullname" .) "suffix" "-route") -}}
{{- end }}

{{/* PVC name helper for SonarQube data. */}}
{{- define "sonarqube.persistenceClaimName" -}}
{{- if .Values.persistence.existingClaim -}}
{{- .Values.persistence.existingClaim -}}
{{- else -}}
{{- include "sonarqube.nameWithSuffix" (dict "base" (include "sonarqube.fullname" .) "suffix" "-data") -}}
{{- end -}}
{{- end }}

{{/* PVC name helper for SonarQube extensions. */}}
{{- define "sonarqube.extensionsPersistenceClaimName" -}}
{{- if .Values.extensionsPersistence.existingClaim -}}
{{- .Values.extensionsPersistence.existingClaim -}}
{{- else -}}
{{- include "sonarqube.nameWithSuffix" (dict "base" (include "sonarqube.fullname" .) "suffix" "-extensions") -}}
{{- end -}}
{{- end }}

{{/* Image helper. */}}
{{- define "sonarqube.image" -}}
{{- printf "%s:%s" .Values.image.repository (default .Chart.AppVersion .Values.image.tag) -}}
{{- end }}

{{/* Resolve CNPG app secret name. */}}
{{- define "sonarqube.cnpg.appConnectionSecretName" -}}
{{- if .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- else -}}
{{- printf "%s-app" .Values.database.useCnpgCluster.clusterName -}}
{{- end -}}
{{- end }}

{{/* Effective JDBC host helper. */}}
{{- define "sonarqube.jdbcHost" -}}
{{- if .Values.database.useCnpgCluster.enabled -}}
{{- printf "%s-rw" .Values.database.useCnpgCluster.clusterName -}}
{{- else -}}
{{- .Values.database.postgres.host -}}
{{- end -}}
{{- end }}

{{/* Effective JDBC port helper. */}}
{{- define "sonarqube.jdbcPort" -}}
{{- if .Values.database.useCnpgCluster.enabled -}}
{{- printf "%v" .Values.database.useCnpgCluster.port -}}
{{- else -}}
{{- printf "%v" .Values.database.postgres.port -}}
{{- end -}}
{{- end }}

{{/* Effective JDBC sslmode helper. */}}
{{- define "sonarqube.jdbcSslMode" -}}
{{- if .Values.database.useCnpgCluster.enabled -}}
{{- .Values.database.useCnpgCluster.sslMode -}}
{{- else -}}
{{- .Values.database.postgres.sslMode -}}
{{- end -}}
{{- end }}

{{/* Effective JDBC URL helper. */}}
{{- define "sonarqube.jdbcUrl" -}}
{{- if .Values.database.jdbcUrl -}}
{{- .Values.database.jdbcUrl -}}
{{- else -}}
{{- printf "jdbc:postgresql://%s:%s/%s?sslmode=%s" (include "sonarqube.jdbcHost" .) (include "sonarqube.jdbcPort" .) .Values.database.postgres.name (include "sonarqube.jdbcSslMode" .) -}}
{{- end -}}
{{- end }}

{{/* Status probe path helper honoring webContext. */}}
{{- define "sonarqube.statusPath" -}}
{{- $context := default "/" .Values.sonarqube.webContext -}}
{{- if not (hasPrefix "/" $context) -}}
{{- $context = printf "/%s" $context -}}
{{- end -}}
{{- $normalized := trimSuffix "/" $context -}}
{{- if or (eq $normalized "") (eq $normalized "/") -}}
{{- printf "/api/system/status" -}}
{{- else -}}
{{- printf "%s/api/system/status" $normalized -}}
{{- end -}}
{{- end }}
