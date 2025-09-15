# templates/_helpers.tpl
# This file defines helper templates and functions that can be used
# throughout the other template files. No changes needed here.
{{- define "orchestrator-test-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "orchestrator-test-chart.fullname" -}}
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
{{- end -}}

{{- define "orchestrator-test-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "orchestrator-test-chart.labels" -}}
helm.sh/chart: {{ include "orchestrator-test-chart.chart" . }}
{{ include "orchestrator-test-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "orchestrator-test-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "orchestrator-test-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}