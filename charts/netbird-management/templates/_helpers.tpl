{{- define "netbird-management.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "netbird-management.fullname" -}}
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

{{- define "netbird-management.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "netbird-management.labels" -}}
helm.sh/chart: {{ include "netbird-management.chart" . }}
{{ include "netbird-management.selectorLabels" . }}
{{ if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{ end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "netbird-management.selectorLabels" }}
app.kubernetes.io/name: {{ include "netbird-management.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "netbird-management.serviceAccountName" -}}
{{- if .Values.rbac.serviceAccount.create }}
{{- default (include "netbird-management.fullname" .) .Values.rbac.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.rbac.serviceAccount.name }}
{{- end }}
{{- end }}


{{/* PVC definition for existingClaim, shipped or emptyDir*/}}
{{- define "common.app.management.pvc" -}}
{{- if .Values.management.persistence.enabled -}}
{{- if .Values.management.persistence.existingClaim -}}
- name: {{ .Release.Name }}-management-data
  persistentVolumeClaim:
      claimName: {{ .Values.management.persistence.existingClaim -}}
{{- else -}}
- name: {{ .Release.Name }}-management-data
  persistentVolumeClaim:
    claimName: {{ .Release.Name }}-management-data
{{- end -}}
{{- else -}}
- name: {{ .Release.Name }}-management-data
  emptyDir:
    sizeLimit: {{ .Values.management.persistence.emptyDirSizeLimit }}
{{- end -}}
{{- end -}}

{{- define "common.app.server.pvc" -}}
{{- if .Values.server.persistence.enabled -}}
{{- if .Values.server.persistence.existingClaim -}}
- name: {{ .Release.Name }}-server-data
  persistentVolumeClaim:
      claimName: {{ .Values.server.persistence.existingClaim -}}
{{- else -}}
- name: {{ .Release.Name }}-server-data
  persistentVolumeClaim:
    claimName: {{ .Release.Name }}-server-data
{{- end -}}
{{- else -}}
- name: {{ .Release.Name }}-server-data
  emptyDir:
    sizeLimit: {{ .Values.server.persistence.emptyDirSizeLimit }}
{{- end -}}
{{- end -}}
{{- define "common.app.signal.pvc" -}}
{{- if .Values.signal.persistence.enabled -}}
{{- if .Values.signal.persistence.existingClaim -}}
- name: {{ .Release.Name }}-signal-data
  persistentVolumeClaim:
      claimName: {{ .Values.signal.persistence.existingClaim -}}
{{- else -}}
- name: {{ .Release.Name }}-signal-data
  persistentVolumeClaim:
    claimName: {{ .Release.Name }}-signal-data
{{- end -}}
{{- else -}}
- name: {{ .Release.Name }}-signal-data
  emptyDir:
    sizeLimit: {{ .Values.signal.persistence.emptyDirSizeLimit }}
{{- end -}}
{{- end -}}

{{- define "netbird-management.dashboardAuthEnv" -}}
{{- $dashboardAuthMode := .Values.dashboard.auth.mode | default "legacy" -}}
{{- $dashboardUseIdToken := false -}}
{{- $useEmbedded := and (eq .Values.mode.architecture "combined") (dig "dashboard" "auth" "autoEmbedded" true .Values) (eq $dashboardAuthMode "legacy") -}}
{{- if eq $dashboardAuthMode "legacy" -}}
  {{- if .Values.authentik.useIdToken }}{{- $dashboardUseIdToken = true }}{{- end -}}
{{- else -}}
  {{- if eq .Values.dashboard.auth.tokenSource "idToken" }}{{- $dashboardUseIdToken = true }}{{- end -}}
{{- end -}}
{{- if $dashboardUseIdToken }}
- name: NETBIRD_TOKEN_SOURCE
  value: "idToken"
- name: AUTH_PKCE_USE_ID_TOKEN
  value: "true"
{{- else }}
- name: NETBIRD_TOKEN_SOURCE
  value: "accessToken"
- name: AUTH_PKCE_USE_ID_TOKEN
  value: "false"
{{- end }}
- name: AUTH_AUTHORITY
  value: "{{- if $useEmbedded -}}{{ .Values.dashboard.auth.embeddedIssuer | default .Values.dashboard.auth.issuer | default (printf "https://%s/oauth2" .Values.global.domain) }}{{- else if eq $dashboardAuthMode "legacy" -}}{{ .Values.authentik.issuer }}{{- else -}}{{ .Values.dashboard.auth.issuer }}{{- end -}}"
- name: USE_AUTH0
  value: "false"
- name: AUTH_CLIENT_ID
  {{- if $useEmbedded }}
  value: "{{ .Values.dashboard.auth.embeddedClientId }}"
  {{- else if eq $dashboardAuthMode "legacy" }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.existingAuthentikOidcSecret | default "netbird-authentik-oidc" }}
      key: client-id
  {{- else }}
  value: "{{ .Values.dashboard.auth.clientId }}"
  {{- end }}
- name: AUTH_AUDIENCE
  {{- if $useEmbedded }}
  value: "{{ .Values.dashboard.auth.embeddedClientId }}"
  {{- else if eq $dashboardAuthMode "legacy" }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.existingAuthentikOidcSecret | default "netbird-authentik-oidc" }}
      key: client-id
  {{- else }}
  value: "{{ .Values.dashboard.auth.clientId }}"
  {{- end }}
- name: AUTH_CLIENT_SECRET
  {{- if $useEmbedded }}
  value: ""
  {{- else if eq $dashboardAuthMode "legacy" }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.existingAuthentikOidcSecret | default "netbird-authentik-oidc" }}
      key: client-secret
      optional: true
  {{- else if .Values.dashboard.auth.existingSecretName }}
  valueFrom:
    secretKeyRef:
      name: {{ .Values.dashboard.auth.existingSecretName }}
      key: {{ .Values.dashboard.auth.existingSecretKey }}
      optional: true
  {{- else }}
  value: ""
  {{- end }}
- name: AUTH_SUPPORTED_SCOPES
  value: "{{- if eq $dashboardAuthMode "legacy" -}}{{ .Values.authentik.scopes }}{{- else -}}{{ .Values.dashboard.auth.scopes }}{{- end -}}"
- name: AUTH_REDIRECT_URI
  value: "/auth"
- name: AUTH_SILENT_REDIRECT_URI
  value: "/silent-auth"
{{- end }}
