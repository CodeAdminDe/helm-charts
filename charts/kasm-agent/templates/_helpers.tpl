{{/*
Expand the name of the chart.
*/}}
{{- define "kasm-agent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "kasm-agent.fullname" -}}
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
{{- define "kasm-agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "kasm-agent.labels" -}}
helm.sh/chart: {{ include "kasm-agent.chart" . }}
{{ include "kasm-agent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels.
*/}}
{{- define "kasm-agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kasm-agent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use.
*/}}
{{- define "kasm-agent.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "kasm-agent.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Resolve image name.
*/}}
{{- define "kasm-agent.image" -}}
{{- printf "%s:%s" .Values.image.repository (default .Chart.AppVersion .Values.image.tag) -}}
{{- end }}

{{/*
Resolve effective docker host value.
*/}}
{{- define "kasm-agent.effectiveDockerHost" -}}
{{- if .Values.agent.dockerHost -}}
{{- .Values.agent.dockerHost -}}
{{- else if .Values.hostDocker.enabled -}}
{{- printf "unix://%s" .Values.hostDocker.socketMountPath -}}
{{- else -}}
{{- "" -}}
{{- end -}}
{{- end }}
