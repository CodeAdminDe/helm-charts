{{/* Expand chart name. */}}
{{- define "coder.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "coder.fullname" -}}
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
{{- define "coder.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels. */}}
{{- define "coder.labels" -}}
helm.sh/chart: {{ include "coder.chart" . }}
{{ include "coder.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels. */}}
{{- define "coder.selectorLabels" -}}
app.kubernetes.io/name: {{ include "coder.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Component metadata label. */}}
{{- define "coder.componentLabels" -}}
app.kubernetes.io/component: {{ .component }}
{{- end }}

{{/* Component selector labels. */}}
{{- define "coder.componentSelectorLabels" -}}
{{- $root := .root -}}
{{- $component := .component -}}
{{ include "coder.selectorLabels" $root }}
app.kubernetes.io/component: {{ $component }}
{{- end }}

{{/* ServiceAccount name helper. */}}
{{- define "coder.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "coder.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Namespace helper for RBAC resources. */}}
{{- define "coder.rbacNamespace" -}}
{{- default .Release.Namespace .Values.rbac.namespace -}}
{{- end }}

{{/* Role name helper. */}}
{{- define "coder.rbacRoleName" -}}
{{- printf "%s-role" (include "coder.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Resolve CNPG app secret name. */}}
{{- define "coder.cnpg.appConnectionSecretName" -}}
{{- if .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- else -}}
{{- printf "%s-app" .Values.database.useCnpgCluster.clusterName -}}
{{- end -}}
{{- end }}

{{/* HTTPRoute name helper. */}}
{{- define "coder.httpRouteName" -}}
{{- printf "%s-route" (include "coder.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Role name helper for workspace provisioning. */}}
{{- define "coder.rbacWorkspaceRoleName" -}}
{{- printf "%s-workspace-perms" (include "coder.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Effective workspace namespace config map shared by Role and RoleBinding rendering. */}}
{{- define "coder.rbacNamespaceConfigs" -}}
{{- $rootPerms := .Values.rbac.workspacePerms | default false -}}
{{- $rootDeploy := and $rootPerms (.Values.rbac.enableDeployments | default false) -}}
{{- $rootExtra := .Values.rbac.extraRules | default (list) -}}
{{- $namespaceConfigs := dict -}}
{{- $_ := set $namespaceConfigs (include "coder.rbacNamespace" .) (dict "workspacePerms" $rootPerms "enableDeployments" $rootDeploy "extraRules" $rootExtra) -}}
{{- range $entry := (.Values.rbac.workspaceNamespaces | default (list)) -}}
  {{- $ns := "" -}}
  {{- $workspacePerms := $rootPerms -}}
  {{- $enableDeployments := $rootDeploy -}}
  {{- $extraRules := $rootExtra -}}
  {{- if kindIs "string" $entry -}}
    {{- $ns = $entry -}}
  {{- else if kindIs "map" $entry -}}
    {{- $ns = default "" (index $entry "name") -}}
    {{- if hasKey $entry "workspacePerms" -}}
      {{- $workspacePerms = (index $entry "workspacePerms") -}}
    {{- end -}}
    {{- if hasKey $entry "enableDeployments" -}}
      {{- $enableDeployments = and $workspacePerms (index $entry "enableDeployments") -}}
    {{- else -}}
      {{- $enableDeployments = and $workspacePerms $rootDeploy -}}
    {{- end -}}
    {{- if hasKey $entry "extraRules" -}}
      {{- $extraRules = default (list) (index $entry "extraRules") -}}
    {{- end -}}
  {{- end -}}
  {{- if $ns -}}
    {{- $_ := set $namespaceConfigs $ns (dict "workspacePerms" $workspacePerms "enableDeployments" $enableDeployments "extraRules" $extraRules) -}}
  {{- end -}}
{{- end -}}
{{- toJson $namespaceConfigs -}}
{{- end -}}

{{/* Main Coder image helper. */}}
{{- define "coder.image" -}}
{{- printf "%s:%s" .Values.image.repository (default .Chart.AppVersion .Values.image.tag) -}}
{{- end }}

{{/* Derived ingress URL scheme helper. */}}
{{- define "coder.ingressScheme" -}}
{{- if .Values.ingress.tls -}}
https
{{- else -}}
http
{{- end -}}
{{- end }}

{{/* Internal cluster fallback access URL. */}}
{{- define "coder.clusterAccessUrl" -}}
{{- $host := printf "%s.%s.svc.cluster.local" (include "coder.fullname" .) .Release.Namespace -}}
{{- if eq (int .Values.service.port) 80 -}}
{{- printf "http://%s" $host -}}
{{- else -}}
{{- printf "http://%s:%v" $host .Values.service.port -}}
{{- end -}}
{{- end }}

{{/* Derived public URL helper. */}}
{{- define "coder.publicUrl" -}}
{{- if .Values.coder.accessUrl -}}
{{- .Values.coder.accessUrl -}}
{{- else if and .Values.gatewayApi.enabled .Values.gatewayApi.hostnames (gt (len .Values.gatewayApi.hostnames) 0) -}}
{{- printf "%s://%s" .Values.gatewayApi.scheme (index .Values.gatewayApi.hostnames 0) -}}
{{- else if and .Values.ingress.enabled .Values.ingress.hosts (gt (len .Values.ingress.hosts) 0) -}}
{{- printf "%s://%s" (include "coder.ingressScheme" .) ((index .Values.ingress.hosts 0).host) -}}
{{- else -}}
{{- include "coder.clusterAccessUrl" . -}}
{{- end -}}
{{- end }}

{{/* Effective wildcard host shared by ingress and Gateway API. */}}
{{- define "coder.wildcardAccessHost" -}}
{{- if .Values.coder.wildcardAccessUrl -}}
{{- .Values.coder.wildcardAccessUrl -}}
{{- end -}}
{{- end }}

{{/* Effective ingress wildcard host. */}}
{{- define "coder.ingressWildcardHost" -}}
{{- if .Values.ingress.wildcardHost -}}
{{- .Values.ingress.wildcardHost -}}
{{- else -}}
{{- include "coder.wildcardAccessHost" . -}}
{{- end -}}
{{- end }}

{{/* Effective Gateway API wildcard host. */}}
{{- define "coder.gatewayWildcardHost" -}}
{{- if .Values.gatewayApi.wildcardHostname -}}
{{- .Values.gatewayApi.wildcardHostname -}}
{{- else -}}
{{- include "coder.wildcardAccessHost" . -}}
{{- end -}}
{{- end }}

{{/* Vendor-aligned basic workspace RBAC rules. */}}
{{- define "coder.rbac.rules.basic" -}}
- apiGroups: [""]
  resources: ["pods"]
  verbs:
    - create
    - delete
    - deletecollection
    - get
    - list
    - patch
    - update
    - watch
- apiGroups: [""]
  resources: ["persistentvolumeclaims"]
  verbs:
    - create
    - delete
    - deletecollection
    - get
    - list
    - patch
    - update
    - watch
{{- end }}

{{/* Vendor-aligned deployment RBAC rules. */}}
{{- define "coder.rbac.rules.deployments" -}}
- apiGroups:
    - apps
  resources:
    - deployments
  verbs:
    - create
    - delete
    - deletecollection
    - get
    - list
    - patch
    - update
    - watch
{{- end }}
