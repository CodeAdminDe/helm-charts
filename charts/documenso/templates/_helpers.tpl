{{/* Expand chart name. */}}
{{- define "documenso.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "documenso.fullname" -}}
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
{{- define "documenso.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels. */}}
{{- define "documenso.labels" -}}
helm.sh/chart: {{ include "documenso.chart" . }}
{{ include "documenso.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels. */}}
{{- define "documenso.selectorLabels" -}}
app.kubernetes.io/name: {{ include "documenso.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Component metadata label. */}}
{{- define "documenso.componentLabels" -}}
app.kubernetes.io/component: {{ .component }}
{{- end }}

{{/* Component selector labels. */}}
{{- define "documenso.componentSelectorLabels" -}}
{{- $root := .root -}}
{{- $component := .component -}}
{{ include "documenso.selectorLabels" $root }}
app.kubernetes.io/component: {{ $component }}
{{- end }}

{{/* ServiceAccount name helper. */}}
{{- define "documenso.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "documenso.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Namespace helper for RBAC resources. */}}
{{- define "documenso.rbacNamespace" -}}
{{- default .Release.Namespace .Values.rbac.namespace -}}
{{- end }}

{{/* Role name helper. */}}
{{- define "documenso.rbacRoleName" -}}
{{- printf "%s-role" (include "documenso.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* ConfigMap name helper. */}}
{{- define "documenso.configMapName" -}}
{{- printf "%s-config" (include "documenso.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Generated/app secret name helper. */}}
{{- define "documenso.securitySecretName" -}}
{{- if .Values.securitySecrets.create -}}
  {{- if .Values.securitySecrets.name -}}
    {{- .Values.securitySecrets.name -}}
  {{- else -}}
    {{- printf "%s-secrets" (include "documenso.fullname" .) | trunc 63 | trimSuffix "-" -}}
  {{- end -}}
{{- else -}}
  {{- .Values.securitySecrets.existingSecret -}}
{{- end -}}
{{- end }}

{{/* HTTPRoute name helper. */}}
{{- define "documenso.httpRouteName" -}}
{{- printf "%s-route" (include "documenso.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Resolve CNPG app secret name. */}}
{{- define "documenso.cnpg.appConnectionSecretName" -}}
{{- if .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- else -}}
{{- printf "%s-app" .Values.database.useCnpgCluster.clusterName -}}
{{- end -}}
{{- end }}

{{/* Build the public Documenso URL from explicit value or exposure settings. */}}
{{- define "documenso.publicUrl" -}}
{{- if .Values.documenso.url -}}
{{- .Values.documenso.url -}}
{{- else if and .Values.gatewayApi.enabled .Values.gatewayApi.hostnames (gt (len .Values.gatewayApi.hostnames) 0) -}}
{{- printf "%s://%s" (.Values.gatewayApi.scheme | default "https") (index .Values.gatewayApi.hostnames 0) -}}
{{- else if and .Values.ingress.enabled .Values.ingress.hosts (gt (len .Values.ingress.hosts) 0) -}}
{{- $scheme := "http" -}}
{{- if .Values.ingress.tls -}}
{{- $scheme = "https" -}}
{{- end -}}
{{- printf "%s://%s" $scheme (index .Values.ingress.hosts 0).host -}}
{{- else -}}
{{- .Values.documenso.internalWebappUrl -}}
{{- end -}}
{{- end }}
