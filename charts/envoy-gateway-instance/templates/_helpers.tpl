{{/* Expand chart name */}}
{{- define "envoy-gateway-instance.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Fully qualified name */}}
{{- define "envoy-gateway-instance.fullname" -}}
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
{{- define "envoy-gateway-instance.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Common labels */}}
{{- define "envoy-gateway-instance.labels" -}}
helm.sh/chart: {{ include "envoy-gateway-instance.chart" . }}
{{ include "envoy-gateway-instance.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/* Selector labels */}}
{{- define "envoy-gateway-instance.selectorLabels" -}}
app.kubernetes.io/name: {{ include "envoy-gateway-instance.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/* EnvoyProxy name */}}
{{- define "envoy-gateway-instance.envoyProxyName" -}}
{{- default (printf "%s-proxy" (include "envoy-gateway-instance.fullname" .)) .Values.envoyProxy.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* EnvoyProxy namespace */}}
{{- define "envoy-gateway-instance.envoyProxyNamespace" -}}
{{- default .Release.Namespace .Values.envoyProxy.namespace -}}
{{- end -}}

{{/* Gateway name */}}
{{- define "envoy-gateway-instance.gatewayName" -}}
{{- default (include "envoy-gateway-instance.fullname" .) .Values.gateway.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Gateway namespace */}}
{{- define "envoy-gateway-instance.gatewayNamespace" -}}
{{- default .Release.Namespace .Values.gateway.namespace -}}
{{- end -}}

{{/* Gateway mode */}}
{{- define "envoy-gateway-instance.gatewayMode" -}}
{{- default "raw" .Values.gateway.mode -}}
{{- end -}}

{{/* Gateway infrastructure parametersRef name */}}
{{- define "envoy-gateway-instance.gatewayParametersRefName" -}}
{{- if .Values.gateway.infrastructure.parametersRef.name -}}
{{- .Values.gateway.infrastructure.parametersRef.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- include "envoy-gateway-instance.envoyProxyName" . -}}
{{- end -}}
{{- end -}}

{{/* HTTP redirect route name */}}
{{- define "envoy-gateway-instance.httpRedirectRouteName" -}}
{{- if .Values.gateway.tls.redirectHttpToHttps.name -}}
{{- .Values.gateway.tls.redirectHttpToHttps.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-http-to-https" (include "envoy-gateway-instance.gatewayName" . | trunc 48 | trimSuffix "-") | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
