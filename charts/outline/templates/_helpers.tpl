{{/*
Expand the name of the chart.
*/}}
{{- define "outline.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "outline.fullname" -}}
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
{{- define "outline.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "outline.labels" -}}
helm.sh/chart: {{ include "outline.chart" . }}
{{ include "outline.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "outline.selectorLabels" -}}
app.kubernetes.io/name: {{ include "outline.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "outline.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "outline.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Define outline related database connection strings (postgresql)
*/}}
{{- define "outline.env.database" -}}
{{- if .Values.useCnpgCluster.enabled }}
- name: CNPG_CLUSTER_PSQL_URI
  valueFrom:
    secretKeyRef:
      name: {{ .Values.useCnpgCluster.appConnectionSecretName }}
      key: uri
- name: DATABASE_URL
  value: "$(CNPG_CLUSTER_PSQL_URI)"
{{- else }}
- name: DATABASE_URL
  value: "postgres://{{ .Values.postgresql.auth.username}}:$(PSQL_PASSWORD)@$(PSQL_HOST):5432/{{ .Values.postgresql.auth.database }}"
{{- end }}
{{- end -}}


{{/*
Define outline AWS credentials (minio)*/}}
{{- define "outline.env.minioCreds" -}}
- name: AWS_ACCESS_KEY_ID
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-minio
      key: root-user
- name: AWS_SECRET_ACCESS_KEY
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-minio
      key: root-password
{{- end -}}

{{/*
Define common env vars for minio connections. Note that it is possible, that not all services are using every env var setted within common definitions.
*/}}
{{- define "common.env.minioConnection" -}}
- name: MINIO_HOST
  value: {{ .Release.Name }}-minio:{{ default .Values.minio.service.ports.api 9000 }}
- name: MINIO_ROOT_USER
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-minio
      key: root-user
- name: MINIO_ROOT_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-minio
      key: root-password
{{- end -}}

{{/*
Define common env vars to use redis password protected connections. Note that it is possible, that not all services are using every env var setted within common definitions.
*/}}
{{- define "common.env.redisConnection" -}}
- name: REDIS_HOST
  value: {{ .Release.Name }}-redis-master
- name: REDIS_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-redis
      key: redis-password
{{- end -}}


{{/*
Define common env vars to use postgresql password protected connections. Note that it is possible, that not all services are using every env var setted within common definitions.
*/}}

{{/*Define base postgresql env vars (with password for custom added user).*/}}
{{- define "common.env.postgresqlConnection" -}}
- name: PSQL_HOST
  value: {{ .Release.Name }}-postgresql
- name: PSQL_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-postgresql
      key: password
- name: PSQL_URL
  value: postgres://{{ .Values.postgresql.auth.username }}:$(PSQL_PASSWORD)@$(PSQL_HOST):5432/
{{- end -}}

{{/*Define admin postgresql env vars (with password for postgresql admin user.
    Note that these are the default credentails, when postgres.auth.username won't be provided.
    But you should not use the default admin anyway. ;-)
*/}}
{{- define "common.env.postgresqlAdminConnection" -}}
- name: PSQL_HOST
  value: {{ .Release.Name }}-postgresql
- name: PSQL_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-postgresql
      key: postgres-password
- name: PSQL_URL
  value: postgres://postgres:$(PSQL_PASSWORD)@$(PSQL_HOST):5432/
{{- end -}}

{{/* PVC definition for existingClaim, shipped or emptyDir*/}}
{{- define "common.app.pvc" -}}
{{- if .Values.persistence.enabled -}}
{{- if .Values.persistence.existingClaim -}}
- name: {{ .Release.Name }}-data
  persistentVolumeClaim:
      claimName: {{ .Values.persistence.existingClaim -}}
{{- else -}}
- name: {{ .Release.Name }}-data
  persistentVolumeClaim:
    claimName: {{ .Release.Name }}-data
{{- end -}}
{{- else -}}
- name: {{ .Release.Name }}-data
  emptyDir:
    sizeLimit: {{ .Values.persistence.emptyDirSizeLimit }}
{{- end -}}
{{- end -}}
