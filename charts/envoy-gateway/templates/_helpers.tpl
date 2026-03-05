{{/* Expand chart name */}}
{{- define "envoy-gateway.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Fully qualified name */}}
{{- define "envoy-gateway.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/* Chart label */}}
{{- define "envoy-gateway.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Common labels */}}
{{- define "envoy-gateway.labels" -}}
helm.sh/chart: {{ include "envoy-gateway.chart" . }}
{{ include "envoy-gateway.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* Selector labels */}}
{{- define "envoy-gateway.selectorLabels" -}}
app.kubernetes.io/name: {{ include "envoy-gateway.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/* Bootstrap GatewayClass name */}}
{{- define "envoy-gateway.bootstrap.gatewayClassName" -}}
{{- .Values.bootstrap.gatewayClass.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Bootstrap EnvoyProxy name */}}
{{- define "envoy-gateway.bootstrap.envoyProxyName" -}}
{{- .Values.bootstrap.envoyProxy.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Bootstrap Gateway name */}}
{{- define "envoy-gateway.bootstrap.gatewayName" -}}
{{- .Values.bootstrap.gateway.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Bootstrap EnvoyProxy namespace */}}
{{- define "envoy-gateway.bootstrap.envoyProxyNamespace" -}}
{{- default .Release.Namespace .Values.bootstrap.envoyProxy.namespace -}}
{{- end -}}

{{/* Bootstrap Gateway namespace */}}
{{- define "envoy-gateway.bootstrap.gatewayNamespace" -}}
{{- default .Release.Namespace .Values.bootstrap.gateway.namespace -}}
{{- end -}}
