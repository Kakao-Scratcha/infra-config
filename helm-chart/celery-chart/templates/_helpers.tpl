{{/*
Expand the name of the chart.
*/}}
{{- define "celery-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "celery-chart.fullname" -}}
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
{{- define "celery-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "celery-chart.labels" -}}
helm.sh/chart: {{ include "celery-chart.chart" . }}
{{ include "celery-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "celery-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "celery-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Worker labels
*/}}
{{- define "celery-chart.workerLabels" -}}
{{ include "celery-chart.labels" . }}
app.kubernetes.io/component: worker
{{- end }}

{{/*
Beat labels
*/}}
{{- define "celery-chart.beatLabels" -}}
{{ include "celery-chart.labels" . }}
app.kubernetes.io/component: beat
{{- end }}

{{/*
Worker selector labels
*/}}
{{- define "celery-chart.workerSelectorLabels" -}}
{{ include "celery-chart.selectorLabels" . }}
app.kubernetes.io/component: worker
{{- end }}

{{/*
Beat selector labels
*/}}
{{- define "celery-chart.beatSelectorLabels" -}}
{{ include "celery-chart.selectorLabels" . }}
app.kubernetes.io/component: beat
{{- end }}

{{/*
RabbitMQ labels
*/}}
{{- define "celery-chart.rabbitmqLabels" -}}
{{ include "celery-chart.labels" . }}
app.kubernetes.io/component: rabbitmq
{{- end }}

{{/*
RabbitMQ selector labels
*/}}
{{- define "celery-chart.rabbitmqSelectorLabels" -}}
{{ include "celery-chart.selectorLabels" . }}
app.kubernetes.io/component: rabbitmq
{{- end }}