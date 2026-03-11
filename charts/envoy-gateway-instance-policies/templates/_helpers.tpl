{{- define "envoy-gateway-instance-policies.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "envoy-gateway-instance-policies.fullname" -}}
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

{{- define "envoy-gateway-instance-policies.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "envoy-gateway-instance-policies.labels" -}}
helm.sh/chart: {{ include "envoy-gateway-instance-policies.chart" . }}
{{ include "envoy-gateway-instance-policies.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "envoy-gateway-instance-policies.selectorLabels" -}}
app.kubernetes.io/name: {{ include "envoy-gateway-instance-policies.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "envoy-gateway-instance-policies.itemEnabled" -}}
{{- $item := index . 0 -}}
{{- if hasKey $item "enabled" -}}
{{- $item.enabled -}}
{{- else -}}
true
{{- end -}}
{{- end }}

{{- define "envoy-gateway-instance-policies.itemLabels" -}}
{{- $root := index . 0 -}}
{{- $item := index . 1 -}}
{{- $labels := dict -}}
{{- $labels = mergeOverwrite $labels (fromYaml (include "envoy-gateway-instance-policies.labels" $root)) -}}
{{- with $root.Values.policyMetadata.labels }}
  {{- $labels = mergeOverwrite $labels . -}}
{{- end }}
{{- with $item.labels }}
  {{- $labels = mergeOverwrite $labels . -}}
{{- end }}
{{- toYaml $labels -}}
{{- end }}

{{- define "envoy-gateway-instance-policies.itemAnnotations" -}}
{{- $root := index . 0 -}}
{{- $item := index . 1 -}}
{{- $annotations := dict -}}
{{- with $root.Values.policyMetadata.annotations }}
  {{- $annotations = mergeOverwrite $annotations . -}}
{{- end }}
{{- with $item.annotations }}
  {{- $annotations = mergeOverwrite $annotations . -}}
{{- end }}
{{- if $annotations -}}
{{- toYaml $annotations -}}
{{- end -}}
{{- end }}
