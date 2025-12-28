{{- define "netbird-management.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "netbird-management.fullname" -}}
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

{{- define "netbird-management.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "netbird-management.labels" -}}
helm.sh/chart: {{ include "netbird-management.chart" . }}
{{ include "netbird-management.selectorLabels" . }}
{{ if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{ end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "netbird-management.selectorLabels" }}
app.kubernetes.io/name: {{ include "netbird-management.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "netbird-management.serviceAccountName" -}}
{{- if .Values.rbac.serviceAccount.create }}
{{- default (include "netbird-management.fullname" .) .Values.rbac.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.rbac.serviceAccount.name }}
{{- end }}
{{- end }}
