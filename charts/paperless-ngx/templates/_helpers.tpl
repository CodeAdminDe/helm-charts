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

{{/* Derived public URL scheme helper. */}}
{{- define "paperless-ngx.publicScheme" -}}
{{- $publicUrl := include "paperless-ngx.publicUrl" . -}}
{{- if $publicUrl -}}
{{- first (splitList "://" $publicUrl) -}}
{{- end -}}
{{- end }}

{{/* Derived PAPERLESS_APPS helper. */}}
{{- define "paperless-ngx.paperlessApps" -}}
{{- $apps := list -}}
{{- range .Values.paperless.additionalApps -}}
  {{- if . -}}
    {{- $apps = append $apps . -}}
  {{- end -}}
{{- end -}}
{{- if .Values.paperless.auth.oidc.enabled -}}
{{- $apps = append $apps "allauth.socialaccount.providers.openid_connect" -}}
{{- end -}}
{{- if gt (len $apps) 0 -}}
{{- join "," (uniq $apps) -}}
{{- end -}}
{{- end }}

{{/* Derived account default protocol helper. */}}
{{- define "paperless-ngx.accountDefaultHttpProtocol" -}}
{{- if .Values.paperless.auth.accountDefaultHttpProtocol -}}
{{- .Values.paperless.auth.accountDefaultHttpProtocol -}}
{{- else if .Values.paperless.auth.oidc.enabled -}}
{{- include "paperless-ngx.publicScheme" . -}}
{{- end -}}
{{- end }}

{{/* Logo asset mount path under the Paperless media tree. */}}
{{- define "paperless-ngx.logoMountPath" -}}
{{- printf "%s/logo" .Values.persistence.media.mountPath -}}
{{- end }}

{{/* Public Paperless app logo path. */}}
{{- define "paperless-ngx.appLogoPath" -}}
{{- if and .Values.paperless.branding.logo.fileName (or .Values.paperless.branding.logo.existingSecret.name .Values.paperless.branding.logo.existingConfigMap.name) -}}
{{- printf "/logo/%s" .Values.paperless.branding.logo.fileName -}}
{{- end -}}
{{- end }}

{{/* Secret name helper for OIDC provider config. */}}
{{- define "paperless-ngx.oidcSecretName" -}}
{{- if .Values.paperless.auth.oidc.existingSecret.name -}}
{{- .Values.paperless.auth.oidc.existingSecret.name -}}
{{- else -}}
{{- printf "%s-oidc" (include "paperless-ngx.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/* Secret key helper for OIDC provider config. */}}
{{- define "paperless-ngx.oidcSecretKeyName" -}}
{{- default "PAPERLESS_SOCIALACCOUNT_PROVIDERS" .Values.paperless.auth.oidc.existingSecret.key -}}
{{- end }}

{{/* Generated django-allauth OpenID Connect provider JSON. */}}
{{- define "paperless-ngx.oidcProvidersConfig" -}}
{{- $oidc := .Values.paperless.auth.oidc -}}
{{- $scope := $oidc.provider.scope | default (list) -}}
{{- if and $oidc.syncGroups (not (has "groups" $scope)) -}}
{{- $scope = append $scope "groups" -}}
{{- end -}}
{{- $providerConfig := dict -}}
{{- if gt (len $scope) 0 -}}
{{- $_ := set $providerConfig "SCOPE" $scope -}}
{{- end -}}
{{- $_ := set $providerConfig "OAUTH_PKCE_ENABLED" $oidc.provider.usePkce -}}
{{- with $oidc.provider.extraProviderConfig -}}
  {{- range $k, $v := . -}}
    {{- $_ := set $providerConfig $k $v -}}
  {{- end -}}
{{- end -}}
{{- $settings := dict "server_url" $oidc.provider.serverUrl "fetch_userinfo" $oidc.provider.fetchUserInfo -}}
{{- with $oidc.provider.tokenAuthMethod -}}
{{- $_ := set $settings "token_auth_method" . -}}
{{- end -}}
{{- with $oidc.provider.extraSettings -}}
  {{- range $k, $v := . -}}
    {{- $_ := set $settings $k $v -}}
  {{- end -}}
{{- end -}}
{{- $app := dict "provider_id" $oidc.provider.providerId "name" $oidc.provider.name "client_id" $oidc.provider.clientId "secret" $oidc.provider.clientSecret "settings" $settings -}}
{{- with $oidc.provider.extraAppConfig -}}
  {{- range $k, $v := . -}}
    {{- $_ := set $app $k $v -}}
  {{- end -}}
{{- end -}}
{{- $_ := set $providerConfig "APPS" (list $app) -}}
{{- toJson (dict "openid_connect" $providerConfig) -}}
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
