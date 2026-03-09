{{/* Expand chart name. */}}
{{- define "paperless-ngx.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "paperless-ngx.fullname" -}}
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
{{- define "paperless-ngx.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels. */}}
{{- define "paperless-ngx.labels" -}}
helm.sh/chart: {{ include "paperless-ngx.chart" . }}
{{ include "paperless-ngx.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels. */}}
{{- define "paperless-ngx.selectorLabels" -}}
app.kubernetes.io/name: {{ include "paperless-ngx.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Component metadata label. */}}
{{- define "paperless-ngx.componentLabels" -}}
app.kubernetes.io/component: {{ .component }}
{{- end }}

{{/* Component selector labels. */}}
{{- define "paperless-ngx.componentSelectorLabels" -}}
{{- $root := .root -}}
{{- $component := .component -}}
{{ include "paperless-ngx.selectorLabels" $root }}
app.kubernetes.io/component: {{ $component }}
{{- end }}

{{/* ServiceAccount name helper. */}}
{{- define "paperless-ngx.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "paperless-ngx.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Namespace helper for RBAC resources. */}}
{{- define "paperless-ngx.rbacNamespace" -}}
{{- default .Release.Namespace .Values.rbac.namespace -}}
{{- end }}

{{/* Role name helper. */}}
{{- define "paperless-ngx.rbacRoleName" -}}
{{- printf "%s-role" (include "paperless-ngx.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Secret name helper for Paperless secret key. */}}
{{- define "paperless-ngx.secretName" -}}
{{- if .Values.paperless.secretKey.existingSecret.name -}}
{{- .Values.paperless.secretKey.existingSecret.name -}}
{{- else -}}
{{- printf "%s-app" (include "paperless-ngx.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/* Secret key helper for Paperless secret key. */}}
{{- define "paperless-ngx.secretKeyName" -}}
{{- default "PAPERLESS_SECRET_KEY" .Values.paperless.secretKey.existingSecret.key -}}
{{- end }}

{{/* Resolve CNPG app secret name. */}}
{{- define "paperless-ngx.cnpg.appConnectionSecretName" -}}
{{- if .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- else -}}
{{- printf "%s-app" .Values.database.useCnpgCluster.clusterName -}}
{{- end -}}
{{- end }}

{{/* Generic persistence claim name helper. */}}
{{- define "paperless-ngx.persistenceClaimName" -}}
{{- $root := .root -}}
{{- $name := .name -}}
{{- $cfg := index $root.Values.persistence $name -}}
{{- if $cfg.existingClaim -}}
{{- $cfg.existingClaim -}}
{{- else -}}
{{- printf "%s-%s" (include "paperless-ngx.fullname" $root) $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/* HTTPRoute name helper. */}}
{{- define "paperless-ngx.httpRouteName" -}}
{{- printf "%s-route" (include "paperless-ngx.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Main Paperless image helper. */}}
{{- define "paperless-ngx.image" -}}
{{- printf "%s:%s" .Values.image.repository (default .Chart.AppVersion .Values.image.tag) -}}
{{- end }}

{{/* Internal Gotenberg service name helper. */}}
{{- define "paperless-ngx.gotenbergServiceName" -}}
{{- printf "%s-gotenberg" (include "paperless-ngx.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Internal Tika service name helper. */}}
{{- define "paperless-ngx.tikaServiceName" -}}
{{- printf "%s-tika" (include "paperless-ngx.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Redis subchart fullname helper mirroring charts/redis/templates/_helpers.tpl. */}}
{{- define "paperless-ngx.redisFullname" -}}
{{- if .Values.redis.fullnameOverride -}}
{{- .Values.redis.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default "redis" .Values.redis.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end }}

{{/* Redis service name helper. */}}
{{- define "paperless-ngx.redisServiceName" -}}
{{- $fullname := include "paperless-ngx.redisFullname" . -}}
{{- if (default true .Values.redis.service.addBackwardsCompatibleMaster) -}}
{{- printf "%s-master" $fullname | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $fullname -}}
{{- end -}}
{{- end }}

{{/* Redis secret name helper mirroring charts/redis/templates/_helpers.tpl. */}}
{{- define "paperless-ngx.redisSecretName" -}}
{{- if .Values.redis.existingEnvSecret -}}
{{- .Values.redis.existingEnvSecret -}}
{{- else -}}
{{- printf "%s-redis" .Release.Name -}}
{{- end -}}
{{- end }}

{{/* Derived ingress URL scheme helper. */}}
{{- define "paperless-ngx.ingressScheme" -}}
{{- if .Values.ingress.tls -}}
https
{{- else -}}
http
{{- end -}}
{{- end }}

{{/* Derived public URL helper. */}}
{{- define "paperless-ngx.publicUrl" -}}
{{- if .Values.paperless.url -}}
{{- .Values.paperless.url -}}
{{- else if and .Values.gatewayApi.enabled .Values.gatewayApi.hostnames -}}
{{- printf "%s://%s" .Values.gatewayApi.scheme (first .Values.gatewayApi.hostnames) -}}
{{- else if and .Values.ingress.enabled .Values.ingress.hosts -}}
{{- printf "%s://%s" (include "paperless-ngx.ingressScheme" .) ((first .Values.ingress.hosts).host) -}}
{{- end -}}
{{- end }}

{{/* Internal or external Gotenberg endpoint helper. */}}
{{- define "paperless-ngx.gotenbergEndpoint" -}}
{{- if .Values.documentConversion.gotenbergEndpoint -}}
{{- .Values.documentConversion.gotenbergEndpoint -}}
{{- else -}}
{{- printf "http://%s:%v" (include "paperless-ngx.gotenbergServiceName" .) .Values.gotenberg.service.port -}}
{{- end -}}
{{- end }}

{{/* Internal or external Tika endpoint helper. */}}
{{- define "paperless-ngx.tikaEndpoint" -}}
{{- if .Values.documentConversion.tikaEndpoint -}}
{{- .Values.documentConversion.tikaEndpoint -}}
{{- else -}}
{{- printf "http://%s:%v" (include "paperless-ngx.tikaServiceName" .) .Values.tika.service.port -}}
{{- end -}}
{{- end }}
