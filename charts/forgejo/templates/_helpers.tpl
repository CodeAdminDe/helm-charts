{{/* Expand chart name. */}}
{{- define "forgejo.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Build fullname from release + chart name unless override is provided. */}}
{{- define "forgejo.fullname" -}}
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
{{- define "forgejo.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Common labels. */}}
{{- define "forgejo.labels" -}}
helm.sh/chart: {{ include "forgejo.chart" . }}
{{ include "forgejo.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Selector labels. */}}
{{- define "forgejo.selectorLabels" -}}
app.kubernetes.io/name: {{ include "forgejo.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Component labels. */}}
{{- define "forgejo.componentLabels" -}}
app.kubernetes.io/component: {{ .component }}
{{- end }}

{{/* Component selector labels. */}}
{{- define "forgejo.componentSelectorLabels" -}}
{{- $root := .root -}}
{{- $component := .component -}}
{{ include "forgejo.selectorLabels" $root }}
app.kubernetes.io/component: {{ $component }}
{{- end }}

{{/* ServiceAccount name helper. */}}
{{- define "forgejo.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "forgejo.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Main HTTP service name helper. */}}
{{- define "forgejo.httpServiceName" -}}
{{- include "forgejo.fullname" . -}}
{{- end }}

{{/* SSH service name helper. */}}
{{- define "forgejo.sshServiceName" -}}
{{- printf "%s-ssh" (include "forgejo.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* HTTPRoute name helper. */}}
{{- define "forgejo.httpRouteName" -}}
{{- printf "%s-route" (include "forgejo.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* TCPRoute name helper. */}}
{{- define "forgejo.tcpRouteName" -}}
{{- printf "%s-ssh-route" (include "forgejo.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Forgejo image helper. */}}
{{- define "forgejo.image" -}}
{{- $fullOverride := .Values.image.fullOverride | default "" -}}
{{- if $fullOverride -}}
{{- $fullOverride -}}
{{- else -}}
{{- $tag := (.Values.image.tag | default .Chart.AppVersion | toString) -}}
{{- if and .Values.image.rootless (not (hasSuffix "-rootless" $tag)) -}}
{{- printf "%s:%s-rootless" .Values.image.repository $tag -}}
{{- else -}}
{{- printf "%s:%s" .Values.image.repository $tag -}}
{{- end -}}
{{- end -}}
{{- end }}

{{/* PersistentVolumeClaim helper. */}}
{{- define "forgejo.persistenceClaimName" -}}
{{- if .Values.persistence.existingClaim -}}
{{- .Values.persistence.existingClaim -}}
{{- else -}}
{{- printf "%s-data" (include "forgejo.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/* Admin secret helper. */}}
{{- define "forgejo.adminSecretName" -}}
{{- if .Values.admin.existingSecret.name -}}
{{- .Values.admin.existingSecret.name -}}
{{- else -}}
{{- printf "%s-admin" (include "forgejo.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end }}

{{/* Inline config secret helper. */}}
{{- define "forgejo.inlineConfigSecretName" -}}
{{- printf "%s-inline-config" (include "forgejo.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Bootstrap scripts secret helper. */}}
{{- define "forgejo.scriptSecretName" -}}
{{- printf "%s-scripts" (include "forgejo.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* CNPG app secret helper. */}}
{{- define "forgejo.cnpg.appConnectionSecretName" -}}
{{- if .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- .Values.database.useCnpgCluster.appConnectionSecretName -}}
{{- else -}}
{{- printf "%s-app" .Values.database.useCnpgCluster.clusterName -}}
{{- end -}}
{{- end }}

{{/* Redis subchart fullname helper mirroring charts/redis/templates/_helpers.tpl. */}}
{{- define "forgejo.redisFullname" -}}
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

{{/* Redis service helper. */}}
{{- define "forgejo.redisServiceName" -}}
{{- $fullname := include "forgejo.redisFullname" . -}}
{{- if (default true .Values.redis.service.addBackwardsCompatibleMaster) -}}
{{- printf "%s-master" $fullname | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $fullname -}}
{{- end -}}
{{- end }}

{{/* Redis secret helper. */}}
{{- define "forgejo.redisSecretName" -}}
{{- if .Values.redis.existingEnvSecret -}}
{{- .Values.redis.existingEnvSecret -}}
{{- else -}}
{{- printf "%s-redis" .Release.Name -}}
{{- end -}}
{{- end }}

{{/* Default internal Forgejo domain. */}}
{{- define "forgejo.defaultDomain" -}}
{{- printf "%s.%s.svc.%s" (include "forgejo.httpServiceName" .) .Release.Namespace .Values.clusterDomain -}}
{{- end }}

{{/* Forgejo work directory helper. */}}
{{- define "forgejo.workDir" -}}
{{- .Values.persistence.mountPath -}}
{{- end }}

{{/* Forgejo custom directory helper. */}}
{{- define "forgejo.customDir" -}}
{{- printf "%s/gitea" (include "forgejo.workDir" .) -}}
{{- end }}

{{/* Forgejo home directory helper. */}}
{{- define "forgejo.homeDir" -}}
{{- printf "%s/git" (include "forgejo.customDir" .) -}}
{{- end }}

{{/* Forgejo app.ini path helper. */}}
{{- define "forgejo.appIniPath" -}}
{{- printf "%s/conf/app.ini" (include "forgejo.customDir" .) -}}
{{- end }}

{{/* Forgejo temp directory helper. */}}
{{- define "forgejo.tempDir" -}}
{{- printf "%s/gitea" .Values.tmpVolume.mountPath -}}
{{- end }}

{{/* Derived ingress URL scheme helper. */}}
{{- define "forgejo.ingressScheme" -}}
{{- if .Values.ingress.tls -}}
https
{{- else -}}
http
{{- end -}}
{{- end }}

{{/* Internal HTTP URL helper. */}}
{{- define "forgejo.internalHttpUrl" -}}
{{- printf "http://%s:%v" (include "forgejo.defaultDomain" .) .Values.service.http.port -}}
{{- end }}

{{/* Public Forgejo URL helper. */}}
{{- define "forgejo.publicUrl" -}}
{{- if .Values.forgejo.publicUrl -}}
{{- trimSuffix "/" .Values.forgejo.publicUrl -}}
{{- else if and .Values.gatewayApi.enabled .Values.gatewayApi.hostnames (gt (len .Values.gatewayApi.hostnames) 0) -}}
{{- printf "%s://%s" .Values.gatewayApi.scheme (index .Values.gatewayApi.hostnames 0) -}}
{{- else if and .Values.ingress.enabled .Values.ingress.hosts (gt (len .Values.ingress.hosts) 0) -}}
{{- printf "%s://%s" (include "forgejo.ingressScheme" .) ((index .Values.ingress.hosts 0).host) -}}
{{- else -}}
{{- include "forgejo.internalHttpUrl" . -}}
{{- end -}}
{{- end }}

{{/* Public Forgejo protocol helper. */}}
{{- define "forgejo.publicProtocol" -}}
{{- $publicUrl := include "forgejo.publicUrl" . -}}
{{- if hasPrefix "https://" $publicUrl -}}
https
{{- else -}}
http
{{- end -}}
{{- end }}

{{/* Public Forgejo host helper. */}}
{{- define "forgejo.publicHost" -}}
{{- if and .Values.gatewayApi.enabled .Values.gatewayApi.hostnames (gt (len .Values.gatewayApi.hostnames) 0) -}}
{{- index .Values.gatewayApi.hostnames 0 -}}
{{- else if and .Values.ingress.enabled .Values.ingress.hosts (gt (len .Values.ingress.hosts) 0) -}}
{{- (index .Values.ingress.hosts 0).host -}}
{{- else if .Values.forgejo.publicUrl -}}
{{- regexReplaceAll "^https?://([^/:]+).*$" .Values.forgejo.publicUrl "${1}" -}}
{{- else -}}
{{- include "forgejo.defaultDomain" . -}}
{{- end -}}
{{- end }}

{{/* SSH domain helper. */}}
{{- define "forgejo.sshDomain" -}}
{{- if .Values.forgejo.sshDomain -}}
{{- .Values.forgejo.sshDomain -}}
{{- else -}}
{{- include "forgejo.publicHost" . -}}
{{- end -}}
{{- end }}

{{/* Effective HTTP listen port helper. */}}
{{- define "forgejo.httpPort" -}}
{{- if and (hasKey .Values.forgejo.config "server") (hasKey .Values.forgejo.config.server "HTTP_PORT") -}}
{{- printf "%v" .Values.forgejo.config.server.HTTP_PORT -}}
{{- else -}}
{{- printf "%v" .Values.service.http.targetPort -}}
{{- end -}}
{{- end }}

{{/* Effective SSH listen port helper. */}}
{{- define "forgejo.sshListenPort" -}}
{{- if and (hasKey .Values.forgejo.config "server") (hasKey .Values.forgejo.config.server "SSH_LISTEN_PORT") -}}
{{- printf "%v" .Values.forgejo.config.server.SSH_LISTEN_PORT -}}
{{- else if .Values.image.rootless -}}
2222
{{- else -}}
22
{{- end -}}
{{- end }}

{{/* Effective SSH advertised port helper. */}}
{{- define "forgejo.sshPort" -}}
{{- if and (hasKey .Values.forgejo.config "server") (hasKey .Values.forgejo.config.server "SSH_PORT") -}}
{{- printf "%v" .Values.forgejo.config.server.SSH_PORT -}}
{{- else -}}
{{- printf "%v" .Values.service.ssh.port -}}
{{- end -}}
{{- end }}

{{/* Allowed top-level generic app.ini keys. */}}
{{- define "forgejo.allowedGeneralKeys" -}}
APP_NAME,RUN_USER,RUN_MODE,APP_SLOGAN,APP_DISPLAY_NAME_FORMAT
{{- end }}

{{/* Initialize expected config sections. */}}
{{- define "forgejo.inlineConfiguration.init" -}}
  {{- range $section := list "server" "database" "security" "metrics" "repository" "cache" "session" "queue" "indexer" "oauth2" "service" "actions" "packages" "log" "mailer" "admin" "other" -}}
    {{- if not (hasKey $.Values.forgejo.config $section) -}}
      {{- $_ := set $.Values.forgejo.config $section dict -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/* Apply chart-managed config defaults. */}}
{{- define "forgejo.inlineConfiguration.defaults" -}}
  {{- include "forgejo.inlineConfiguration.defaults.server" . -}}

  {{- if eq .Values.database.type "sqlite" -}}
    {{- if not .Values.forgejo.config.database.DB_TYPE -}}
      {{- $_ := set .Values.forgejo.config.database "DB_TYPE" "sqlite3" -}}
    {{- end -}}
  {{- else -}}
    {{- if not .Values.forgejo.config.database.DB_TYPE -}}
      {{- $_ := set .Values.forgejo.config.database "DB_TYPE" "postgres" -}}
    {{- end -}}
    {{- if .Values.database.useCnpgCluster.enabled -}}
      {{- if not .Values.forgejo.config.database.HOST -}}
        {{- $_ := set .Values.forgejo.config.database "HOST" (printf "%s-rw:%v" .Values.database.useCnpgCluster.clusterName .Values.database.useCnpgCluster.port) -}}
      {{- end -}}
      {{- if not .Values.forgejo.config.database.SSL_MODE -}}
        {{- $_ := set .Values.forgejo.config.database "SSL_MODE" .Values.database.useCnpgCluster.sslMode -}}
      {{- end -}}
    {{- else -}}
      {{- if not .Values.forgejo.config.database.HOST -}}
        {{- $_ := set .Values.forgejo.config.database "HOST" (printf "%s:%v" .Values.database.postgres.host .Values.database.postgres.port) -}}
      {{- end -}}
      {{- if not .Values.forgejo.config.database.NAME -}}
        {{- $_ := set .Values.forgejo.config.database "NAME" .Values.database.postgres.database -}}
      {{- end -}}
      {{- if not .Values.forgejo.config.database.USER -}}
        {{- $_ := set .Values.forgejo.config.database "USER" .Values.database.postgres.user -}}
      {{- end -}}
      {{- if not .Values.forgejo.config.database.SSL_MODE -}}
        {{- $_ := set .Values.forgejo.config.database "SSL_MODE" .Values.database.postgres.sslMode -}}
      {{- end -}}
    {{- end -}}
  {{- end -}}

  {{- if not .Values.forgejo.config.repository.ROOT -}}
    {{- $_ := set .Values.forgejo.config.repository "ROOT" (printf "%s/git/gitea-repositories" (include "forgejo.workDir" .)) -}}
  {{- end -}}
  {{- if not .Values.forgejo.config.security.INSTALL_LOCK -}}
    {{- $_ := set .Values.forgejo.config.security "INSTALL_LOCK" "true" -}}
  {{- end -}}
  {{- if not (hasKey .Values.forgejo.config.server "APP_DATA_PATH") -}}
    {{- $_ := set .Values.forgejo.config.server "APP_DATA_PATH" (include "forgejo.workDir" .) -}}
  {{- end -}}
  {{- if not (hasKey .Values.forgejo.config.metrics "ENABLED") -}}
    {{- $_ := set .Values.forgejo.config.metrics "ENABLED" false -}}
  {{- end -}}
  {{- if not (get .Values.forgejo.config.session "PROVIDER") -}}
    {{- $_ := set .Values.forgejo.config.session "PROVIDER" "memory" -}}
  {{- end -}}
  {{- if not (get .Values.forgejo.config.session "PROVIDER_CONFIG") -}}
    {{- $_ := set .Values.forgejo.config.session "PROVIDER_CONFIG" "" -}}
  {{- end -}}
  {{- if not (get .Values.forgejo.config.queue "TYPE") -}}
    {{- $_ := set .Values.forgejo.config.queue "TYPE" "level" -}}
  {{- end -}}
  {{- if not (get .Values.forgejo.config.queue "CONN_STR") -}}
    {{- $_ := set .Values.forgejo.config.queue "CONN_STR" "" -}}
  {{- end -}}
  {{- if not (get .Values.forgejo.config.cache "ADAPTER") -}}
    {{- $_ := set .Values.forgejo.config.cache "ADAPTER" "memory" -}}
  {{- end -}}
  {{- if not (get .Values.forgejo.config.cache "HOST") -}}
    {{- $_ := set .Values.forgejo.config.cache "HOST" "" -}}
  {{- end -}}

  {{- if .Values.redisIntegration.enabled -}}
    {{- if not (get .Values.forgejo.config.queue "TYPE") -}}
      {{- $_ := set .Values.forgejo.config.queue "TYPE" "redis" -}}
    {{- else if eq (get .Values.forgejo.config.queue "TYPE") "level" -}}
      {{- $_ := set .Values.forgejo.config.queue "TYPE" "redis" -}}
    {{- end -}}
    {{- if not (get .Values.forgejo.config.cache "ADAPTER") -}}
      {{- $_ := set .Values.forgejo.config.cache "ADAPTER" "redis" -}}
    {{- else if eq (get .Values.forgejo.config.cache "ADAPTER") "memory" -}}
      {{- $_ := set .Values.forgejo.config.cache "ADAPTER" "redis" -}}
    {{- end -}}
    {{- if not (get .Values.forgejo.config.session "PROVIDER") -}}
      {{- $_ := set .Values.forgejo.config.session "PROVIDER" "redis" -}}
    {{- else if eq (get .Values.forgejo.config.session "PROVIDER") "memory" -}}
      {{- $_ := set .Values.forgejo.config.session "PROVIDER" "redis" -}}
    {{- end -}}
  {{- end -}}
{{- end -}}

{{/* Apply default server configuration. */}}
{{- define "forgejo.inlineConfiguration.defaults.server" -}}
  {{- if not .Values.forgejo.config.server.DOMAIN -}}
    {{- $_ := set .Values.forgejo.config.server "DOMAIN" (include "forgejo.publicHost" .) -}}
  {{- end -}}
  {{- if not .Values.forgejo.config.server.HTTP_PORT -}}
    {{- $_ := set .Values.forgejo.config.server "HTTP_PORT" (include "forgejo.httpPort" .) -}}
  {{- end -}}
  {{- if not .Values.forgejo.config.server.PROTOCOL -}}
    {{- $_ := set .Values.forgejo.config.server "PROTOCOL" "http" -}}
  {{- end -}}
  {{- if not .Values.forgejo.config.server.ROOT_URL -}}
    {{- $_ := set .Values.forgejo.config.server "ROOT_URL" (include "forgejo.publicUrl" .) -}}
  {{- end -}}
  {{- if not .Values.forgejo.config.server.SSH_DOMAIN -}}
    {{- $_ := set .Values.forgejo.config.server "SSH_DOMAIN" (include "forgejo.sshDomain" .) -}}
  {{- end -}}
  {{- if not .Values.forgejo.config.server.SSH_PORT -}}
    {{- $_ := set .Values.forgejo.config.server "SSH_PORT" (include "forgejo.sshPort" .) -}}
  {{- end -}}
  {{- if not .Values.forgejo.config.server.SSH_LISTEN_PORT -}}
    {{- $_ := set .Values.forgejo.config.server "SSH_LISTEN_PORT" (include "forgejo.sshListenPort" .) -}}
  {{- end -}}
  {{- if not (hasKey .Values.forgejo.config.server "START_SSH_SERVER") -}}
    {{- $_ := set .Values.forgejo.config.server "START_SSH_SERVER" (.Values.service.ssh.enabled | toString) -}}
  {{- end -}}
{{- end -}}

{{/* Convert forgejo.config values to environment-to-ini files. */}}
{{- define "forgejo.inlineConfiguration" -}}
  {{- include "forgejo.inlineConfiguration.init" . -}}
  {{- include "forgejo.inlineConfiguration.defaults" . -}}

  {{- $allowedGenerals := splitList "," (include "forgejo.allowedGeneralKeys" .) -}}
  {{- $generals := list -}}
  {{- $sections := dict -}}

  {{- range $key, $value := .Values.forgejo.config }}
    {{- if kindIs "map" $value }}
      {{- if gt (len $value) 0 }}
        {{- $section := default (list) (get $sections $key) -}}
        {{- range $subKey, $subValue := $value }}
          {{- $section = append $section (printf "%s=%v" $subKey $subValue) -}}
        {{- end }}
        {{- $_ := set $sections $key (join "\n" $section) -}}
      {{- end -}}
    {{- else }}
      {{- if has $key $allowedGenerals -}}
        {{- $generals = append $generals (printf "%s=%v" $key $value) -}}
      {{- else -}}
        {{- fail (printf "forgejo.config.%s cannot be a top-level scalar; use a nested section map or one of %s." $key (join ", " $allowedGenerals)) -}}
      {{- end -}}
    {{- end }}
  {{- end }}

  {{- $_ := set $sections "_generals_" (join "\n" $generals) -}}
  {{- toYaml $sections -}}
{{- end -}}
