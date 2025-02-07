{{/*
Expand the name of the chart.
*/}}
{{- define "bind9-hidden-primary.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "bind9-hidden-primary.fullname" -}}
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

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "bind9-hidden-primary.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "bind9-hidden-primary.labels" -}}
helm.sh/chart: {{ include "bind9-hidden-primary.chart" . }}
{{ include "bind9-hidden-primary.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "bind9-hidden-primary.selectorLabels" -}}
app.kubernetes.io/name: {{ include "bind9-hidden-primary.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "bind9-hidden-primary.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "bind9-hidden-primary.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* PVC definition for existingClaim, shipped or emptyDir*/}}
{{- define "common.app.pvc" -}}
{{- if .Values.persistence.enabled -}}
{{- if .Values.persistence.existingClaim -}}
- name: {{ .Release.Name }}-data
  persistentVolumeClaim:
      claimName: {{ .Values.persistence.existingClaim -}}
{{- else -}}
- name: {{ .Release.Name }}-data
  persistentVolumeClaim:
    claimName: {{ .Release.Name }}-data
{{- end -}}
{{- else -}}
- name: {{ .Release.Name }}-data
  emptyDir:
    sizeLimit: {{ .Values.persistence.emptyDirSizeLimit }}
{{- end -}}
{{- end -}}
