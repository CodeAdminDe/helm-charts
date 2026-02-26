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


{{/* PVC definition for existingClaim, shipped or emptyDir*/}}
{{- define "common.app.management.pvc" -}}
{{- if .Values.management.persistence.enabled -}}
{{- if .Values.management.persistence.existingClaim -}}
- name: {{ .Release.Name }}-management-data
  persistentVolumeClaim:
      claimName: {{ .Values.management.persistence.existingClaim -}}
{{- else -}}
- name: {{ .Release.Name }}-management-data
  persistentVolumeClaim:
    claimName: {{ .Release.Name }}-management-data
{{- end -}}
{{- else -}}
- name: {{ .Release.Name }}-management-data
  emptyDir:
    sizeLimit: {{ .Values.management.persistence.emptyDirSizeLimit }}
{{- end -}}
{{- end -}}
{{- define "common.app.signal.pvc" -}}
{{- if .Values.signal.persistence.enabled -}}
{{- if .Values.signal.persistence.existingClaim -}}
- name: {{ .Release.Name }}-signal-data
  persistentVolumeClaim:
      claimName: {{ .Values.signal.persistence.existingClaim -}}
{{- else -}}
- name: {{ .Release.Name }}-signal-data
  persistentVolumeClaim:
    claimName: {{ .Release.Name }}-signal-data
{{- end -}}
{{- else -}}
- name: {{ .Release.Name }}-signal-data
  emptyDir:
    sizeLimit: {{ .Values.signal.persistence.emptyDirSizeLimit }}
{{- end -}}
{{- end -}}
