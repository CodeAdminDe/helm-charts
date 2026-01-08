{{- define "coturn-server.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "coturn-server.fullname" -}}
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

{{- define "coturn-server.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "coturn-server.labels" -}}
helm.sh/chart: {{ include "coturn-server.chart" . }}
{{ include "coturn-server.selectorLabels" . }}
{{ if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{ end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "coturn-server.selectorLabels" }}
app.kubernetes.io/name: {{ include "coturn-server.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "coturn-server.serviceAccountName" -}}
{{- if .Values.rbac.serviceAccount.create }}
{{- default (include "coturn-server.fullname" .) .Values.rbac.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.rbac.serviceAccount.name }}
{{- end }}
{{- end }}


{{/* PVC definition for existingClaim, shipped or emptyDir*/}}
{{- define "common.app.turn.pvc" -}}
{{- if .Values.turn.persistence.enabled -}}
{{- if .Values.turn.persistence.existingClaim -}}
- name: {{ .Release.Name }}-turn-data
  persistentVolumeClaim:
      claimName: {{ .Values.turn.persistence.existingClaim -}}
{{- else -}}
- name: {{ .Release.Name }}-turn-data
  persistentVolumeClaim:
    claimName: {{ .Release.Name }}-turn-data
{{- end -}}
{{- else -}}
- name: {{ .Release.Name }}-turn-data
  emptyDir:
    sizeLimit: {{ .Values.turn.persistence.emptyDirSizeLimit }}
{{- end -}}
{{- end -}}
