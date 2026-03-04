{{/* Expand chart name. */}}
{{- define "kagent.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "kagent.fullname" -}}
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

{{/* Chart label helper. */}}
{{- define "kagent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Common labels. */}}
{{- define "kagent.labels" -}}
helm.sh/chart: {{ include "kagent.chart" . }}
{{ include "kagent.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: kagent
{{- with .Values.labels }}
{{ toYaml . }}
{{- end }}
{{- end -}}

{{/* Selector labels shared by controller and UI. */}}
{{- define "kagent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "kagent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/* Controller labels. */}}
{{- define "kagent.controller.labels" -}}
{{ include "kagent.labels" . }}
app.kubernetes.io/component: controller
{{- end -}}

{{/* Controller selector labels. */}}
{{- define "kagent.controller.selectorLabels" -}}
{{ include "kagent.selectorLabels" . }}
app.kubernetes.io/component: controller
{{- end -}}

{{/* UI labels. */}}
{{- define "kagent.ui.labels" -}}
{{ include "kagent.labels" . }}
app.kubernetes.io/component: ui
{{- end -}}

{{/* UI selector labels. */}}
{{- define "kagent.ui.selectorLabels" -}}
{{ include "kagent.selectorLabels" . }}
app.kubernetes.io/component: ui
{{- end -}}

{{/* Namespace helper with optional override. */}}
{{- define "kagent.namespace" -}}
{{- default .Release.Namespace .Values.namespaceOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Service account name helper for controller. */}}
{{- define "kagent.controller.serviceAccountName" -}}
{{- if .Values.serviceAccount.controller.create -}}
{{- default (printf "%s-controller" (include "kagent.fullname" .) | trunc 63 | trimSuffix "-") .Values.serviceAccount.controller.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.controller.name -}}
{{- end -}}
{{- end -}}

{{/* Service account name helper for UI. */}}
{{- define "kagent.ui.serviceAccountName" -}}
{{- if .Values.serviceAccount.ui.create -}}
{{- default (printf "%s-ui" (include "kagent.fullname" .) | trunc 63 | trimSuffix "-") .Values.serviceAccount.ui.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.ui.name -}}
{{- end -}}
{{- end -}}

{{/* Suffix-safe name helper. */}}
{{- define "kagent.suffixName" -}}
{{- $base := index . 0 -}}
{{- $suffix := index . 1 -}}
{{- $base60 := $base | trunc 60 | trimSuffix "-" -}}
{{- printf "%s-%s" $base60 $suffix | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* RBAC resource names. */}}
{{- define "kagent.rbacGetterRoleName" -}}
{{- include "kagent.suffixName" (list (include "kagent.fullname" .) "getter") -}}
{{- end -}}

{{- define "kagent.rbacWriterRoleName" -}}
{{- include "kagent.suffixName" (list (include "kagent.fullname" .) "writer") -}}
{{- end -}}

{{- define "kagent.rbacLeaderElectionRoleName" -}}
{{- include "kagent.suffixName" (list (include "kagent.fullname" .) "leader") -}}
{{- end -}}

{{/* UI HTTPRoute name. */}}
{{- define "kagent.httpRouteName" -}}
{{- include "kagent.suffixName" (list (include "kagent.fullname" .) "ui-route") -}}
{{- end -}}

{{/* Resolve sqlite persistence claim name. */}}
{{- define "kagent.persistenceClaimName" -}}
{{- if .Values.persistence.existingClaim -}}
{{- .Values.persistence.existingClaim -}}
{{- else -}}
{{- include "kagent.suffixName" (list (include "kagent.fullname" .) "sqlite") -}}
{{- end -}}
{{- end -}}

{{/* Resolve CNPG app secret name. */}}
{{- define "kagent.cnpg.appConnectionSecretName" -}}
{{- if .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- else -}}
{{- printf "%s-app" .Values.database.useCnpgCluster.clusterName -}}
{{- end -}}
{{- end -}}

{{/* Default model config name. */}}
{{- define "kagent.defaultModelConfigName" -}}
{{- default "default-model-config" .Values.modelConfig.name -}}
{{- end -}}

{{/* Build A2A base URL. */}}
{{- define "kagent.a2aBaseUrl" -}}
{{- if .Values.controller.a2aBaseUrl -}}
{{- .Values.controller.a2aBaseUrl -}}
{{- else -}}
{{- printf "http://%s-controller.%s.svc.cluster.local:%d" (include "kagent.fullname" .) (include "kagent.namespace" .) (int .Values.controller.service.port) -}}
{{- end -}}
{{- end -}}

{{/* Build UI backend URL for NEXT_PUBLIC_BACKEND_URL. */}}
{{- define "kagent.ui.backendUrl" -}}
{{- if .Values.ui.backendUrl -}}
{{- .Values.ui.backendUrl -}}
{{- else -}}
{{- printf "http://%s-controller.%s.svc.cluster.local:%d/api" (include "kagent.fullname" .) (include "kagent.namespace" .) (int .Values.controller.service.port) -}}
{{- end -}}
{{- end -}}

{{/* Build controller image reference. */}}
{{- define "kagent.controller.image" -}}
{{- $registry := .Values.controller.image.registry | default .Values.global.registry -}}
{{- $tag := .Values.controller.image.tag | default .Values.global.tag | default .Chart.AppVersion -}}
{{- printf "%s/%s:%s" $registry .Values.controller.image.repository $tag -}}
{{- end -}}

{{/* Build UI image reference. */}}
{{- define "kagent.ui.image" -}}
{{- $registry := .Values.ui.image.registry | default .Values.global.registry -}}
{{- $tag := .Values.ui.image.tag | default .Values.global.tag | default .Chart.AppVersion -}}
{{- printf "%s/%s:%s" $registry .Values.ui.image.repository $tag -}}
{{- end -}}

{{/* Build WATCH_NAMESPACES value. */}}
{{- define "kagent.watchNamespaces" -}}
{{- .Values.controller.watchNamespaces | default list | uniq | join "," -}}
{{- end -}}

{{/* Leader election helper. */}}
{{- define "kagent.leaderElectionEnabled" -}}
{{- gt (int .Values.controller.replicas) 1 -}}
{{- end -}}
